#!/bin/bash

# ENV
NAME=$1
REPO="https://aur.archlinux.org/${NAME}.git"
DIR="$HOME/aur/${NAME}"

# Copy
mkdir -p $DIR
git clone $REPO $DIR

# Build package
cd $DIR && makepkg -sic --noconfirm --needed

echo -n "Clean directory (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  rm -rf $DIR
fi
