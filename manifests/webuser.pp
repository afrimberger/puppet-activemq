# == Define: activemq::auth
#
#  Creates users which can authenticate through the admin webui
#
# == Parameters
#
# [*user*]
#   The name of the user
#   The value defaults to the "namevar"
#
# [*password*]
#   The user's password. Will be stored in clear-text
#
# [*roles*]
#   A list of roles, jetty's default is [ 'admin' ]
#
# [*configfile*]
#   Path to jetty's realm file (e.g. /etc/activemq/jetty-realm.properties)
#
# === Examples
# 
#  ::activemq::webuser { 'testuser':
#    password => 'testpwd',
#  }
#
# === Copyright
#
# André Frimberger, 2016
#
define activemq::webuser (
  $password,
  $user       = $title,
  $roles      = [ 'admin' ],
  $configfile = $::activemq::jettyrealmfile,
)
{
  validate_string($user)
  validate_string($password)
  validate_array($roles)

  # Populate jetty-realm.properties
  datacat_fragment{ "amq_jetty_realm_${user}":
    target  => $configfile,
    data    => {
      webusers => [{
          'username' => $user,
          'password' => $password,
          'roles'    => $roles,
      }]
    }
  }

}

