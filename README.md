# Python REST API

this project will host a backend rest api, coupled with swagger ui

# Getting started

## Python RestAPI

### Setup pycharm python interpreter

Settings -> Project: `python-restapi` -> Python Interpreter

Click Add Interpreter -> Add Local Interpreter

Select New, Location `PROJECTROOT/python-restapi/venv`, Base interpreter: `/usr/bin/python3.10`

### Open new terminal

If you don't see `(venv)` at the start of your command prompt, run

  `source venv/bin/activate`

### Install pip requirements

Run`make requirements` OR `pip install -r requirements.txt`

### Run dev server

Run `make dev-run` OR `uvicorn app.main:app --reload`

### Build, run and push docker image

Using the Makefile:

    make docker-login user=YOUR_GITHUB_USER
    make docker-build
    make docker-run
    make docker-push

Alternatively:

    # login to github's docker registry
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin

    # build docker image
	docker build -t ghcr.io/ptcdevs/python-restapi:latest .

    # run docker image locally
	docker run -p 8000:8000 --name python-restapi-latest ghcr.io/ptcdevs/python-restapi:latest

    # push docker image
	docker push ghcr.io/ptcdevs/python-restapi:latest

## Terraform

### Github

Make sure `GITHUB_TOKEN` is set to a PAT in the environment.

### Linode

Set `~/.age` to the following

    # created: 2022-10-22T19:33:09-04:00
    # public key: age157regwcpk9srausy2l8q7ttv98urmwxqs2kcpd6nkfwyuej8py8s804e9a
    AGE-SECRET-KEY-#######

Then run `make decrypt` in `config/` to decrypt the `LINODE_TOKEN` environment variable.

Then run `direnv allow` in `tf/dev/` to load the `LINODE_TOKEN` environment variable.

### Linode object storage (for terraform backend)

See this link for terraform backend provisioning on linode (using S3 protocol): <https://dev.to/itmecho/setting-up-linode-object-storage-as-a-terraform-backend-1ocbI>

To configure linode object storage access in local environment, append to the following files:

    # ~/.aws/config
    [profile linode-s3]
    output = text
    region = us-southeast-1

    # ~/.aws/credentials
    [linode-s3]
    aws_access_key_id=#####
    aws_secret_access_key=#####

Key and seret are generated here: <https://cloud.linode.com/object-storage/access-keys>.

### Kubernetes

Download the kubeconfig file from <https://cloud.linode.com/kubernetes/clusters>. Save to ~/.kube/config/ptcdevk8s-kubeconfig.yaml.

Add to .bashrc/.zshrc/.zshenv/etc

    export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/configs/ptcdevk8s-kubeconfig.yaml

Then kubectl should load the lke context:

    $ kubectl config get-contexts
    CURRENT   NAME                CLUSTER             AUTHINFO                  NAMESPACE
              do-nyc3-ptcdevk8s   do-nyc3-ptcdevk8s   do-nyc3-ptcdevk8s-admin   
    *         lke77314-ctx        lke77314            lke77314-admin            default


# Reference documentation

* FastAPI: <https://fastapi.tiangolo.com/>
  * GitHub: <https://github.com/tiangolo/fastapi>
  * tutorial: <https://fastapi.tiangolo.com/tutorial/>
