#!/bin/sh
set -e

echo "Installing Chrome dependencies..."

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Install dependencies
apt_get_update

# Detect OS
. /etc/os-release

# Determine Chrome package based on OS
if [ "$ID" = "debian" ]; then
    CHROME_PACKAGE="chromium"
else
    CHROME_PACKAGE="chromium-browser"
fi

# Determine sound package based on Ubuntu version
SOUND_PACKAGE="libasound2"
if [ "$ID" = "ubuntu" ] && [ "${VERSION_ID%%.*}" -ge "24" ]; then
    SOUND_PACKAGE="libasound2t64"
fi

apt-get install -y \
    $CHROME_PACKAGE \
    $SOUND_PACKAGE \
    libgbm1 \
    libnss3 \
    sudo \
    jq \
    dbus \
    dbus-x11 \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "Done installing Chrome dependencies!"
