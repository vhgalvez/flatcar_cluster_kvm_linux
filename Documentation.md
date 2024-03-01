# Documentacion

```bash
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-1.clc -o /config/cl/machine-1.ign
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-2.clc -o /config/cl/machine-2.ign
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-3.clc -o /config/cl/machine-3.ign
```

```bash
sudo docker run --rm -i quay.io/coreos/butane:release < /home/victory/infra_code/flatcar-infra-qemu-libvirt/cl/machine-1.yaml.tmpl | sudo tee /home/victory/infra_code/flatcar-infra-qemu-libvirt/cl/machine-1.ign > /dev/null
```

```bash
 cat libvirt-machines.tf &&  cat README.md && cat terraform.tfvars && cat variables.tf && cat cl/machine-1.yaml.tmpl && cat cl/machine-2.yaml.tmpl && cat cl/machine-3.yaml.tmpl && tree -h && cat libvirt-machines.tf &&  cat README.md && cat terraform.tfvars && cat variables.tf && cat cl/machine-1.yaml.tmpl && cat cl/machine-2.yaml.tmpl && cat cl/machine-3.yaml.tmpl && tree -h  && cat outputs.tf
 ```

 https://github.com/flatcar/container-linux-config-transpiler/releases
 
```bash
 sudo wget https://github.com/flatcar/container-linux-config-transpiler/archive/refs/tags/v0.9.4.tar.gz
```

```bash
sudo tar -xvf v0.9.4.tar.gz
```

```bash
sudo terraform plan -var-file="/home/victory/infra_code/seguridad/terraform.tfvars"
```
sudo terraform plan -var-file="terraform.tfvars"

cat /home/victory/infra_code/seguridad/terraform.tfvars


https://www.flatcar.org/docs/latest/installing/vms/libvirt/
https://github.com/flatcar/flatcar-terraform/tree/main/qemu-libvirt
https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs
https://registry.terraform.io/providers/poseidon/ct/latest/docs
https://github.com/poseidon/terraform-provider-ct/tree/main/examples
https://www.linuxtechi.com/install-terraform-on-rhel-rockylinux-almalinux/

https://forums.rockylinux.org/t/kvm-on-rocky-linux-9/10625/6

https://www.linuxcapable.com/how-to-install-git-on-rocky-linux/

https://www.linuxcapable.com/how-to-install-neofetch-on-rocky-linux/

https://www.flatcar.org/docs/latest/provisioning/sysext/

eliminar volumen
sudo virsh pool-destroy entorno-testing
sudo virsh pool-undefine entorno-testing

sudo virsh pool-destroy entorno-testing-pool
sudo virsh pool-undefine entorno-testing-pool

 sudo virsh pool-list --all

cat terraform/main.tf && cat terraform/variables.tf && cat terraform/outputs.tf && cat terraform/terraform.tfvars && cat configs/machine-1-config.yaml.tmpl && cat configs/machine-2-config.yaml.tmpl && cat configs/machine-3-config.yaml.tmpl && tree -h


 sudo cp -R /home/victory/infra-code/seguridad/terraform.tfvars /home/victory/infra-code/flatcar_cluster_kube/terraform/terraform.tfvars


  sudo virsh pool-create-as --name default --type dir --target /var/lib/libvirt/images



sudo virsh vol-delete --pool entorno-testing machine-1-cloudinit.iso
sudo virsh vol-delete --pool entorno-testing machine-2-cloudinit.iso
sudo virsh vol-delete --pool entorno-testing machine-3-cloudinit.iso

sudo virsh pool-destroy entorno-testing
sudo virsh pool-undefine entorno-testing

sudo terraform state list

sudo terraform state rm data.ct_config.ignition["machine-1"]
sudo terraform state rm data.ct_config.ignition["machine-2"]
sudo terraform state rm data.ct_config.ignition["machine-3"]
sudo terraform state rm libvirt_network.kube_network
sudo terraform state rm libvirt_pool.volumetmp

sudo terraform state rm 'data.ct_config.ignition["machine-1"]'
sudo terraform state rm 'data.ct_config.ignition["machine-2"]'
sudo terraform state rm 'data.ct_config.ignition["machine-3"]'
sudo terraform state rm 'libvirt_network.kube_network'
sudo terraform state rm 'libvirt_pool.volumetmp'



sudo virsh net-destroy k0snet
sudo virsh net-undefine k0snet

Los comandos que has seleccionado son utilizados para eliminar una red existente en libvirt. Aquí te explico qué hace cada uno:

- `sudo virsh net-destroy k0snet`: Este comando detiene la red llamada `k0snet`. Es similar a desconectar un switch de red, los servidores virtuales que estaban usando esta red perderán la conectividad.

