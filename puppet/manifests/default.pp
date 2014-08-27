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

class { 'apache': }

apache::vhost { 'default':
    docroot             => '/vagrant',
    server_name         => false,
    priority            => '',
    template            => 'apache/virtualhost/vhost.conf.erb',
}

class { 'php': }
