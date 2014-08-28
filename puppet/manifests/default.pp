class { 'apt':
#  always_apt_update => true
}
# apt::ppa { 'ppa:ondrej/php5': }
apt::ppa { 'ppa:rip84/php5': }
# apt::builddep { 'python-software-properties': }

# Class['::apt::update'] -> Package <|
#   title != 'python-software-properties' and
#   title != 'software-properties-common'
# |>

class { 'apache':
  mpm_module => 'prefork',
  default_vhost => false
}
class { 'apache::mod::ssl': }
class { 'apache::mod::php': }

apache::vhost { '*':
    docroot             => '/vagrant',
    # server_name         => false,
    # priority            => '',
    # template            => 'apache/virtualhost/vhost.conf.erb',
}

# apache::vhost { 'bob':
#     port                => 443,
#     port                => 80,
#     docroot             => '/vagrant',
#     # server_name         => false,
#     # priority            => '',
#     # template            => 'apache/virtualhost/vhost.conf.erb',
#     ssl                 => true,
# }

# class { 'php': }
