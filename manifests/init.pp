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
#   include 'apache_example_config'
#   class { 'apache_example_config': }
#
class apache_example_config {
  if ($::operatingsystem == 'CentOS') and ($::operatingsystemmajrelease == '7') 
  {
    $ip_addr = $::ipaddress_enp0s8 # new to CentOS 7
  } else {
    $ip_addr = $::ipaddress_eth1
  }

  $str_default = "<!DOCTYPE html><html><body><h1>HAProxy Example</h1>
    <p>Example of using HAProxy as a reverse-proxy and load-balancer
    for Apache.<br/><br/>
    FQDN: ${::fqdn}<br/>
    IP: ${ip_addr}<br/>
    OS: ${::operatingsystem} ${::operatingsystemrelease}
    </p></body></html>"

  apache::vhost { 'example.com': # define vhost resource
    port    => '80',
    docroot => '/var/www/html'
  }

  file { '/var/www/html/index.html':
    ensure  => 'present',
    content => $str_default,
    mode    => '0644',
  }
}
