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
class apache_example_config () inherits apache {
  $str_node01 = '<!DOCTYPE html><html><body><h1>HAProxy Example</h1>
    <p>Example of HAProxy reverse proxy, load-balanced web servers.<br/><br/>
    docroot: /var/www/example</p></body></html>'

  $str_default = '<!DOCTYPE html><html><body><h1>HAProxy Example</h1>
    <p>Example of HAProxy reverse proxy, load-balanced web servers.<br/><br/>
    docroot: /var/www/html</p></body></html>'

  # vhost example
  file { '/var/www/example': ensure => 'directory', } ->
  file { '/var/www/example/index.html':
    ensure  => 'present',
    content => $str_node01,
    mode    => '0644',
  } ->
  apache::vhost { 'node01.example.com':
    port    => '80',
    docroot => '/var/www/example',
  }

  # default directory
  file { '/var/www/html': ensure => 'directory', } ->
  file { '/var/www/html/index.html':
    ensure  => 'present',
    content => $str_default,
    mode    => '0644',
  }
}
