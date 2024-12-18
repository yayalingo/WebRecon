#!/bin/bash

# Install the latest version of Go (Go 1.23.4)
echo "Installing Go..."
wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz -O /tmp/go1.23.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xvzf /tmp/go1.23.4.linux-amd64.tar.gz
rm /tmp/go1.23.4.linux-amd64.tar.gz

# Add Go binary path to .bashrc
echo "Adding Go to PATH..."
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

# Verify Go installation
echo "Go installation completed. Verifying..."
go version

# Install Subfinder
echo "Installing Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Httprobe
echo "Installing Httprobe..."
go install github.com/tomnomnom/httprobe@latest

# Install EyeWitness
echo "Cloning and setting up EyeWitness..."
git clone https://github.com/RedSiege/EyeWitness.git
cd EyeWitness || exit
cd ..
echo "Installation is complete."
