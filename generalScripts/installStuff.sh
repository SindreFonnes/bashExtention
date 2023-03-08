#!/bin/bash
set -eo pipefail;

sudo apt update;

sudo apt upgrade -y;

sudo apt install \
	build-essential \
	git \
	neovim \
	safe-rm \
	keychain \
	nala \
	gnupg \
	pkg-config \
	libssl-dev \
	zip \
	unzip \
	tar \
	gzip \
	ripgrep \
	net-tools \
	-y;

# Dotnet HTTPS Cert necessary package
# https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-6.0&tabs=visual-studio#ssl-linux
sudo apt-get install -y libnss3-tools;
