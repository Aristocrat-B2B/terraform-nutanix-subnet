# terraform-nutanix-subnet

A terraform module to create a managed Kubernetes cluster on Nutanix. Available
through the [Terraform registry](https://registry.terraform.io/modules/terraform-nutanix-karbon).

## Assumptions

* You want to create one or Nutanix subnets

## Usage example

A full example leveraging other community modules is contained in the [examples/](https://github.com/Aristocrat-B2B/terraform-nutanix-subnet/tree/master/examples/).

The `vlan` list is of the following format:

```hcl
  vlan = [
    { "subnet_name" : "subnet_name_1",
      "vlan_id" : vlan_id_1,
      "default_gateway_ip" : "10.11.0.1",
      "subnet_ip" : "10.11.0.0",
      "pool_range" : ["10.11.0.5 10.11.0.100"]
    },
    { "subnet_name" : "subnet_name_2",
      "vlan_id" : vlan_id_2,
      "default_gateway_ip" : "10.11.0.1",
      "subnet_ip" : "10.11.0.0",
      "pool_range" : ["10.11.0.5 10.11.0.100"]
    }
  ]
}
```

Full example

```hcl

terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.2.0"
    }
  }
}

provider "nutanix" {
  username = "admin"
  password = "ItsASecret!"
  endpoint = "10.0.0.10" # prism endpoint
  insecure = true
}

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

```
## Conditional creation

Sometimes you need to have a way to create resources conditionally but Terraform does not allow to use `count` inside `module` block, so the solution is to specify an empty list for `vlan`


```hcl

# This cluster will not be created
module "subnet_create" {
  source  = "terraform-nutanix-subnet"
  version = "1.0.0"

  nutanix_cluster = "PHX-POC236"
  vlan            = []
}
```

## Contributing

Report issues/questions/feature requests on in the [issues](https://github.com/Aristocrat-B2B/terraform-nutanix-karbon/issues/new) section.

Full contributing [guidelines are covered here](https://github.com/Aristocrat-B2B/terraform-nutanix-karbon/blob/master/.github/CONTRIBUTING.md).

## Change log

- The [changelog](https://github.com/Aristocrat-B2B/terraform-nutanix-karbon/tree/master/CHANGELOG.md) captures all important release notes from v1.0.0

## Authors

- Created by [B2B Devops - Aristocrat](https://github.com/Aristocrat-B2B)
- Maintained by [B2B Devops - Aristocrat](https://github.com/Aristocrat-B2B)

## License

MIT Licensed. See [LICENSE](https://github.com/Aristocrat-B2B/terraform-nutanix-karbon/tree/master/LICENSE) for full details.
