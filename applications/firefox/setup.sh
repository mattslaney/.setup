#!/bin/bash

install_firefox() {
    # Create a directory to store APT repository keys if it doesn't exist:
    sudo install -d -m 0755 /etc/apt/keyrings
    # Import the Mozilla APT repository signing key: 
    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
    # Check fingerprint
    gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
    # add the Mozilla APT repository to the sources list: 
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
    # Configure APT to prioritize packages from the Mozilla repository: 
    echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 
    # Update your package list and install the Firefox .deb package: 
    sudo apt-get update && sudo apt-get install -y firefox
}

# Check if snap is installed
if command -v snap &> /dev/null; then
    echo "Snap is installed."

    # Check if firefox is installed using snap
    if snap list | grep -q firefox; then
        echo "Firefox is installed using snap. Uninstalling..."
        sudo snap remove firefox
    fi
    install_firefox
else
    echo "Snap is not installed."
    # Check if firefox is installed
    if ! command -v firefox &> /dev/null; then
        echo "Firefox is not installed. Installing using apt..."
        install_firefox
    else
        echo "Firefox is already installed."
    fi
fi

