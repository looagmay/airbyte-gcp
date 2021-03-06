metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:qVtChtL8cfjs0xI9vo3AUOp6SXEK7O7DQ/lKPta3KMM="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:K7iwnAFY5lEofxjyUMaxW6kT5/IjzaLtu1d0GCZrhpk="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:7AvvZh8tfXPwHhlc1rqzXH9tQfRxeItlmxIxi//M/tw="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5018d2152ab9b2ed43afc253ae273a4c0fdc74de93d9da5547968e2a352ba2d4"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:3SrC3yHn8uegUmmcKT/8P1IFiot5MWIZ4rbv0iQF4Rw="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:W+6SATF4XmgO6AOZDnFDUpFzUFQ4e1t40hRq3Djq/fM="
  retries = 1
}
