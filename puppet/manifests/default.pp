# class { 'apt':
# #  always_apt_update => true
# }
# apt::ppa { 'ppa:ondrej/php5': }
# apt::ppa { 'ppa:rip84/php5': }
# apt::builddep { 'python-software-properties': }

# Class['::apt::update'] -> Package <|
#   title != 'python-software-properties' and
#   title != 'software-properties-common'
# |>

class { 'apache': }
#   mpm_module => 'prefork',
#   default_vhost => false
# }
include apache::ssl
# class { 'apache::mod::ssl': }
# class { 'apache::mod::php': }

apache::vhost { 'default':
    docroot             => '/vagrant',
    server_name         => false,
    priority            => '000',
    template            => 'apache/virtualhost/vhost.conf.erb',

    directory => '/vagrant',
    directory_options => 'Indexes FollowSymLinks Includes ExecCGI',
    directory_require => 'all granted'
}

apache::vhost { 'default-ssl':
    port                => 443,
    docroot             => '/vagrant',
    server_name         => false,
    priority            => '000',
    template            => 'apache/virtualhost/test.vhost.conf.erb',
    ssl                 => true,

    directory => '/vagrant',
    directory_options => 'Indexes FollowSymLinks Includes ExecCGI',
    directory_require => 'all granted'
}

class { 'php': }
