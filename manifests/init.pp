# == Class: gsDevKitHome
#
#
class gsDevKitHome(

) {
  Exec {
    path => '/usr/bin',
  }

  exec { 'apt-get update': }


  class { 'gsDevKitHome::install':
    require => Exec['apt-get update']
  }
}
