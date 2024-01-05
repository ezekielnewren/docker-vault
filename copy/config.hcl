api_addr = "https://ADDR_API"
cluster_addr = "https://ADDR_CLUSTER"
ui = true
disable_mlock = false

storage "raft" {
    path = "/vault/file"
    node_id = "main"
}

listener "tcp" {
    address = "0.0.0.0:PORT"
    tls_cert_file = "/vault/vault.pem"
    tls_key_file = "/vault/vault.pem"
}

