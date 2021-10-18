#!/bin/bash
###############################################################################
# Include common functions...
# -----------------------------------------------------------------------------
TOP=$(dirname $0)
source "${TOP}/common-functions.sh"
source "${TOP}/config.sh"
source "${TOP}/github-client.sh"

# -----------------------------------------------------------------------------
# USAGE prints help and exits the script with error code from provided parameter
# Parameters:
#   $1   - error code to be used as return code from the script
# -----------------------------------------------------------------------------
function USAGE
{
    echo ""
    echo "Usage:  $CMD  version  [options]"
    echo ""
    echo "  Script deploys PowerAuth2.xcframework and PowerAuthCore.xcframework"
    echo "  with a specific version into the github release."
    echo ""
    echo "    version        Existing PowerAuth mobile SDK version to prepare"
    echo "                   for Swift Package Manager inregration. Only X.Y.Z"
    echo "                   format is accepted"
    echo ""
    echo "options are:"
    echo ""
    echo "    -r version | --release-version version"
    echo "                   set custom release version if it's different"
    echo "                   than PowerAuth mobile SDK version"
    echo "    -v0            turn off all prints to stdout"
    echo "    -v1            print only basic log about build progress"
    echo "    -v2            print full build log with rich debug info"
    echo "    -h | --help    print this help information"
    echo ""
    exit $1
}

function BUILD_LIBS
{
    "${TOP}/build.sh" $VERSION $OPT_VERBOSE
}

