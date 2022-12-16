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
	pip install --upgrade pip
	poetry self update
}

upd_omz() {
	omz update
}

sshk() {
	ssh-keygen -b 4096 -t rsa
}
