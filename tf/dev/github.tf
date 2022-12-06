data github_repository python-restapi {
  name = "python-restapi"
}

resource github_repository_environment dev {
  environment = "dev"
  repository = data.github_repository.python-restapi.name
}

resource github_actions_environment_secret github-token {
  environment = github_repository_environment.dev.environment
  repository = data.github_repository.python-restapi.name
  secret_name = "GHCR_GITHUB_TOKEN"
  plaintext_value = var.GITHUB_TOKEN
}

data local_sensitive_file kubeconfig {
  filename = "../../config/ptcdevk8s-kubeconfig.yaml"
}

resource github_actions_environment_secret kubeconfig {
  environment = github_repository_environment.dev.environment
  repository = data.github_repository.python-restapi.name
  secret_name = "KUBECONFIG"
  plaintext_value = data.local_sensitive_file.kubeconfig.content
}
