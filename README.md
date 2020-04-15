# Oracle18XE
Fully automated Vagrant build using VirtualBox and the Ansible provisioner for Oracle 18XE, and support for Pure Storage iSCSI volumes

# Pre-Requisites
This Vagrant build requires Vagrant and VirtualBox to be pre-installed, this build was tested with Vagrant 2.2.6 & VirtualBox 6.0.16

You can check your version of [Vagrant](https://www.vagrantup.com/) using:
```
$ vagrant version
Installed Version: 2.2.6
Latest Version: 2.2.7

You're running an up-to-date version of Vagrant!
```
And for [Oracle VirtualBox](https://www.virtualbox.org/) use:
```
$ vboxmanage --version
6.0.16r135674
```
## Oracle Technology Network (OTN) Downloads
Please note you will need an Oracle SSO account to download software from OTN.
* [Oracle 18xe (Express Edition)](https://www.oracle.com/database/technologies/appdev/xe/quickstart.html)
  * Version used 18c-1.0-1

# Getting Started
1. Clone GitHub
1. Copy downloaded oracle-database-xe-18c-1.0-1.x86_64.rpm into vagrant/ directory
1. Edit Vagrantfile variables as required:
   ### Host
   * hostonly_network_ip_address = ""
   * vm_hostname = ""
   ### Oracle
   * oraPass = "manager"
   * oraWallet = "WalletPasswd123"
1. type vagrant up

Now sit back and watch Vagrant, VirtualBox and Ansible do it's magic.

```
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ol7-latest'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: oraclexe
==> default: Clearing any previously set network interfaces...
...
```
