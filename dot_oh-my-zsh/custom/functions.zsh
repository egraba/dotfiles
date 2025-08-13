#!/bin/zsh

#
# Upgrade development environment.
#
upd() {
	upd_brew
	upd_rust
	upd_python
	upd_omz # Must be at the end, as shell might be refreshed.
}

#
# Upgrade brew-related packages.
#
upd_brew() {
	if command -v brew &> /dev/null; then
    		echo "Brew is installed"
		brew update
		brew upgrade
		brew cleanup
	else
    		echo "Brew is not installed"
	fi
}

#
# Upgrade rustup.
#
upd_rust() {
	if command -v rustup &> /dev/null; then
		echo "Rust is installed"
		rustup update
	else
		echo "Rust is not installed"
	fi
}

#
# Upgrade Python.
#
upd_python() {
	pipx upgrade-all
}

upd_omz() {
	omz update
}

sshk() {
	ssh-keygen -b 4096 -t rsa
}

#
# Python-specific
#
generate_django_secret_key() {
	python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
}
