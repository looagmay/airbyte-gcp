output "access_key_id" {
	value = module.gcp.access_key_id
	sensitive = true
}


output "secret_access_key" {
	value = module.gcp.secret_access_key
	sensitive = true
}


