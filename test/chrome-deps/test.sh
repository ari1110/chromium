#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'chrome-deps' feature with default options.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib

# Detect OS
. /etc/os-release

echo "Testing package installations..."

# Function to check package installation
check_package() {
    local package=$1
    local description=$2
    if dpkg -l | grep -q "^ii.*$package"; then
        echo "✓ $description"
        return 0
    else
        echo "✗ $description"
        return 1
    fi
}

# Check for appropriate chromium package based on OS
if [ "$ID" = "debian" ]; then
    check_package "chromium" "Chromium is installed"
else
    check_package "chromium-browser" "Chromium is installed"
fi

# Check sound package based on Ubuntu version
if [ "$ID" = "ubuntu" ] && [ "${VERSION_ID%%.*}" -ge "24" ]; then
    check_package "libasound2t64" "Sound library is installed"
else
    check_package "libasound2" "Sound library is installed"
fi

# Check other dependencies
check_package "libgbm1" "libgbm1 is installed"
check_package "libnss3" "libnss3 is installed"

# Check jq installation
if command -v jq >/dev/null 2>&1; then
    echo "✓ jq is installed"
else
    echo "✗ jq is not installed"
    exit 1
fi

#check additional dependencies for Electron Support
check_package "dbus" "libgbm1 is installed"
check_package "dbus-x11" "libnss3 is installed"
check_package "libgl1-mesa-glx" "libgl1-mesa-glx is installed"
check_package "libgl1-mesa-dri" "libgl1-mesa-dri is installed"
check_package "mesa-utils" "mesa-utils is installed"


echo "All tests completed successfully!"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
