#!make

keygen:
	@echo "run \"age-keygen -o ~/.age\" to generate a new AGE file"

#encrypt:
#	sops --encrypt ptcdevk8s-kubeconfig-secret.yaml > ptcdevk8s-kubeconfig.sops.yaml
#	sops --encrypt linode-secret.env > linode-secret.sops.env
#
#decrypt:
#	sops --decrypt  ptcdevk8s-kubeconfig.sops.yaml > ptcdevk8s-kubeconfig-secret.yaml
#	sops --decrypt  linode-secret.sops.env > linode-secret.env

encrypt:
	ls *secret.env | sed -e 's/.env//g' | xargs -I{} sops --encrypt --output {}.sops.env {}.env
	ls *secret.yaml | sed -e 's/.yaml//g' | xargs -I{} sops --encrypt --output {}.sops.yaml {}.yaml

decrypt:
	ls *secret.sops.env | sed -e 's/.sops.env//g' | xargs -I{} sops --decrypt --output {}.env {}.sops.env
	ls *secret.sops.yaml | sed -e 's/.sops.yaml//g' | xargs -I{} sops --decrypt --output {}.yaml {}.sops.yaml