- `sudo virsh net-undefine k0snet`: Este comando elimina la definición de la red `k0snet`. Después de ejecutar este comando, la red `k0snet` ya no existirá en la configuración de libvirt.

Si quieres ver todas las redes definidas en tu sistema libvirt, puedes usar el comando `sudo virsh net-list --all`. Este comando mostrará una lista de todas las redes, incluyendo su nombre, estado (si están activas o inactivas), y si se iniciarán automáticamente cuando se inicie el sistema.

sudo virsh net-list --all
sudo virsh net-destroy k8snet
sudo virsh net-undefine k8snet


sudo virsh pool-list --all





Verificar IPs Asignadas: Puedes verificar las direcciones IP asignadas a cada máquina virtual utilizando herramientas de libvirt como virsh. Por ejemplo, para listar todas las máquinas virtuales y sus direcciones IP puedes usar:

bash
Copy code
virsh net-dhcp-leases <network-name>
Sustituye <network-name> por el nombre de tu red libvirt, en este caso, k8snet.

Automatización de Outputs: Si necesitas que las direcciones IP sean parte de los outputs de Terraform de manera automática, considera agregar un paso adicional después de la creación de los recursos que consulte y actualice estos datos. Esto puede lograrse a través de scripts externos o utilizando data sources de Terraform si están disponibles para tu caso de uso.

Revisión de Configuración de Red: Asegúrate de que la configuración de la red en libvirt esté correctamente configurada para asignar direcciones IP mediante DHCP a las máquinas virtuales.


virsh net-dhcp-leases k8snet


[victory@localhost flatcar_cluster_kube]$ sudo virsh net-dhcp-leases k8snet
 Expiry Time           dirección MAC       Protocol   IP address       Hostname   Client ID or DUID
--------------------------------------------------------------------------------------------------------------------------------------------
 2024-02-15 15:30:30   52:54:00:36:2d:2b   ipv4       10.17.3.65/24    -          ff:b5:5e:67:ff:00:02:00:00:ab:11:e0:8a:77:cd:29:5f:18:a4
 2024-02-15 15:30:30   52:54:00:9e:90:09   ipv4       10.17.3.246/24   -          ff:b5:5e:67:ff:00:02:00:00:ab:11:85:be:b4:cf:36:a1:04:d9
 2024-02-15 15:30:30   52:54:00:ba:38:7f   ipv4       10.17.3.39/24    -          ff:b5:5e:67:ff:00:02:00:00:ab:11:a2:37:5c:2b:6c:c2:82:03




 Para crear una nueva clave SSH que sea compatible con el proceso de Ignition de Flatcar y luego cómo ejecutar sudo terraform destroy, sigue estos pasos:

Crear una Nueva Clave SSH
Genera un Nuevo Par de Claves SSH:

Abre una terminal en tu máquina local y ejecuta el siguiente comando. Esto creará un nuevo par de claves SSH sin una frase de paso (por simplicidad, pero considera usar una para mayor seguridad).

bash
Copy code
ssh-keygen -t rsa -b 4096 -C "tu_email@example.com" -N '' -f ~/.ssh/id_rsa_flatcar
-t rsa: Especifica el tipo de clave a crear, en este caso, RSA.
-b 4096: Crea una clave de 4096 bits.
-C "tu_email@example.com": Un comentario para identificar la clave; reemplázalo con tu dirección de correo electrónico o un comentario de tu elección.
-N '': Especifica que no habrá frase de paso.
-f ~/.ssh/id_rsa_flatcar: Especifica el nombre de archivo para la clave generada. Cambia la ruta y el nombre del archivo según sea necesario.
Actualizar la Clave Pública en Terraform:

Una vez generada la clave, necesitarás actualizar la configuración de Terraform para utilizar la nueva clave. Busca en tu archivo de configuración de Terraform (terraform.tfvars o donde definas las variables) y actualiza la variable que contiene tu clave SSH pública. Por ejemplo:

hcl
Copy code
ssh_keys = ["$(cat ~/.ssh/id_rsa_flatcar.pub)"]
Asegúrate de que esta clave pública se agregue al servidor o configuración que estés utilizando.

ssh -i ~/.ssh/id_rsa_flatcar core@10.17.3.167

chmod 600 ~/.ssh/id_rsa_flatcar
ssh -i ~/.ssh/id_rsa_flatcar core@
ssh -i ~/.ssh/id_rsa_flatcar core@10.17.3.167

scp log_arranque.txt victory@192.168.0.20:/home/victory

[victory@localhost terraform]$ sudo virsh list --all
[sudo] password for victory:
Sorry, try again.
[sudo] password for victory:
 Id   Nombre                      Estado
