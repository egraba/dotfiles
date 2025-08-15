#!/bin/zsh

#
# Update development environment.
#
upd() {
	update_brew
	update_rust
	update_python
	update_omz # Must be at the end, as shell might be refreshed.
}

command_exists() {
	command -v $1 &> /dev/null
}

update_brew() {
	if command_exists brew; then
		echo "Brew is installed"
		brew update
		brew upgrade
		brew cleanup
		brew doctor
	else
		echo "Brew is not installed"
	fi
}

update_rust() {
	if command_exists rustup; then
		echo "Rust is installed"
		rustup self update
		rustup update
	else
		echo "Rust is not installed"
	fi
}

update_python() {
	if command_exists uv; then
		echo "uv is installed"
		uv self update
	else
		echo "uv is not installed"
	fi
}

update_omz() {
	if command_exists omz; then
		echo "Oh-My-Zsh is installed"
		omz update
	else
		echo "Oh-My-Zsh is not installed"
	fi
}

#
# Generate a new SSH key pair.
#
sshk() {
	ssh-keygen -b 4096 -t rsa
}

#
# Generate a new Django secret key.
# This function has to be exectued in a virtual env, using uv.
#
generate_django_secret_key() {
	uv run python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
}
