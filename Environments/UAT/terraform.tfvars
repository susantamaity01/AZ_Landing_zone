resource_group = {
  rg01 = {
    name     = "uat-rg"
    location = "central india"
  }
  rg02 = {
    name     = "test-rg"
    location = "eastus"
  }
}

vnet = {
  vnet01 = {
    name                = "uat-vnet"
    location            = "central india"
    resource_group_name = "uat-rg"
    address_space       = ["10.0.0.0/16"]
  }
  vnet02 = {
    name                = "test-vnet"
    location            = "eastus"
    resource_group_name = "test-rg"
    address_space       = ["143.0.0.0/16"]
  }
}

subnet = {
  sub01 = {
    name                 = "uat-subnet"
    resource_group_name  = "uat-rg"
    virtual_network_name = "uat-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  sub02 = {
    name                 = "uat-subnet01"
    resource_group_name  = "uat-rg"
    virtual_network_name = "uat-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  bastion01 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "uat-rg"
    virtual_network_name = "uat-vnet"
    address_prefixes     = ["10.0.3.0/26"]
  }
}
public_ip = {
  public01 = {
    name                = "uat-ip"
    location            = "central india"
    resource_group_name = "uat-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
bastion = {
  bas01 = {
    name                 = "bastion01"
    location             = "central india"
    resource_group_name  = "uat-rg"
    pip_name             = "uat-ip"
    virtual_network_name = "uat-vnet"
    subnet_name          = "AzureBastionSubnet"
  }
}
network_interface_card = {
  nic01 = {
    name                          = "devops-nic01"
    location                      = "central india"
    resource_group_name           = "uat-rg"
    pip_name                      = "uat-ip"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "uat-subnet"
    virtual_network_name          = "uat-vnet"
  }
  nic02 = {
    name                          = "devops-nic02"
    location                      = "central india"
    resource_group_name           = "uat-rg"
    pip_name                      = "uat-ip"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "uat-subnet"
    virtual_network_name          = "uat-vnet"
  }
}
vm = {
  vm01 = {
    name                            = "linux01"
    resource_group_name             = "uat-rg"
    location                        = "central india"
    size                            = "Standard_D2as_v5"
    # admin_username                  = "adminuser"
    # admin_password                  = "uatrg123456!"
    disable_password_authentication = false
    nic_name                        = "devops-nic01"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    key_vault_name = "uatkv001123"
  }
  vm02 = {
    name                            = "linux02"
    resource_group_name             = "uat-rg"
    location                        = "central india"
    size                            = "Standard_D2as_v5"
    # admin_username                  = "adminuser"
    # admin_password                  = "uatrg123456!"
    disable_password_authentication = false
    nic_name                        = "devops-nic02"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    key_vault_name = "uatkv001123"

  }
}
keyvault = {
  kv01 = {
    name                = "uatkv001123"
    location            = "Central India"
    resource_group_name = "uat-rg"
    sku_name            = "standard"
    admin_username        = "adminuser"
    admin_password         = "Password@123456"
    # tenant_id           = "307acfe9-feb9-4a76-a305-a8430624c05b"
    username = "uservalt"
    password = "passwordvalt"
  }
}