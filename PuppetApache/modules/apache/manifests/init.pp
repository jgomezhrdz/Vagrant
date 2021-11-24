class apache {
  #el exec permite ejecutar un comando en la máquina remota
  exec { 'apt-update':
    command => 'usr/bun/apt-get update'
  }

  #Relacion de dependencia --> Para todo paquete a instalar, se ha tenido que ejecutar el recurso anterior
  EXEC["apt-update"]-> Package <| |>

  #Instalacion del paquete apache2
  package { "pache2":
    ensure => installed,
  }
}
