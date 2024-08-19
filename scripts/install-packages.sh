#!/bin/bash

echo "Updating Advanced Packaging Tool (APT) Cache..."
apt-get update

echo "Upgrading Installed Operating System (OS) Packages..."
apt-get upgrade -y

echo "Installing Additional Required OS Packages via APT..."
apt-get install -y samba

echo "Removing Local APT Cache Files..."
rm -rf /var/lib/apt/lists/*
