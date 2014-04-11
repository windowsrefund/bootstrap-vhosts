class apache {

	$packages = [apache2, php5, libapache2-mod-php5]
	$conf_dir = "/etc/apache2/sites-available"
	$doc_root_dir = "/var/www"

	package { $packages: ensure => installed }

  file { "/etc/apache2/site-enabled/000-default":
    ensure => absent,
    require => Package[$packages]
  }

}
