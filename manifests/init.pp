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
  $str = '<!DOCTYPE html>\n<html>\n<body>\n<h1>HAProxy Example</h1>\n\
    <p>Example of HAProxy reverse proxy, load-balanced web servers.</p>\n</body>\n</html>'

  file { '/var/www/example': ensure => 'directory', } ->
  file { '/var/www/example/index.html':
    ensure  => 'present',
    content => "$str",
    mode    => '0644',
  } ->
  apache::vhost { 'node01.example.com':
    port    => '80',
    docroot => '/var/www/example',
  }
}
