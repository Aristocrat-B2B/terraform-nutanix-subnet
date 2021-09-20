data "nutanix_cluster" "cluster" {
  name = var.nutanix_cluster_name
}

resource "nutanix_subnet" "subnet" {
  trigger = {
  }

  cluster_uuid                 = data.nutanix_cluster.cluster.metadata.uuid
  count                        = length(var.vlan)
  name                         = var.vlan[count.index]["subnet_name"]
  vlan_id                      = var.vlan[count.index]["vlan_id"]
  subnet_type                  = "VLAN"
  prefix_length                = var.vlan[count.index]["cidr_length"]
  default_gateway_ip           = var.vlan[count.index]["default_gateway_ip"]
  subnet_ip                    = var.vlan[count.index]["subnet_ip"]
  ip_config_pool_list_ranges   = var.vlan[count.index]["pool_range"]
  dhcp_domain_name_server_list = var.vlan[count.index]["dhcp_domain_name_server_list"]
  dhcp_domain_search_list      = var.vlan[count.index]["dhcp_domain_search_list"]
}