function INITIALIZE_GITHUB_CLIENT
{
    PUSH_DIR "${TOP}"
    
    LOAD_API_CREDENTIALS
    [[ -z "$GITHUB_RELEASE_ACCESS" ]] && FAILURE "Missing \$GITHUB_RELEASE_ACCESS variable in .lime-credentials file."
    
    # Split credentials into user & token
    local ACCESS=(${GITHUB_RELEASE_ACCESS//:/ })
    local USER=${ACCESS[0]}
    local TOKEN=${ACCESS[1]}
    [[ -z "$USER" ]] && FAILURE "Missing user in github access."
    [[ -z "$TOKEN" ]] && FAILURE "Missing access token in github access."
    
    local ORIGIN=`git remote get-url origin`
    local SITE=`echo $ORIGIN | cut -d'/' -f3`
    local ORG=`echo $ORIGIN | cut -d'/' -f4`
    local REPO=`echo $ORIGIN | cut -d'/' -f5 | cut -d'.' -f1`
    
    [[ "$SITE" != "github.com" ]] && FAILURE "SPM repository must be cloned from github.com, with using HTTPS protocol."
    
    DEBUG_LOG "Going to publish to $ORG/$REPO with $USER identity"
    
    GITHUB_INIT $ORG $REPO ${USER} ${TOKEN}
    
    # Keep base URL for later
    DEPLOY_BASE_URL="https://$SITE/$ORG/$REPO"
    POP_DIR
}

function PREPARE_PACKAGE
{
    local VER=$OPT_RELEASE_VERSION
    PA_SDK_FW="PowerAuth2.xcframework"
    PA_SDK_ZIP="PowerAuth2-$VERSION.xcframework.zip"
    
    PA_CORE_FW="PowerAuthCore.xcframework"
    PA_CORE_ZIP="PowerAuthCore-$VERSION.xcframework.zip"
    
    LOG_LINE
    if [ $VER != $VERSION ]; then
        LOG "Preparing SPM release $VER based on PowerAuth SDK $VERSION ..."
    else
        LOG "Preparing SPM release $VER ..."
    fi
    
    PUSH_DIR "${BUILD_DIR}"
    
    LOG "Creating $PA_CORE_ZIP archive..."
    [[ -f "$PA_CORE_ZIP" ]] && $RM "$PA_CORE_ZIP"
    zip -9yrq "$PA_CORE_ZIP" "$PA_CORE_FW"
    PA_CORE_HASH=$(SHA256 "$PA_CORE_ZIP")
    DEBUG_LOG "   - Hash: $PA_CORE_HASH"
    
    LOG "Creating $PA_SDK_ZIP archive..."
    [[ -f "$PA_SDK_ZIP" ]] && $RM "$PA_SDK_ZIP"
    zip -9yrq "$PA_SDK_ZIP" "$PA_SDK_FW"
    PA_SDK_HASH=$(SHA256 "$PA_SDK_ZIP")
    DEBUG_LOG "   - Hash: $PA_SDK_HASH"
    
    LOG "Creating Package.swift ..."
    
    local TMP_PKG="${PACKAGE_SWIFT}.tmp"
    local OUT_PKG="${PACKAGE_SWIFT}"
    sed -e "s/%VERSION%/$VER/g" "${TOP}/templates/Package.swift" > "${TMP_PKG}"
    sed -e "s|%BASE_URL%|$DEPLOY_BASE_URL|g" "${TMP_PKG}" > "${OUT_PKG}"
    sed -e "s/%SDK_ZIP%/$PA_SDK_ZIP/g" "${OUT_PKG}" > "${TMP_PKG}"
    sed -e "s/%SDK_CHECKSUM%/$PA_SDK_HASH/g" "${TMP_PKG}" > "${OUT_PKG}"
    sed -e "s/%CORE_ZIP%/$PA_CORE_ZIP/g" "${OUT_PKG}" > "${TMP_PKG}"
    sed -e "s/%CORE_CHECKSUM%/$PA_CORE_HASH/g" "${TMP_PKG}" > "${OUT_PKG}"
    $RM "${TMP_PKG}"
    POP_DIR
}

function PUBLISH_RELEASE
{
    local VER=$OPT_RELEASE_VERSION
    
    local GIT_VERBOSE=
    if [ x$VERBOSE != x2 ]; then
        GIT_VERBOSE="--quiet"
    fi
    
    LOG_LINE
    if [ $VER != $VERSION ]; then
        LOG "Publishing PowerAuth mobile SDK $VERSION for SPM release $VER..."
    else
        LOG "Publishing PowerAuth mobile SDK $VERSION for SPM..."
    fi
    
    PUSH_DIR "${ROOT}"
    
    # --- commit & push changes ---
    
    LOG "Commiting all chages..."
    git add "Package.swift" $GIT_VERBOSE
    git commit -m "Deployment: Update release files to ${VER}" $GIT_VERBOSE
    
    LOG "Creating tag for version..."
    git tag -a ${VER} -m "Version ${VER}" $GIT_VERBOSE
    
    LOG "Pushing all changes..."
    git push --follow-tag $GIT_VERBOSE
    
    # --- upload to github ---
    
    LOG "Creating release at github..."
    PUSH_DIR "${BUILD_DIR}"
    
    local rel_json="$GHC_TMP/rel.json"
    
    GITHUB_CREATE_RELEASE "${VER}" "${VER}" "- PowerAuth mobile SDK $VERSION" false false "$rel_json"
        
    LOG "Uploading $PA_CORE_ZIP ..."
    GITHUB_UPLOAD_RELEASE_ASSET "$rel_json" "$PA_CORE_ZIP" "$PA_CORE_ZIP" 'application/zip'
    
    LOG "Uploading $PA_SDK_ZIP ..."
    GITHUB_UPLOAD_RELEASE_ASSET "$rel_json" "$PA_SDK_ZIP" "$PA_SDK_ZIP" 'application/zip'
    
    GITHUB_DEINIT
    
    POP_DIR
    POP_DIR
    
    LOG_LINE
    LOG "Now you can edit release notes at  : $DEPLOY_BASE_URL/releases/$VER"
    LOG_LINE
}

OPT_VERBOSE=
OPT_RELEASE_VERSION=

# -----------------------------------------------------------------------------
# Main script starts here

while [[ $# -gt 0 ]]
do
    opt="$1"
    case "$opt" in
        -v*)
            SET_VERBOSE_LEVEL_FROM_SWITCH $opt 
            OPT_VERBOSE=$opt
            ;;
        -h | --help)
            USAGE 0
            ;;
        -r | --release-version)
            OPT_RELEASE_VERSION=$2
            shift
            ;;
        *)
            VALIDATE_AND_SET_VERSION_STRING $opt 
            OPT_RELEASE_VERSION=$opt
            ;;
    esac
    shift
done

[[ -z "$VERSION" ]] && FAILURE "You must specify version to build."

REQUIRE_COMMAND zip
REQUIRE_COMMAND git
REQUIRE_COMMAND jq
REQUIRE_COMMAND curl

BUILD_LIBS
INITIALIZE_GITHUB_CLIENT
PREPARE_PACKAGE
PUBLISH_RELEASE

EXIT_SUCCESS
