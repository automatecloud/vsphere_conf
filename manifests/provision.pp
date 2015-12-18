# == Class: vsphere_conf::provision
#
# Puppet Module to provision virtual machines
#

class vsphere_conf::provision (
    $vmprename   = 'myvirtualmachine',
    $numberofvms = 2,
    $vmlocation  = '/datacenter/vm/myvms/',
    $vmstatus    = running,
    $vmsource    = '/datacenter/vm/mytemplate',
    $vmmemory    = 1024,
    $vmvcpus     = 1,
  ){
    $vmarray = [1,$numberofvms]
    $vmarray.each |Integer $vm| {
      vsphere_vm { "${vmlocation}${vm}":
        ensure => $vmstatus,
        source => '/opdx1/vm/eng/source',
        memory => $vmmemory,
        cpus   => $vmvcpus,
      }
        }
  }
