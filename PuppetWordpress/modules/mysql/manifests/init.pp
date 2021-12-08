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
    command => "mysqladmin -uroot password root",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }

   # create a directory
  file { "${document_root}/mysqlConfig/":
    ensure => 'directory',
  }

  File["${document_root}/mysqlConfig/"] -> File["${document_root}/mysqlConfig/commands.sql", "${document_root}/mysqlConfig/wordpressBackup.sql"]

  file { "${document_root}/mysqlConfig/commands.sql":
    ensure => present,
    source => "puppet:///modules/mysql/commands.sql",
    require => Service["mysql"],
  }

  file { "${document_root}/mysqlConfig/wordpressBackup.sql":
    ensure => present,
    source => "puppet:///modules/mysql/wordpressBackup.sql",
    require => Service["mysql"],
  }

  exec { "createUser" :
    command =>  "/usr/bin/mysql -uroot < ${document_root}/mysqlConfig/commands.sql",
    require => File["${document_root}/mysqlConfig/commands.sql"]
  }

  exec { "importBackup" :
    command =>  "/usr/bin/mysql -uroot < ${document_root}/mysqlConfig/wordpressBackup.sql",
    require => File["${document_root}/mysqlConfig/wordpressBackup.sql"]
  }


}
