if ! command -v waterfox &> /dev/null
then
cd ~/Downloads
wget https://cdn1.waterfox.net/waterfox/releases/latest/linux -O waterfox.tar.bz2
# wget https://cdn1.waterfox.net/waterfox/releases/G6.0.16/Linux_x86_64/waterfox-G6.0.16.tar.bz2

waterfox_file=$(find . -name "waterfox*.tar.bz2" -print -quit)

if [ -z "$waterfox_file" ]; then
    echo "Waterfox tar.bz2 file not found."
    exit 1
fi

tar -xvf "$waterfox_file"

sudo mv waterfox /usr/local/

sudo ln -s /usr/local/waterfox/waterfox /usr/local/bin/

# Create waterfox.desktop file in /usr/share/applications
cat <<EOF | sudo tee /usr/share/applications/waterfox.desktop
[Desktop Entry]
Version=1.0
Name=Waterfox
Comment=Free and open-source web browser
Exec=/usr/local/bin/waterfox
Icon=/usr/local/waterfox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOF

echo "Waterfox installed successfully."
else
echo "Waterfox already installed"
fi
