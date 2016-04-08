# == Class: activemq::params
#
# Defaults for ActiveMQ
class activemq::params {

   $package_ensure = 'present'
   $package_name   = 'activemq'
   $configdir      = '/etc/activemq'
   $credentials    = "${configdir}/credentials.properties"
   $configfile     = "${configdir}/activemq.xml"
   $sysconfigfile  = "/etc/sysconfig/activemq"
   #
   $amquser        = 'activemq'
   $amqgroup       = 'activemq'
   $amqbrokername  = $::fqdn

   # SystemUsage variables for activemq.
   $amqmemory      = '20 mb'
   $amqstore       = '1 gb'
   $amqtemp        = '100 mb'

   # settings for parametrizing the startup script of activemq.
   # if variable is set to undef, the startup script's defaults are used
   $amqbasedir     = undef # ${activemq.base} defaults to $amqhomedir on OEL7
   $amqhomedir     = undef # ${activemq.home} defaults to /usr/share/activemq on OEL7
   $amqconfdir     = undef # ${activemq.conf} defaults to /etc/activemq on OEL7
   $amqdatadir     = undef # ${activemq.data} defaults to $amqbasedir/data on OEL7
   $amqmemopts     = undef # ACTIVEMQ_OPTS_MEMOERY defaults to "-Xms512m -Xmx512m" on OEL7

   #tanuki wrapper variables.
   $configwrapper          = '/etc/activemq/activemq-wrapper.conf'
   $amqrestart             = true
   $dedicatedTaskRunner    = true
   # This is bit horrible, relies on what ever we are given in the package.
   $dedicatedTaskRunnerKey = 'wrapper.java.additional.4'
   $max_memory             = '512'
   
   # Set up a keystore?
   $keystore               = false
   $ca                     = '/var/lib/puppet/ssl/ca/ca_crt.pem'
   $cert                   = "/var/lib/puppet/ssl/certs/${::fqdn}.pem"
   $key                    = "/var/lib/puppet/ssl/private_keys/${::fqdn}.pem"
   $keystore_pass          = 'setmeifyoucare'

   # Files and number of process for activemq user
   $amqfilelimit           = '4096'
   $amqproclimit           = '1024'

}
