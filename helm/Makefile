#!make

GITREF=`git rev-parse --abbrev-ref HEAD |  sed -e 's/\(.*\)/\L\1/'`
export

env:
	@echo "GITREF: ${GITREF}"
	@echo "K8S_NAMESPACE: ${K8S_NAMESPACE}"

template:
	helm template ./python-restapi