----------------------------------------------
 19   machine-1-entorno-testing   ejecutando
 20   machine-3-entorno-testing   ejecutando
 21   machine-2-entorno-testing   ejecutando

[victory@localhost terraform]$ sudo virsh dumpxml  machine-1-entorno-testing

sudo virsh console machine-1-entorno-testing


Para salir de una consola `virsh`, puedes usar la combinación de teclas `Ctrl + ]`. Esta combinación de teclas te llevará de vuelta al prompt del shell desde el que iniciaste la consola `virsh`.


sudo virt-admin -c virtqemud:///system daemon-log-outputs "3:journald 1:file:/var/log/libvirt/libvirtd.log"
sudo virt-admin -c virtqemud:///system daemon-log-filters "3:remote 4:event 3:util.json 3:util.object 3:util.dbus 3:util.netlink 3:node_device 3:rpc 3:access 1:*"
sudo virt-admin -c virtqemud:///system daemon-timeout 0

sudo virsh list --all
sudo virsh undefine machine-3 &&  sudo virsh undefine machine-2 &&  sudo virsh undefine machine-1

[victory@localhost terraform]$ sudo virsh vol-list --pool entorno-testing
 Nombre                            Ruta
------------------------------------------------------------------------------------------------------------
 entorno-testing-base              /var/lib/libvirt/images/entorno-testing/entorno-testing-base
 machine-1-cloudinit.iso           /var/lib/libvirt/images/entorno-testing/machine-1-cloudinit.iso
 machine-1-entorno-testing.qcow2   /var/lib/libvirt/images/entorno-testing/machine-1-entorno-testing.qcow2
 machine-2-cloudinit.iso           /var/lib/libvirt/images/entorno-testing/machine-2-cloudinit.iso
 machine-2-entorno-testing.qcow2   /var/lib/libvirt/images/entorno-testing/machine-2-entorno-testing.qcow2
 machine-3-cloudinit.iso           /var/lib/libvirt/images/entorno-testing/machine-3-cloudinit.iso
 machine-3-entorno-testing.qcow2   /var/lib/libvirt/images/entorno-testing/machine-3-entorno-testing.qcow2

[victory@localhost terraform]$


https://fp.josedomingo.org/hlc2122/u01/introduccion.html



## Bing

It looks like you are trying to create some virtual machines using libvirt and terraform. However, you encountered some errors related to permissions and user accounts. Here are some possible solutions:
- The first error indicates that the user libvirt-qemu does not exist on your system. You can create this user and the corresponding groups libvirt-qemu, libvirt, and libvirtd using the following commands:

sudo useradd -r libvirt-qemu
sudo groupadd libvirt-qemu
sudo groupadd libvirt
sudo groupadd libvirtd
sudo usermod -a -G libvirt-qemu libvirt-qemu

- Alternatively, you can edit the /etc/libvirt/qemu.conf file and change the user and group directives to root or your own username and group. For example:

user = "root"
group = "root"

- After making any changes to the qemu.conf file, you need to restart the libvirtd service using the following command:

sudo systemctl restart libvirtd

- The second error indicates that the user libvirt-qemu does not have read access to the storage file /home/victory/infra-code/libvirt_images/entorno-testing/machine-2-entorno-testing.qcow2. You can fix this by changing the ownership and permissions of the file and its parent directories using the following commands:

sudo chown -R libvirt-qemu:libvirt-qemu /home/victory/infra-code/libvirt_images/entorno-testing
sudo chmod -R 755 /home/victory/infra-code/libvirt_images/entorno-testing

- Alternatively, you can move the storage file to a different location that is accessible by the libvirt-qemu user, such as /var/lib/libvirt/images. For example:

sudo mv /home/victory/infra-code/libvirt_images/entorno-testing/machine-2-entorno-testing.qcow2 /var/lib/libvirt/images

- You also need to update the path of the storage file in your main.tf file accordingly.
- The third error is incomplete and does not provide enough information to diagnose the problem. You may need to check the logs of the libvirt and terraform processes for more details.
I hope this helps you to resolve the errors and create your virtual machines successfully. If you have any other questions, please feel free to ask me. 😊

sudo journalctl -u libvirtd


cat terraform/main.tf && cat terraform/variables.tf && cat terraform/outputs.tf && cat terraform/terraform.tfvars && cat configs/machine-1-config.yaml.tmpl && cat configs/machine-2-config.yaml.tmpl && cat configs/machine-3-config.yaml.tmpl && cat terraform/outputs/machine-1.ign  &&  tree -h rm.tfvars && cat configs/machine-1-config.