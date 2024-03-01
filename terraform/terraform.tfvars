# terraform\terraform.tfvars
cluster_name   = "cefascluster"
cluster_domain = "cefascluster.com"
base_image     = "/var/lib/libvirt/images/flatcar_image/flatcar_production_qemu_image.img"
machines       = ["machine-1", "machine-2", "machine-3"]
ssh_keys       = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNmaUUgX0zC0MZwM+VWgurzcUlnHtKNCeITmUvkXoC8WB7mMbWTJ1IsE3e2+OPINwZ85oxKTZsLcpyq6yUISrRn6hcuwSYh17VEEK34eOy8ymsgxBZhP38G42/omJj/k7t0+Pr8mMJB5voHVBTiJAElFX0uwGlvgMKVMA8PudEE3nbW15ptCWCulfeT9Q6AW8o4xGFxI2xnV+zChZdQjbNEVfeICFyMxL5B44tGqqyyuhL8/2lD0+WgliPVOvDjI+KAMtetmrOxOmLJ90EMtn4mvQKpb9CsnzzMAFxBz48djt0285jbdyko2NyKEUN7PMm7lh96vGG93YHYkm6oziAXkaOohfulmOMGKISnPo7SDxqvyZwFMUtVYj6SNJIJp4HvsJYpcxMrOrdLFAH4Y9Qxj4+APkfs7OVodGw3kodCtoc/SZdqpIVsqrQWYCG8WB9O+s7Vz5yxNqlZwltSCivyigDPwQ23q3qHcwcef53JUFDC9vGQTdukuIcMOTKA/ChSrvfeDqtKdxBprrlQN+2UV/G5h1YD+qGrfocGOf2Yvxpr627Y+ZpmBi9qBiwoOJ90GbR26U9oVlCS9cOUwtoz/zyctDW741ltnXfDFSMO0YIykEBhNzv1BlCOUiIkRZhpVcts8LmmgJ6Jw+q2W7dhw9iw6+QuzVijUo+KRtOtw== vhgalvez@gmail.com"
]
virtual_cpus   = 2
virtual_memory = 2048