# -----------------------------------------------------------------------------
# Common configuration for all scripts
#
# SDK_REPO    - URL of PowerAuth mobile SDK
# SDK_DIR     - local directory where PowerAuth mobile SDK is cloned
# BUILD_DIR   - Build directory, where final XCFrameworks are prepared
# -----------------------------------------------------------------------------
SDK_REPO="https://github.com/wultra/powerauth-mobile-sdk.git"
SDK_DIR="${TOP}/sdk-sources"
BUILD_DIR="${TOP}/frameworks"
TPM_DIR="${TOP}/tmp"

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
    [[ x$invalid == x1 ]] && FAILURE "Invalid Xcode version. Only Xcode 12.2 up to 12.5 are supported."
}