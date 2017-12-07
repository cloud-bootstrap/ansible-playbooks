SHELL 				:=/bin/bash
ROOT_DIR			:=$(shell pwd)

export http_proxy = $(HTTP_PROXY)
export https_proxy = $(HTTPS_PROXY)
export no_proxy = $(NO_PROXY)

.PHONY: help

setup:: ## Download all roles
	@echo "Downloading all roles"
	@ansible-galaxy install -p roles -r requirements.yml

run:: setup ## Run a Playbook
	@echo "Running Playbook $(PLAYBOOK_NAME)"
	@ansible-playbook -vvv -i "localhost," -c local $(PLAYBOOK_NAME)

# A help target including self-documenting targets (see the awk statement)
help: ## This help target
	$(logo)
	@echo "Run an ansible playbook. "
	@echo "Mandatory Params are PLAYBOOK_NAME"
	@echo "$$HELP_TEXT"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / \
		{printf "\033[36m%-30s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)
