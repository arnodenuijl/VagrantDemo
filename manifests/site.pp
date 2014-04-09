exec { "apt-get update":
	path => "/usr/bin",
}

class { 'nodejs':
	version => 'stable',
	make_install => false,
}

package { 'express':
	provider => npm,
	require => Class['nodejs'],
}

package { 'forever':
	provider => npm,
	require => Package['express'],
}

file { "/opt/node":
	ensure  => "link",
	target  => "/vagrant/files/webapp",
	force   => true,
	require => Package['forever'],
}

file { "/etc/init/NodeJsVagrantDemo.conf":
	ensure  => file,
	source  => "/vagrant/files/NodeJsUpstart.conf",
	mode => 644,
	owner => "root",
	group => "root",	
	require => File['/opt/node'],
}

service { 'NodeJsVagrantDemo':
	ensure => running,
	provider => 'upstart',
	require => File['/etc/init/NodeJsVagrantDemo.conf'],
}


