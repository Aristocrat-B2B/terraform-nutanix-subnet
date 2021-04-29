module "subnet_create" {
  source  = "terraform-nutanix-subnet"
  version = "1.0.0"

  nutanix_cluster_name = "PHX-POC236"
  vlan = [
    { "subnet_name" : "vlan1112",
      "vlan_id" : 1112,
      "default_gateway_ip" : "10.11.0.1",
      "subnet_ip" : "10.11.0.0",
      "pool_range" : ["10.11.0.5 10.11.0.100"]
    },
    { "subnet_name" : "vlan1113",
      "vlan_id" : 1113,
      "default_gateway_ip" : "10.11.0.1",
      "subnet_ip" : "10.11.0.0",
      "pool_range" : ["10.11.0.5 10.11.0.100"]
    }
  ]
}

output "subnet_details" {
  value = module.subnet_create.subnet_metadata
}

