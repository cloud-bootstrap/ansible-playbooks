SHELL 				:=/bin/bash
ROOT_DIR			:=$(shell pwd)

.PHONY: help

setup:: ## Download all roles
	@echo "Downloading all roles"
	@ansible-galaxy install -p roles -r requirements.yml

run:: setup ## Run a Playbook
	@echo "Running Playbook $(PLAYBOOK_NAME)"
	@ansible-playbook -v -i "localhost," -c local $(PLAYBOOK_NAME)

# A help target including self-documenting targets (see the awk statement)
help: ## This help target
	$(logo)
	@echo "Run an ansible playbook. "
	@echo "Mandatory Params are PLAYBOOK_NAME"
	@echo "$$HELP_TEXT"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / \
		{printf "\033[36m%-30s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)
