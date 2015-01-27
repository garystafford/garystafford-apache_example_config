# Class: apache_example_config
#
# This module manages apache_example_config
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class apache_example_config {
  $str_default = "<!DOCTYPE html><html><body><h1>HAProxy Example</h1>
    <p>Example of using HAProxy as a reverse-proxy load-balancer,<br/>
    with ${operatingsystem}-based Apache web servers.<br/><br/>
    hostname: ${fqdn}<br/>ip address: ${network_eth1}</p></body></html>"

  # default directory
  file { '/var/www/html': ensure => 'directory', } ->
  file { '/var/www/html/index.html':
    ensure  => 'present',
    content => $str_default,
    mode    => '0644',
  }
}
