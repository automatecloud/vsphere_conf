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
6. [Development - Guide for contributing to the module](#development)

## Overview

This module automates the setup and configuration steps necessary for the new Puppet Labs Inc. vSphere module:

## Module Description

The following steps are automated:

- Install the necessery packages:
  - On Debian 7 and 8, Ubuntu 14.04 LTS and similar packages zlib1g-dev libxslt1-dev build-essential via apt
  - On On RHEL 6 and 7, CentOS, and similar packages zlib-devel libxslt-devel patch gcc via yum
- Install the necessary ruby gems rbvmomi and hocon
- Configures the /etc/puppetlabs/puppet/vcenter.conf and the following setting:
  - Username (user)
  - Password (password)
  - vSphere host (host)
  - Port (port)
  - Use insecure http? (insecure)
  - SSL encryption? (ssl)

## Setup

### What vsphere_conf affects

* The module installs the packages depending on operating system family Debian or Redhat:
  - For Debian it will install the packages zlib1g-dev libxslt1-dev build-essential via apt
  - For Redhat it will install the packages zlib-devel libxslt-devel patch gcc via yum
* The module will install the neceessary ruby gems rbvmomi and hocon via the following executable:
  /opt/puppetlabs/puppet/bin/gem install rbvmomi hocon --no-ri --no-rdoc
* This module will configure the /etc/puppetlabs/puppet/vcenter.conf for the connection to the vSphere host.
* This module only works and was tested with Puppet Enterprise 2015.2!

### Beginning with vsphere_conf

You need to include your vSphere vCenter connection informations:

class vsphere_conf {
 host => 'myvcenterhost.example.com',
 user => 'myvcenteruser',
 password => 'myvcenteruserpassword', 
}

you can also specifiy additional configurations like port used to connect to vcenter, if the connection should be done by http (insecure) and if ssl encryption will be used (ssl).

class vsphere_conf {
 host => 'myvcenterhost.example.com',
 user => 'myvcenteruser',
 password => 'myvcenteruserpassword',
 port => 443,
 insecure => false,
 ssl => true,
}


## Usage

The following parameters can be configured:
- $packages: Specifies the packages that will be installed as pre requirement for the vSphere module
- $host: The vSphere vCenter Host that will be used to connect 
- $user: The user that will be used to create, modify and delete virtual machines
- $password: The password for the user that will be used to connect to the vCenter host
- $port: The port that will be used to connect to the vCenter instance. Default = 443, if you enable insecure connections you must use port 80
- $insecure: true if you connect via 443 and false if you connect via port 80
- $ssl: Using ssl to establish the connection to the vSphere vCenter host.

## Reference
Classes
-vsphere_conf: Default class, calls an install with default values. Requires the $user, $password and $host.
-vsphere::install: Installs and configures the vSphere Module requirements.
-vsphere::params: Declares the default values.

## Limitations

This Module can only be used with Puppet Enterprise 2015.2

## Release Notes/Contributors/Etc **Optional**

This is the first module release! No guarantee at all :-)
