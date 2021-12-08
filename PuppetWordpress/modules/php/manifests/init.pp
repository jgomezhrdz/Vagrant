class php{
  package { 'php':
    ensure => installed
  }

  package { 'php-cli':
    ensure => installed
  }

  package { 'php-mysql':
    ensure => installed
  }

  package { 'libapache2-mod-php':
    ensure => installed
  }

  file { "${document_root}/index.php":
    require => Package['php', 'php-cli', 'php-mysql', 'libapache2-mod-php'],
    content => '<?php  phpinfo(); ?>',
    ensure => present
  }


}
