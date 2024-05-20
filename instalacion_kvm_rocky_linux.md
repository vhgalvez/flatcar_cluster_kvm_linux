# Configuración de KVM y Red Virtual en Linux

Este tutorial detalla la instalación y configuración de KVM (Kernel-based Virtual Machine) y la creación de una red virtual utilizando `nmcli` y `brctl` en sistemas Linux con `dnf` como gestor de paquetes.

## Instalación de KVM y Herramientas de Gestión de Máquinas Virtuales

1. **Instalación de KVM y herramientas de gestión de VMs:**
   
   - Instala QEMU, que es el emulador de hardware que permite a KVM utilizar la aceleración por hardware para la virtualización.

   ```bash
   dnf install qemu-kvm libvirt virt-manager virt-install
    ```

- Instala el repositorio EPEL para acceder a paquetes adicionales:

```bash
dnf install epel-release -y
```

Instala utilidades adicionales para la gestión de redes y máquinas virtuales:

```bash
dnf -y install bridge-utils virt-top libguestfs-tools virt-viewer
```
Configuración del Servicio Libvirt

Inicia el servicio libvirtd:

```bash
systemctl start libvirtd
```

Habilita libvirtd para iniciar automáticamente:

```bash
systemctl enable libvirtd
```

Comprueba el estado del servicio:

```bash
systemctl status libvirtd
```


Gestión de Permisos de Usuario
Añade tu usuario al grupo libvirt para gestionar VMs sin sudo:

```bash
usermod -aG libvirt $USER
```

Aplica los cambios de grupo sin necesidad de cerrar sesión:

```bash
newgrp libvirt
```
Configuración de Red con NetworkManager

Muestra los puentes de red existentes:

```bash
brctl show
```
Lista todas las conexiones de red actuales:

```bash
nmcli connection show
```



