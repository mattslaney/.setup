#!/bin/bash

export SDKMAN_DIR="$HOME/.sdkman"

if [ ! -d "$SDKMAN_DIR" ]; then
    curl -s "https://get.sdkman.io" | bash
fi

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk selfupdate
sdk install java 17.0.11-amzn
sdk install gradle
sdk install scala
sdk install sbt
