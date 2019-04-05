SHELL := /bin/bash

# The directory of this file
DIR := $(shell echo $(shell cd "$(shell  dirname "${BASH_SOURCE[0]}" )" && pwd ))

all: help

# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: all
install: tmux bash git## install all config files
	@echo 'All dotfiles installed'

.PHONY: tmux
tmux: ## install tmux config files
	@bash "$(DIR)/install_tmux.sh"

.PHONY: bash
bash: ## install Bash dotfiles
	@bash -c "cp $(DIR)/bash/bashrc $$HOME/.bashrc"
	@bash -c "cp $(DIR)/bash/bash_aliases $$HOME/.bash_aliases"
	@bash -c "cp $(DIR)/bash/bash_functions $$HOME/.bash_functions"
	@bash -c "cp $(DIR)/bash/bash_prompt $$HOME/.bash_prompt"

.PHONY: git
git: ## install git dotfiles
	@bash -c "cp $(DIR)/gitconfig $$HOME/.gitconfig"

# Build the container
update-submodules: ## Update all submodules
	git submodule update --init --recursive && \
	git submodule foreach git pull --recurse-submodules origin master

gen-vim-info: ## Generate a list of installed vim plugins
	for pluginDir in ~/.vim/bundle/*; do \
		\cd $$pluginDir && \
		bash -c "echo -e \"- [\$$(basename -s .git \$$(git config --get remote.origin.url))](\$$(git config --get remote.origin.url))\""; \
	done

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.

# if this session isn't interactive, then we don't want to allocate a
# TTY, which would fail, but if it is interactive, we do want to attach
# so that the user can send e.g. ^C through.
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./.test.sh
