class apache {

	$packages = [apache2, php5, libapache2-mod-php5]
	$conf_dir = "/etc/apache2/sites-available"
	$doc_root_dir = "/var/www"

	package { $packages: ensure => installed }


  # remove the default vhost and clobber ports.conf so
  # we can avoid having to manage apache2.conf

  file {
    "/etc/apache2/site-enabled/000-default":
      ensure => absent,
      require => Package[$packages];
    "/etc/apache2/ports.conf":
      ensure => present,
      content => "",
      require => Package[$packages];
  }

  service { apache2:
    ensure => stopped
    enable => false,
    require => Package[$packages],
  }
}
