class apache {

	$packages = [apache2, php5, libapache2-mod-php5]
	$conf_dir = "/etc/apache2/sites-available"
	$doc_root_dir = "/var/www"

	package { $packages: ensure => installed }

	# TODOs
	#
	# rm default config
	# ensure service is not running since we're going with Docker
}
