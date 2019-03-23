#!/usr/bin/env bash

set -euo pipefail

PACKAGE_URL='https://downloads.sourceforge.net/project/imwheel/imwheel-source/1.0.0pre12/imwheel-1.0.0pre12.tar.gz'

dnf upgrade -y
dnf install -y \
    @development-tools \
    xorg-x11-server-devel \
    libXtst-devel \
    libXmu-devel

mkdir /source
mkdir /staging
mkdir /output
cd /source
curl -L "$PACKAGE_URL" -o src.tar.gz
tar -xz --strip-components=1 -f src.tar.gz
./configure
make "-j$(nproc)"
make install DESTDIR=/staging

dnf install -y tree
cd /staging
tree
