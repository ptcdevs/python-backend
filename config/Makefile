#!make

keygen:
	@echo "run \"age-keygen -o ~/.age\" to generate a new AGE file"

encrypt:
	sops --encrypt ptcdevk8s-kubeconfig.yaml > ptcdevk8s-kubeconfig.sops.yaml
	sops --encrypt linode-secret.env > linode-secret.sops.env


decrypt:
	sops --decrypt  ptcdevk8s-kubeconfig.sops.yaml > ptcdevk8s-kubeconfig.yaml
	sops --decrypt  linode-secret.sops.env > linode-secret.env
