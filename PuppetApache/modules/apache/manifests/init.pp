class apache {
  #el exec permite ejecutar un comando en la máquina remota
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  #Relacion de dependencia --> Para todo paquete a instalar, se ha tenido que ejecutar el recurso anterior
  Exec['apt-update'] -> Package <| |>

  #Instalacion del paquete apache2
  package { 'apache2':
    ensure => installed
  }

  service { 'apache2':
    ensure => running,
    enable => true,
    hasstatus => true,
    restart => "/usr/sbin/apachectl configtest && /usr/sbin/service apache2 reload",
  }

  #Añadir los files
  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent,
    require => Package['apache2'],
  }

  file { '/etc/apache2/sites-available/vagrant.conf':
    content => template('apache/virtual-hosts.conf.erb'),
    require => File['/etc/apache2/sites-enabled/000-default.conf'],
  }

  file { "/etc/apache2/sites-enabled/vagrant.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/vagrant.conf",
    require => File['/etc/apache2/sites-available/vagrant.conf'],
  }

  file { "${document_root}/index.html":
    ensure => present,
    source => 'puppet:///modules/apache/index.html',
    require => File['/etc/apache2/sites-enabled/vagrant.conf'],
  }
}
