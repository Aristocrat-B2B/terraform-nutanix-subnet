variable "subnet_name" {
    type = list
    default = ["vlan111", "vlan222"]
}
variable "vlan_id" {
    type = list
    default = [111, 222]
}
variable "default_gateway_ip" {
    type = list
    default = ["10.11.0.1", "10.12.0.1"]
}
variable "subnet_ip" {
    type = list
    default = ["10.11.0.0", "10.12.0.0"]
}
variable "pool_range" {
    type = list
    default = [["10.11.0.5 10.11.0.100"], ["10.12.0.5 10.12.0.100"]]
}

