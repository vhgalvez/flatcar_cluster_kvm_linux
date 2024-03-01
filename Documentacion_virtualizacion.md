# Configuración de KVM y Red Virtual en Linux

Este tutorial detalla la instalación y configuración de KVM (Kernel-based Virtual Machine) y la creación de una red virtual utilizando `nmcli` y `brctl` en sistemas Linux con `dnf` como gestor de paquetes.

## Instalación de KVM y Herramientas de Gestión de Máquinas Virtuales

1. **Instalación de KVM y herramientas de gestión de VMs:**
   Instala QEMU, que es el emulador de hardware que permite a KVM utilizar la aceleración por hardware para la virtualización.

   ```bash
   dnf install qemu-kvm libvirt virt-manager virt-install
    ```

Instala el repositorio EPEL para acceder a paquetes adicionales:

bash
Copy code
dnf install epel-release -y
Instala utilidades adicionales para la gestión de redes y máquinas virtuales:

bash
Copy code
dnf -y install bridge-utils virt-top libguestfs-tools virt-viewer
Configuración del Servicio Libvirt
Inicia el servicio libvirtd:

bash
Copy code
systemctl start libvirtd
Habilita libvirtd para iniciar automáticamente:

bash
Copy code
systemctl enable libvirtd
Comprueba el estado del servicio:

bash
Copy code
systemctl status libvirtd
Gestión de Permisos de Usuario
Añade tu usuario al grupo libvirt para gestionar VMs sin sudo:

bash
Copy code
usermod -aG libvirt $USER
Aplica los cambios de grupo sin necesidad de cerrar sesión:

bash
Copy code
newgrp libvirt
Configuración de Red con NetworkManager
Muestra los puentes de red existentes:

bash
Copy code
brctl show
Lista todas las conexiones de red actuales:

bash
Copy code
nmcli connection show
Definición de Variables para la Configuración del Puente de Red
Establece variables para la creación del puente:

bash
Copy code
BR_NAME="br0"
BR_INT="enp6s18"
SUBNET_IP="192.168.0.65/24"
GW="192.168.0.10"
DNS1="8.8.8.8"
DNS2="8.8.4.4"
Creación y Configuración del Puente
Añade un nuevo puente:

bash
Copy code
sudo nmcli connection add type bridge autoconnect yes con-name ${BR_NAME} ifname ${BR_NAME}
Configura la dirección IP del puente:

bash
Copy code
sudo nmcli connection modify ${BR_NAME} ipv4.addresses ${SUBNET_IP} ipv4.method manual
Establece la puerta de enlace del puente:

bash
Copy code
sudo nmcli connection modify ${BR_NAME} ipv4.gateway ${GW}
Configura los servidores DNS del puente:

bash
Copy code
sudo nmcli connection modify ${BR_NAME} ipv4.dns ${DNS1} +ipv4.dns ${DNS2}
Elimina la conexión de red actual que se convertirá en esclava del puente:

bash
Copy code
sudo nmcli connection delete ${BR_INT}
Añade la interfaz física como esclava del puente:

bash
Copy code
sudo nmcli connection add type bridge-slave autoconnect yes con-name ${BR_INT} ifname ${BR_INT} master ${BR_NAME}
Verifica las conexiones de red para confirmar los cambios:

bash
Copy code
sudo nmcli connection show
Activa la conexión del puente:

bash
Copy code
nmcli connection up br0
Al seguir estos pasos, tu sistema estará configurado con KVM y un puente de red utilizando NetworkManager, lo que te permite administrar máquinas virtuales y la red de manera eficiente.

https://forums.rockylinux.org/t/kvm-on-rocky-linux-9/10625



1. dnf install qemu-kvm libvirt virt-manager virt-install
2. dnf install epel-release -y
3. dnf -y install bridge-utils virt-top libguestfs-tools bridge-utils virt-viewer
4. systemctl start libvirtd
5. systemctl enable libvirtd
6. systemctl status libvirtd
7. usermod -aG libvirt $USER
8. newgrp libvirt
9. brctl show
10. nmcli connection show 
11. BR_NAME="br0"
BR_INT="enp6s18"
SUBNET_IP="192.168.0.65/24"
GW="192.168.0.10"
DNS1="8.8.8.8"
DNS2="8.8.4.4"
1.  sudo nmcli connection add type bridge autoconnect yes con-name ${BR_NAME} ifname ${BR_NAME}
2.  sudo nmcli connection modify ${BR_NAME} ipv4.addresses ${SUBNET_IP} ipv4.method manual
3.  sudo nmcli connection modify ${BR_NAME} ipv4.gateway ${GW}
4.  sudo nmcli connection modify ${BR_NAME} ipv4.dns ${DNS1} +ipv4.dns
5.  sudo nmcli connection delete ${BR_INT}
6.  sudo nmcli connection add type bridge-slave autoconnect yes con-name ${BR_INT} ifname ${BR_INT} master ${BR_NAME}
7.  sudo nmcli connection show 
8.  nmcli connection up br0
9.  





cat terraform/main.tf && cat terraform/variables.tf && cat terraform/outputs.tf && cat terraform/terraform.tfvars && cat configs/machine-1-config.yaml.tmpl && cat configs/machine-2-config.yaml.tmpl && cat configs/machine-3-config.yaml.tmpl && cat terraform/outputs/machine-1.ign  &&  tree -h