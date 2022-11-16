#!/bin/zsh

update() {
	update_brew
	update_omz
}

update_brew() {
	brew update
	brew upgrade
	brew cleanup
}

update_omz() {
	omz update
}
