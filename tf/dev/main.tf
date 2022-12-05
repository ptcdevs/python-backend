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
    provider = kubernetes.ptcdevs
    metadata {
        name = "dev"
    }
}

resource kubernetes_secret ghcr-secret {
    provider = kubernetes.ptcdevs
    metadata {
        name      = "ghcr-secret"
        namespace = data.kubernetes_namespace.dev.metadata[0].name
    }
    type = "kubernetes.io/dockercfg"
    data = {
        ".dockercfg" = jsonencode(local.ghcrcreds)
    }
}