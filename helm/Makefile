#!make

GITREF=`git rev-parse --abbrev-ref HEAD |  sed -e 's/\(.*\)/\L\1/'`
export

env:
	@echo "GITREF: ${GITREF}"
	@echo "K8S_NAMESPACE: ${K8S_NAMESPACE}"

template:
	helm template ./python-restapi

uninstall:
	helm -n ${K8S_NAMESPACE} uninstall python-restapi-${GITREF}

install:
	helm -n ${K8S_NAMESPACE} install python-restapi-${GITREF} ./python-restapi \
		--set image.tag=${GITREF}

reinstall: uninstall install