module "subnet_create" {
  source  = "terraform-nutanix-subnet"
  version = "1.0.0"

  nutanix_cluster_name = "PHX-POC236"
  vlan = [
    { "subnet_name" : "${var.subnet_name[count.index]}",
      "vlan_id" : var.vlan_id[count.index],
      "default_gateway_ip" : "${var.default_gateway_ip[count.index]}",
      "subnet_ip" : "${var.subnet_ip[count.index]}",
      "pool_range" : var.pool_range[count.index]
    }
  ]
}

output "subnet_details" {
  value = module.subnet_create[*].subnet_metadata
}

