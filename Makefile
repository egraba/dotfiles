STOW_DIR := $(shell pwd)
TARGET := $(HOME)
PACKAGES := git zsh nvim

.PHONY: install uninstall $(addprefix stow-,$(PACKAGES)) $(addprefix unstow-,$(PACKAGES))

## Install all dotfiles
install:
	@for pkg in $(PACKAGES); do \
		echo "Stowing $$pkg..."; \
		stow --verbose --dir=$(STOW_DIR) --target=$(TARGET) --restow $$pkg; \
	done

## Remove all dotfiles symlinks
uninstall:
	@for pkg in $(PACKAGES); do \
		echo "Unstowing $$pkg..."; \
		stow --verbose --dir=$(STOW_DIR) --target=$(TARGET) --delete $$pkg; \
	done

## Stow individual packages
stow-%:
	stow --verbose --dir=$(STOW_DIR) --target=$(TARGET) --restow $*

## Unstow individual packages
unstow-%:
	stow --verbose --dir=$(STOW_DIR) --target=$(TARGET) --delete $*
