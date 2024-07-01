if ! command -v nix &> /dev/null
then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi

if command -v nix &> /dev/null
then
    if ! command -v home-manager &> /dev/null
    then
        nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
        nix-channel --update
        nix-shell '<home-manager>' -A install
    fi
fi

