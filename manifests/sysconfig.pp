# == Class: activemq::sysconfig
# Manages the sysconfig file of activemq
#
# === Copyright
# André Frimberger, 2016
#
# === Parameters
#
# [*sysconfigfile*]
#   Path to the sysconfigfile (e.g. /etc/sysconfig/activemq).
#
# [*amqbasedir*]
#   Parameter for ACTIVEMQ_BASE.
#
# [*amqhomedir*]
#   Parameter for ACTIVEMQ_HOME.
#
# [*amqconfdir*]
#   Parameter for ACTIVEMQ_CONF.
#
# [*amqdatadir*]
#   Parameter for ACTIVEMQ_DATA.
#
# [*amqmemopts*]
#   Parameter for ACTIVEMQ_OPTS_MEMORY.
#
# [*customvars*]
#   Custom key value pairs to append to the sysconfig file

class activemq::sysconfig(
  $sysconfigfile,
  $amqbasedir    = undef,
  $amqhomedir    = undef,
  $amqconfdir    = undef,
  $amqdatadir    = undef,
  $amqmemopts    = undef,
  $customvars    = {},
) {
  
  datacat { $sysconfigfile:
    template => "activemq/activemq.erb",
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
  }

  $basevars = {
    'ACTIVEMQ_BASE'        => $amqbasedir,
    'ACTIVEMQ_HOME'        => $amqhomedir,
    'ACTIVEMQ_CONF'        => $amqconfdir,
    'ACTIVEMQ_DATA'        => $amqdatadir,
    'ACTIVEMQ_OPTS_MEMORY' => $amqmemopts,
  }

  datacat_fragment { 'activemq_sysconfig':
    target => $sysconfigfile,
    data   => {
      sysconfig => merge($basevars, $customvars),
    }
  }

}


