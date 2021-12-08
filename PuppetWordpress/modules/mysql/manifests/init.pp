class mysql {
  # Install mysql
  package { 'mysql-server':
    ensure => installed,
  }

  # Run mysql
  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  # We set the root password here
  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => "mysqladmin -uroot password a9120ed2b58af37862a83f5b9f850819ed08b2a9",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }


}
