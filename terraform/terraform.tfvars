# terraform\terraform.tfvars
base_image     = "/var/lib/libvirt/images/flatcar_image/flatcar_production_qemu_image.img"
machines       = ["machine-1", "machine-2", "machine-3"]
ssh_keys       = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCZjWZ3Yhus7WjYlfx0asvYPvqzpYco1USyblx8CjWNO4BNli/wvuA48gE0G9DQqTIkxUNbBg+2Ge44Zv8UNcafrRkojNipKKAkpenbVhnTI6Rz6rL+zOMR7EHNilGTcDZJRr3ahC0MOhd1BDXpCgh80nbjBWAU0NGIRxD7JKcnDjVvFXhl6HelMiYCuYobBNnY/+a4kJpWzKddaGAiicWzndQ8Al16ITNR9ab8eK7zakzBJ6xkFz0bj85fv0eQh4VaM21spk0780dx/AbWk2S8CiTO6yIur0uW/m2E4YZMWhzjw6Sv4IL6+o8q0n9SQqKSFTzqDLiOEq65c8CWi6Up victory@localhost.localdomain"
]
virtual_cpus   = 2
virtual_memory = 2048