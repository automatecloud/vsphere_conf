# vsphere_conf

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with vsphere_conf](#setup)
    * [What vsphere_conf affects](#what-vsphere_conf-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vsphere_conf](#beginning-with-vsphere_conf)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Release Notes](#release-notes)

## Overview

This module automates the software and configuration prerequisites necessary for the  [puppetlabs/vsphere](https://forge.puppetlabs.com/puppetlabs/vsphere)  module.

## Module Description

The following steps are automated:

- Install the necessary packages:
  - On Debian 7 and 8, Ubuntu 14.04 LTS and similar, packages `zlib1g-dev`,  `libxslt1-dev`, and `build-essential` via apt
  - On RHEL 6 and 7, CentOS and similar, packages `zlib-devel`, `libxslt-devel`, `patch` and `gcc` via yum
- Install the necessary ruby gems `rbvmomi` and `hocon`
- Configures `/etc/puppetlabs/puppet/vcenter.conf` with the following settings:
  - Username (user)
  - Password (password)
  - vSphere host (host)
  - Port (port)
  - Use insecure http? (insecure)
  - SSL encryption? (ssl)
- You can test the deployment of new virtual machines within the connected vCenter instance by using the `vsphere_conf::provision` class.

## Setup

## What vsphere_conf affects

* The module installs the packages depending on operating system family Debian or Redhat:
  - For Debian it will install the packages `zlib1g-dev`, `libxslt1-dev`, and `build-essential` via apt
  - For Redhat it will install the packages `zlib-devel`, `libxslt-devel`, `patch` and `gcc` via yum
* The module will install the necessary ruby gems `rbvmomi` and `hocon` via the following executable:
  `/opt/puppetlabs/puppet/bin/gem install rbvmomi hocon --no-ri --no-rdoc`
* This module will configure the `/etc/puppetlabs/puppet/vcenter.conf` for the connection to the vSphere host.

## Beginning with vsphere_conf

At a minimum, you need to include your vSphere vCenter connection settings:

```puppet
class vsphere_conf {
 host     => 'myvcenterhost.example.com',
 user     => 'myvcenteruser',
 password => 'myvcenteruserpassword',
}
```

You can also specify additional configuration, like the port used to connect to vCenter, if the connection should be done by http (insecure) and if ssl encryption will be used (ssl).

```puppet
class vsphere_conf {
 host     => 'myvcenterhost.example.com',
 user     => 'myvcenteruser',
 password => 'myvcenteruserpassword',
 port     => 443,
 insecure => false,
 ssl      => true,
}
```

## Usage

The following parameters can be configured:
- `$packages`: Specifies the packages that will be installed as pre requirement for the vSphere module
- `$host`: The vSphere vCenter Host that will be used to connect
- `$user`: The user that will be used to create, modify and delete virtual machines
- `$password`: The password for the user that will be used to connect to the vCenter host
- `$port`: The port that will be used to connect to the vCenter instance. Default = 443, if you enable insecure connections you must use port 80
- `$insecure`: true if you connect via 443 and false if you connect via port 80
- `$ssl`: Using ssl to establish the connection to the vSphere vCenter host.
- `$datacenter`: The vCenter datacenter to be used by the module (defaults to undef).

If you use the `vsphere_conf::provision` class you can specify the following parameters:

- `$vmprename`: The Pre Name of the virtual machines that will be provisioned ex 'myvirtualmachine' pre name will create VMs with the name myvirtualmachine1, myvirtualmachine2 etc.
- `$numberofvms`: the number of virtual machines that should be created. can be also used to do performance tests inside your vSphere environment.
- `$vmlocation`: The location of the virtual machine within the VM & Template view. Please also specify the invisible vm folder between datacenter and the first folder name. So a structure datacenter/myvms will look like /datacenter/vm/myvms/ for this parameter.
- `$vmstatus`: Specify the status of the VMs - if it should be running, stopped etc.
- `$vmsource`: The template source from where the virtual machine should be provisioned from. Please also specify the invisible vm folder between datacenter and the first folder name. So a structure datacenter/mytemplates/mytemplate will look like /datacenter/vm/mytemplates/mytemplate for this parameter.
- `$vmmemory`: The amount of virtual memory you would like to configure for the virtual machines (default is 1024 MB of vRAM).
- `$vmvcpus`: The number of virtual vCPUs configured for each virtual Machine (default is 1).

## Reference

The following classes are included inside the module:
- `vsphere_conf`: Default class, calls an install with default values. Requires the `$user`, `$password` and `$host`.
- `vsphere::params`: Declares the default values.
- `vsphere::provision`: Provision class to provision new example virtual machines for tests.

## Limitations

This module uses the [puppetlabs/vsphere](https://forge.puppetlabs.com/puppetlabs/vsphere) module, which is only available with Puppet Enterprise.

This module has been tested with Puppet Enterprise 2015.2 and 2015.3 only.

## Release Notes

Please test, test, test! No guarantees at all :-)
