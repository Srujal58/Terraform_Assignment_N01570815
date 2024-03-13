module "rgroup-0815" {
  source = "./modules/rgroup-0815"

   resource_group_name = var.resource_group_name
   location = var.location 

   common_tags = local.common_tags

}

module "network-0815" {
  source = "./modules/network-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location
  
  vnet_name = var.vnet_name
  subnet_name = var.subnet_name
  nsg_name = var.nsg_name

  common_tags = local.common_tags
}

module "common-0815" {
  source = "./modules/common-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location

  common_tags = local.common_tags
}

module "vmlinux-0815" {
  source = "./modules/vmlinux-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location
  
  subnet_id =  module.network-0815.subnet_id
  storage_account_uri = module.common-0815.storage_account-primary_blob_endpoint
  
  common_tags = local.common_tags
}

module "vmwindows-0815" {
  source = "./modules/vmwindows-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location
  
  subnet_id =  module.network-0815.subnet_id
  storage_account_uri = module.common-0815.storage_account-primary_blob_endpoint
  
  common_tags = local.common_tags
}

module "datadisk-0815" {
  source = "./modules/datadisk-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location

  linux_vm_ids        = module.vmlinux-0815.vmlinux.ids 
  windows_vm_ids      = module.vmwindows-0815.windows.ids
  
  all_vm_ids = concat(module.vmlinux-0815.vmlinux.ids, module.vmwindows-0815.windows.ids) 
  common_tags = local.common_tags
}

module "loadbalancer-0815" {
  source              = "./modules/loadbalancer-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location
 
  linux_vm_nic_ids	      =	module.vmlinux-0815.vmlinux-nic-ids
  linux_vm_name           = module.vmlinux-0815.vmlinux.hostnames
  common_tags = local.common_tags
}

module "database-0815" {
  source                       = "./modules/database-0815"
  
  resource_group_name = module.rgroup-0815.resource_group_name
  location = module.rgroup-0815.location

  common_tags = local.common_tags
}


