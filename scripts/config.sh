# -----------------------------------------------------------------------------
# Common configuration for all scripts
# -----------------------------------------------------------------------------
ROOT="${TOP}/.."
SDK_REPO="https://github.com/wultra/powerauth-mobile-sdk.git"
SDK_DIR="${ROOT}/sdk-sources"
BUILD_DIR="${ROOT}/frameworks"
TPM_DIR="${ROOT}/tmp"
PACKAGE_SWIFT="${ROOT}/Package.swift"
DEV_RELEASE='0.0.10'

# -----------------------------------------------------------------------------
# CHECK_XCODE_VERSION checks whether xcode installed on the system is right
# -----------------------------------------------------------------------------
function CHECK_XCODE_VERSION
{
    local xcodever=( $(GET_XCODE_VERSION --split) )
    if (( ${xcodever[0]} == -1)); then
        FAILURE "Invalid Xcode installation"
    fi
    local invalid=0
    if (( ${xcodever[0]} == 12)); then
        # Xcode 12
        if (( ${xcodever[1]} < 2)); then
            # Xcode 12.0 or 12.1
            invalid=1
        fi    
    else
        invalid=1
    fi
    if [ x$invalid == x1 ]; then
        FAILURE "Invalid Xcode version. Only Xcode 12.2 up to 12.5 are supported."
    fi
}