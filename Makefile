MAKEFLAGS += --silent

.DEFAULT_GOAL := run-docker-ci

## Pass arguments through to terraform which require remote state
get fmt version apply console destroy graph plan output providers show validate:
	terraform $@

.PHONY: run-docker-ci
run-docker-ci: init
	$@

-include include.mk
