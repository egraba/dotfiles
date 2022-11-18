#!/bin/zsh

update() {
	update_brew
	update_rust
	update_java
	update_omz # Must be at the end, as shell might be refreshed.
}

update_omz() {
	omz update
}

update_brew() {
	brew update
	brew upgrade
	brew cleanup
}

update_rust() {
	rustup update
}

update_java() {
	sdk selfupdate
	sdk update java
}
