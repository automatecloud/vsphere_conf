# == Class: vsphere_conf::params
#
# Default parameter values for the vsphere_conf module
#

class vsphere_conf::params {
  $host = 'myvcenter.test.com'
  $user = 'myuser'
  $password = 'mypassword'
  $port = 443
  $insecure = false
  $ssl = true
  case $::osfamily {
     'Debian' : {
        $packages = ['zlib1g-dev','libxslt1-dev','build-essential']
	$provider = 'apt'
     }
     'Redhat' : {
        $packages = ['zlib-devel', 'libxslt-devel', 'patch', 'gcc']
	$provider = 'yum'
     }
  }
}
