class mysqlserver{
  
  package { 'mysql-server':
    ensure => present
  }

  service { 'mysql':
    require => Package['mysql-server'],
    ensure => running,
    enable => true,
    hasstatus => true
  }
}
