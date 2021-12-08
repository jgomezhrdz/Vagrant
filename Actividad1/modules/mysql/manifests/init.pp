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

   # create a directory
  file { "${document_root}/mysqlConfig/":
    ensure => 'directory',
  } ->
  file { "${document_root}/mysqlConfig/commands.sql":
    ensure => present,
    source => "puppet:///modules/mysql/commands.sql",
    require => Service["mysql"],
  } ->
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
