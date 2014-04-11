define apache::vhost(
	$port = 80,
	$enabled = true
) {

	include apache

	file {
		"conf-$name":
			path => "${apache::conf_dir}/${name}.conf",
			content => template("apache/vhost.conf.erb"),
			require => Package[apache2];
		"docroot-$name":
			path => "${apache::doc_root_dir}/$name",
			owner => 0,
			group => 0,
			mode => 0644,
			source => "puppet:///modules/apache/$name",
			recurse => true,
			require => Package[apache2];
    "link-$name":
      path => "/etc/apache2/sites-enabled/${name}",
      ensure => $enabled ? {
        true => link,
        default => absent,
      },
      target => "${apache::conf_dir}/${name}.conf",
      require => File["conf-$name"];
	}
}	
