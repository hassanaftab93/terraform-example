# terraform import "module.resource_group.azurerm_resource_group.this" "subscriptionIdHereFromAzure"

.PHONY: bicep-storage
bicep-storage:
	pwsh ./bicep/deploy.ps1 -basePath "." -location "northeurope" -environment "dev"

.PHONY: terraform-init
terraform-init:
ifeq ($(strip $(project)),)
	echo "Error: Please enter a project name"
else
	cd terraform/$(project) && \
	terraform init -upgrade
endif

.PHONY: terraform-validate
terraform-validate: terraform-init
ifeq ($(strip $(project)),)
	echo "Error: Please enter a project name"
else
	cd terraform/$(project) && \
	terraform validate
endif

.PHONY: fmt
fmt:
	cd terraform && \
	terraform fmt -recursive

.PHONY: terraform-plan
terraform-plan: terraform-init
ifeq ($(strip $(project)),)
	echo "Error: Please enter a project name"
else
	cd terraform/$(project) && \
	terraform plan -var-file=tfvars/dev.tfvars -var-file=tfvars/eun_region.tfvars -var-file=tfvars/tags.tfvars -out=$(project).tfplan
endif

.PHONY: terraform-apply
terraform-apply: terraform-plan
ifeq ($(strip $(project)),)
	echo "Error: Please enter a project name"
else
	cd terraform/$(project) && \
	terraform apply $(project).tfplan
endif

.PHONY: terraform-apply-all
terraform-apply-all:
	cd terraform && \
	terraform fmt -recursive && \
	cd resources && \
	terraform plan -var-file=tfvars/dev.tfvars -var-file=tfvars/eun_region.tfvars -var-file=tfvars/tags.tfvars -out=resources.tfplan && \
	terraform apply resources.tfplan && \
	cd ../topics && \
	terraform plan -var-file=tfvars/dev.tfvars -var-file=tfvars/eun_region.tfvars -var-file=tfvars/tags.tfvars -out=topics.tfplan && \
	terraform apply topics.tfplan && \

.PHONY: terraform-destroy
terraform-destroy:
ifeq ($(strip $(project)),)
	echo "Error: Please enter a project name"
else
	cd terraform/$(project) && \
	terraform destroy -var-file=tfvars/dev.tfvars -var-file=tfvars/eun_region.tfvars -var-file=tfvars/tags.tfvars && \
	terraform refresh -var-file=tfvars/dev.tfvars -var-file=tfvars/eun_region.tfvars -var-file=tfvars/tags.tfvars
endif

.PHONY: terraform-refresh
terraform-refresh:
ifeq ($(strip $(project)),)
	echo "Error: Please enter a project name"
else
	cd terraform/$(project) && \
	terraform refresh -var-file=tfvars/dev.tfvars -var-file=tfvars/eun_region.tfvars -var-file=tfvars/tags.tfvars
endif

.PHONY: help
help:
	echo -e '\n\nEnter this command:\n\nmake bicep-storage'
	echo -e '\n\nEnter this command:\n\nmake terraform-init project="ANY_FOLDER_IN_TERRAFORM_DIR"'
	echo -e '\n\nEnter this command:\n\nmake terraform-validate project="ANY_FOLDER_IN_TERRAFORM_DIR"'
	echo -e '\n\nEnter this command:\n\nmake fmt'
	echo -e '\n\nEnter this command:\n\nmake terraform-plan project="ANY_FOLDER_IN_TERRAFORM_DIR"'
	echo -e '\n\nEnter this command:\n\nmake terraform-apply project="ANY_FOLDER_IN_TERRAFORM_DIR"'
	echo -e '\n\nEnter this command:\n\nmake terraform-destroy project="ANY_FOLDER_IN_TERRAFORM_DIR" resourceID="RESOURCE_ID_FROM_AZURE"'
	echo -e '\n\nEnter this command:\n\nmake terraform-refresh project="ANY_FOLDER_IN_TERRAFORM_DIR"'

MAKEFLAGS += --silent