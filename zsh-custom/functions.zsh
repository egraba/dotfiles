#!/bin/zsh

update() {
	brew update
	brew upgrade
	brew cleanup
}
