#!/bin/bash

set -eo pipefail;

name="Azure cli";
commandAlias="az"

source $MYINSTALL_COMMON_FUNCTIONS_LOCATION;

if ! script_check_if_allready_installed "$commandAlias" "$name"; then
	exit 1;
fi

install_for_mac () {
	brew update &&
	brew install azure-cli &&
	script_success_message "$name";
	exit 0;
}

install_for_apt () {
	sudo apt update;

	curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash;
	script_success_message "$name";
	exit 0;
}

if is_mac_os; then
	install_for_mac;
fi

if apt_package_manager_available; then
	install_for_apt;
fi

script_does_not_support_os "$name";

exit 1;
