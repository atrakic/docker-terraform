project := docker-terraform

## Initialize terraform remote state
init: render-stack render-tfvars
	[ -d .terraform ] || terraform $@	

.PHONY: render-stack
render-stack:
	[ -n "$(REMOTE_STATE_BACKEND)" ] && test -f vars.env && test -f .$(project).tpl \
		&& . ./vars.env && envsubst < .$(project).tpl > $(project).tf \
		&& echo "$(project).tf generated" || true

.PHONY: render-tfvars
render-tfvars:
	[ -n "$(REMOTE_STATE_BACKEND)" ] && [ -f vars.env ] && [ -f .$(project)-tfvars.tpl ] \
		&& . ./vars.env && envsubst < .$(project)-tfvars.tpl > $(project).auto.tfvars \
		&& echo "$(project).auto.tfvars generated" || true

clean: ## Clean up the project
	rm -rf *.auto.tfvars *.tfplan *.tfstate* $(project).auto.tfvars $(project).tf

