# Class: vsphere_conf
# ===========================
#
# Copyright
# ---------
#
# Copyright 2015 Andreas Wilke andreas@puppetlabs.com
#
class vsphere_conf (
  $packages = undef,
  $gems = undef,
  $host = undef,
  $user = undef,
  $password = undef,
  $port = 443,
  $insecure = false,
  $ssl = true,
) {
 class { vsphere_conf::install:
   packages => $packages,
   gems => $gems,
 }

}
