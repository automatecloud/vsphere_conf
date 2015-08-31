# Class: vsphere_conf
# ===========================
#
# Copyright
# ---------
#
# Copyright 2015 Andreas Wilke andreas@puppetlabs.com
#
class vsphere_conf (
  $packages = $vsphere_conf::params::packages,
  $gems = $vsphere_conf::params::gems,
  $provider = $vsphere_conf::params::provider,
  $host = $vsphere_conf::params::host,
  $user = $vsphere_conf::params::user,
  $password = $vsphere_conf::params::password,
  $port = $vsphere_conf::params::port,
  $insecure = $vsphere_conf::params::insecure,
  $ssl = $vsphere_conf::params::ssl,
) inherits vsphere_conf::params {
  # Install required packages
  package { $packages:
    ensure   => installed,
    provider => $provider,
  }

  # Install required gems
  $gems = [rbvmomi,hocon]
  package { $gems:
    ensure   => present,
    provider => puppet_gem,
  }

  file { '/etc/puppetlabs/puppet/vcenter.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('vsphere_conf/vcenter.conf.erb'),
  }
}
