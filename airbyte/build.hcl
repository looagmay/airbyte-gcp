metadata {
  name = "airbyte"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/airbyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "f352aaaaaf36301928d8a12119fc8cd7a5f7e585b19a59350dcf45798a853632"
    retries = 0
  }
}
