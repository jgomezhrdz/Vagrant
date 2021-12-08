class apache {
  #Instalacion del paquete apache2
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure => running, #Ensure that the service is always running
    enable => true,
    hasstatus => true,
    restart => "/usr/sbin/apachectl configtest && /usr/sbin/service apache2 reload", #Reloads the service
 }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent, #Asegura que el archivo no va a estar
    require => Package['apache2'], #If only the package is present --> dependecies
  }

  file { '/etc/apache2/sites-available/vagrant.conf':
    content => template('apache/virtual-hosts.conf.erb'), #Crea un archivo a partir de la plantilla.erb
    require => File['/etc/apache2/sites-enabled/000-default.conf'],
  }

  file { "/etc/apache2/sites-enabled/vagrant.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/vagrant.conf", #Crea un symbolic link con el archivo .conf
    require => File['/etc/apache2/sites-available/vagrant.conf'],
    notify => Service['apache2'], #Notifican al recurso ["Recurso"] para que se reinicie
  }

  file { "${document_root}/index.html":
    ensure => present,
    source => 'puppet:///modules/apache/index.html',
    require => File['/etc/apache2/sites-enabled/vagrant.conf'],
    notify => Service['apache2'],
  }

}
