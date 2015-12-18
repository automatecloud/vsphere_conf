# == Class: vsphere_conf::provision
#
# Puppet Module to provision virtual machines
#

class vsphere_conf::provision (
    $vmprename   = 'myvirtualmachine',
    $numberofvms = 2,
    $vmlocation  = '/datacenter/vm/folder/subfolder/',
    $vmstatus    = running,
    $vmsource    = '/datacenter/vm/folder/templates/mytemplate',
    $vmmemory    = 1024,
    $vmvcpus     = 1,
  ){
    $vmarray = Integer[1,$numberofvms]
    $vmarray.each |Integer $vm| {
      vsphere_vm { "${vmlocation}${vmprename}${vm}":
        ensure => $vmstatus,
        source => $vmsource,
        memory => $vmmemory,
        cpus   => $vmvcpus,
      }
    }
  }
