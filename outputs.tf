output "subnet_metadata" {
  description = "List of subnets and their metadata"
  value       = nutanix_subnet.subnet[*].metadata
}

