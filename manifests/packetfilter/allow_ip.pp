#
# == define: monit::packetfilter::allow_ip
#
# Allow traffic to monit's webserver through the firewall from the specified IP. 
# Aped from bacula::storagedaemon::packetfilter::allow_ip.
#
define monit::packetfilter::allow_ip
(
    $bind_port
)
{
    firewall { "015 ipv4 accept monit httpd port from ${title}":
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'tcp',
        port => "${bind_port}",
        source => "${title}",
        action => 'accept',
    }
}