#!/bin/bash
###############################################################################
# Include common functions...
# -----------------------------------------------------------------------------
TOP=$(dirname $0)
source "${TOP}/common-functions.sh"
source "${TOP}/config.sh"

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
    echo "  Script build PowerAuth2.xcframework and PowerAuthCore.xcframework"
    echo "  with a specific version at the predefined local path."
    echo ""
    echo "version            Existing PowerAuth mobile SDK version to prepare"
    echo "                   for Swift Package Manager inregration. Only X.Y.Z"
    echo "                   format is accepted"
    echo ""
    echo "options are:"
    echo "    -v0            turn off all prints to stdout"
    echo "    -v1            print only basic log about build progress"
    echo "    -v2            print full build log with rich debug info"
    echo "    -h | --help    print this help information"
    echo ""
    exit $1
}

OPT_VERBOSE=""

function CLONE_SOURCES
{
    "${TOP}/clone.sh" $VERSION $OPT_VERBOSE
    if [ ! -f "$SDK_DIR/scripts/ios-build-sdk.sh" ]; then
        FAILURE "Incompatible version of PowerAuth mobile SDK."
    fi
    local SUPPORTS_SDK=`$SDK_DIR/scripts/ios-build-sdk.sh -h | grep buildSdk`
    if [ -z "$SUPPORTS_SDK" ]; then
        FAILURE "Incompatible version of PowerAuth mobile SDK."
    fi
}

function BUILD_FRAMEWORKS
{
    LOG "Building PowerAuthCore.xcframework..."
    "$SDK_DIR/scripts/ios-build-sdk.sh" buildCore buildSdk --out-dir "$BUILD_DIR" --tmp-dir "$TMP_DIR" $OPT_VERBOSE
}

# -----------------------------------------------------------------------------
# Main script starts here

while [[ $# -gt 0 ]]
do
    opt="$1"
    case "$opt" in
        -v*)
            SET_VERBOSE_LEVEL_FROM_SWITCH $opt 
            OPT_VERBOSE=$opt;;
        -h | --help)
            USAGE 0 ;;
        *)
            VALIDATE_AND_SET_VERSION_STRING $opt ;;
    esac
    shift
done

[[ -z "$VERSION" ]] && FAILURE "You must specify version to build."

CLONE_SOURCES
BUILD_FRAMEWORKS

EXIT_SUCCESS
