#!/bin/zsh

upd() {
	upd_brew
	upd_rust
	upd_java
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

upd_java() {
	sdk selfupdate
	sdk update java
}

upd_omz() {
	omz update
}

sshk() {
	ssh-keygen -b 4096 -t rsa
}
