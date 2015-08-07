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
  $host = $vsphere_conf::params::host,
  $user = $vsphere_conf::params::user,
  $password = $vsphere_conf::params::password,
  $port = $vsphere_conf::params::port,
  $insecure = $vsphere_conf::params::insecure,
  $ssl = $vsphere_conf::params::ssl,
) inherits vsphere_conf::params {
 package { $packages:
	ensure => installed,
	provider => $provider,
	notify => Exec['rbvmomiandhocon'],
 }
 exec { 'rbvmomiandhocon':
 	command     => '/opt/puppetlabs/puppet/bin/gem install rbvmomi hocon --no-ri --no-rdoc',
        refreshonly => true,
 }
 file { "/etc/puppetlabs/puppet/vcenter.conf":
    content => template('vsphere_conf/vcenter.conf.erb'),
 } 
}
