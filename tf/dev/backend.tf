terraform {
  backend s3 {
    bucket                      = "ptcdevs-tf-states"
    key                         = "python-restapi.tfstate"
    region                      = "us-east-1"
    endpoint                    = "us-southeast-1.linodeobjects.com"    # e.g. us-est-1.linodeobjects.com
    skip_credentials_validation = true                # just do it
    profile                     = "linode-s3"
  }
}

