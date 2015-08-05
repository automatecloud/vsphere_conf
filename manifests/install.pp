class vsphere_conf::install (
 $packages 	= $vsphere_conf::params::packages,
 $gems 		= $vsphere_conf::params::gems,
 $provider 	= $vsphere_conf::params::provider,
 $host		= $vsphere_conf::params::host,
 $user		= $vsphere_conf::params::user,
 $password	= $vsphere_conf::params::password,
 $port		= $vsphere_conf::params::port,
 $insecure	= $vsphere_conf::params::insecure,
 $ssl		= $vsphere_conf::params::ssl,
) inherits vsphere_conf::params {
 package { $packages:
	ensure => installed,
	provider => $provider,
 }
 exec { 'rbvmomiandhocon':
 	command     => '/opt/puppetlabs/puppet/bin/gem install rbvmomi hocon --no-ri --no-rdoc',
 }
 file { "/etc/puppetlabs/puppet/vcenter.conf":
    content => template('vsphere_conf/vcenter.conf.erb'),
 } 
}
