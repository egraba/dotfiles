#!/bin/zsh

upd() {
	upd_brew
	upd_rust
	upd_python
	upd_omz # Must be at the end, as shell might be refreshed.
}

upd_brew() {
	brew update
	brew upgrade
	brew cleanup
}

upd_rust() {
	rustup update
}

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
