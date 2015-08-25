## HAProxy-Apache-Puppet Demo
Configure Apache web server for HAProxy reverse-proxy load-balancing demo. For more information, please read my blog post: [Automate the Provisioning and Configuration of HAProxy and an Apache Web Server Cluster Using Foreman](http://wp.me/p1RD28-1ok).

#### Useful Commands
* httpd -v # check apache version
* httpd -t # check syntax of httpd.conf
* cat /etc/httpd/conf/httpd.conf
* cat /etc/httpd/conf.d/15-default.conf
* cat /etc/httpd/conf.d/15-default.conf | grep DocumentRoot
* cat /var/www/html/index.html
* sudo ls -1 /etc/httpd/logs/
* sudo tail -50 /etc/httpd/logs/error_log