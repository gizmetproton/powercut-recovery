#!/bin/bash

# Gizmet's PowerCut Recovery Tool Installer ☠️
echo "
⚡ ☠️  GIZMET'S POWERCUT RECOVERY TOOL ☠️ ⚡
     Setting sail on your system...
"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "🏴‍☠️  Arrr! You need captain's privileges for this operation!"
    echo "    Please run with: sudo $0"
    exit 1
fi

echo "🗺️  Charting the course..."
# Create installation directory
install -d /usr/local/share/powercut

echo "📦 Loading cargo into the hold..."
# Copy all scripts
cp scripts/* /usr/local/share/powercut/

echo "🔒 Securing the hatches..."
# Set permissions
chmod 755 /usr/local/share/powercut/*

echo "⚓ Dropping anchor in /usr/local/bin..."
# Create symlink
ln -sf /usr/local/share/powercut/powercut /usr/local/bin/powercut

# Update module paths in all scripts to use absolute paths
echo "🔧 Adjusting the rigging..."
for script in /usr/local/share/powercut/*.sh; do
    sed -i 's|source "$(dirname "$0")/utils.sh"|source "/usr/local/share/powercut/utils.sh"|' "$script"
done

# Update main script to use absolute path
sed -i 's|MODULE_DIR="$(dirname "$0")"|MODULE_DIR="/usr/local/share/powercut"|' /usr/local/share/powercut/powercut

echo "
🎉 Installation complete! Your ship is ready to sail!
   Run 'powercut' from anywhere to start your adventure.

   Fair winds and following seas! ⛵
"
