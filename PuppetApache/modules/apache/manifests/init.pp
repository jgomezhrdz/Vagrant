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
}
