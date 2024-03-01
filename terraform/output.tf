# output.tf
output "ip_addresses" {
  value = { for vm in libvirt_domain.machine : vm.name => vm.network_interface.0.addresses }
}