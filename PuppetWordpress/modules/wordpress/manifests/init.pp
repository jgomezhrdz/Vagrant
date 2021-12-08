class wordpress { 

  exec{ "downloadWp":
    command => "/usr/bin/wget http://wordpress.org/latest.tar.gz -O /${document_root}/wp.tar.gz",
    require => Package["wget"]
  }

  exec{ "installWp":
    require => [Exec["downloadWp"], Package["tar"]],
    command => "/bin/tar -xzvf /${document_root}/wp.tar.gz -C ${document_root}"
  }

  #file { "${document_root}/wordpress/wp-config.php" :
  #  ensure => present,
  #  source => "puppet:///modules/wordpress/wp-config.php",
  #  require => File["${document_root}/wordpress/wp-config.php"]
  #}
}
