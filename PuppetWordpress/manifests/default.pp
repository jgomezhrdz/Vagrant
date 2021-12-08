
$document_root = "/vagrant"
$initial_path = "${document_root}/wordpress/"
include mysql
include apache
include php
include wordpress


exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

#Relacion de dependencia --> Para todo paquete a instalar, se ha tenido que ejecutar el recurso anterior
Exec['apt-update'] -> Package <| |>
Exec['apt-update'] -> Service <| |>

package { 'wget':
  ensure  => present,
}

package { 'tar':
  ensure  => present,
}
