class { 'apache': }
class { 'apache::ssl': }

# file { '/etc/apache2/conf.d':
#     ensure => "directory",
#     owner  => "root",
#     group  => "root",
#     mode   => 755,
# }

apache::listen{ '81':
  # require => File['/etc/apache2/conf.d']
}

apache::vhost { 'default':
    docroot             => '/vagrant',
    server_name         => false,
    priority            => '000',
    template            => 'apache/virtualhost/vhost.conf.erb',

    directory => '/vagrant',
    directory_options => 'Indexes FollowSymLinks Includes ExecCGI',
    directory_require => 'all granted'
}

apache::vhost { 'test':
    port                => 81,
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
