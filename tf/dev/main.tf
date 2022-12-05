data local_file ptcdevs-kubectl {
    filename = "../../config/ptcdevk8s-kubeconfig.yaml"
}

locals {
    ptcdevk8s-kubeconfig = yamldecode(base64decode(data.linode_lke_cluster.ptcdevk8s.kubeconfig))
    k8s = {
        auth                 = {
            cluster-ca-cert = base64decode(local.ptcdevk8s-kubeconfig.clusters[0].cluster.certificate-authority-data)
            endpoint        = local.ptcdevk8s-kubeconfig.clusters[0].cluster.server
            token           = local.ptcdevk8s-kubeconfig.users[0].user.token
        }
    }
    ingress-nginx-namespace = "ingress-nginx"
    ghcrcreds            = {
        "ghcr.io" = {
            email    = "dg@xounges.net"
            username = "vector623"
            password = var.GITHUB_TOKEN
        }
    }
}

provider linode {
    token = var.LINODE_TOKEN
}

data linode_lke_cluster ptcdevk8s {
    id = 77314
}

provider kubernetes {
    alias                  = "ptcdevs"
    host                   = local.k8s.auth.endpoint
    cluster_ca_certificate = local.k8s.auth.cluster-ca-cert
    token                  = local.k8s.auth.token
}

data kubernetes_namespace dev {
    metadata {
        name = "dev"
    }
}

resource kubernetes_secret ghcr-secret {
    metadata {
        name      = "ghcr-secret"
        namespace = data.kubernetes_namespace.dev.metadata[0].name
    }
    type = "kubernetes.io/dockercfg"
    data = {
        ".dockercfg" = jsonencode(local.ghcrcreds)
    }
}