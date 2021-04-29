# Required variables
variable "nutanix_cluster_name" {
  type        = string
  description = "The name of the nutanix cluster"
}

# Optional variables
variable "vlan" {
  type        = list(any)
  description = "List of vlans"
  default = [
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
