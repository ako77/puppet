#==============================================================================================

node 'cmmaster', 'lnx-01' {
  include puppet
  include sudoers
  include accounts
  realize (Accounts::Virtual['ead', 'sysop', 'mku'])
  exec { 'Run arbitrary command' :
    command => '/bin/echo Ok, last ran papply on `/bin/date` > /tmp/command.output.txt',
  }
  class { 'ntp':
    servers => [ '192.168.10.254', 'ntp1.ptb.de', 'ntp2.ptb.de' ],
  }
}

#==============================================================================================

node 'lnx-02' {
  include puppet
  include apt
  include sudoers
  include accounts
  realize (Accounts::Virtual['ead', 'sysop', 'mku'])
  exec { 'Run arbitrary command' :
    command => '/bin/echo Ok, last ran papply on `/bin/date` > /tmp/command.output.txt',
  }
  class { 'ntp':
    servers => [ '192.168.10.254', 'ntp1.ptb.de', 'ntp2.ptb.de' ],
  }
  ### Install php 5.4 ppa.
  class { 'nginxphp::ppa': stage => 'setup' }
  ### Initiate the module base requirements.
  include nginxphp
  ### Install php-fpm with the modules you desire.
  class { 'nginxphp::php':
    php_packages => [
      "php5-intl",
      "php5-curl",
      "php5-gd",
      "php5-xcache",
      "php5-mcrypt",
      "php5-xmlrpc",
      "php5-xsl",
      "php5-imagick",
      "php5-mysql",
    ],
    withppa      => true
  }
  ### Install Nginx
  include nginxphp::nginx
  ### Install PHP developement tools.
  include nginxphp::phpdev
  ### Configure FPM Pool
  nginxphp::fpmconfig { 'ubuntu':
    php_devmode   => true,
    fpm_user      => 'www-data',
    fpm_group     => 'www-data',
    fpm_allowed_clients => ''
  }
  ### Configure Nginx site
  nginxphp::nginx_addphpconfig { 'lnx-02.kitenet.loc':
    website_root       => "/var/www/",
    default_controller => "index.php",
    require => Nginxphp::Fpmconfig['ubuntu']
  }
}


#==============================================================================================

node 'lnx-03' {
  include puppet
  include sudoers
  include accounts
  realize (Accounts::Virtual['ead', 'sysop', 'mku'])
  exec { 'Run arbitrary command' :
    command => '/bin/echo Ok, last ran papply on `/bin/date` > /tmp/command.output.txt',
  }
  class { 'ntp':
    servers => [ '192.168.10.254', 'ntp1.ptb.de', 'ntp2.ptb.de' ],
  }
  class { '::mysql::server':
    root_password    => 'strongpassword',
    override_options => { 'mysqld' => { 'max_connections' => '100', 'query_cache_size' => '64M' } }
  }
  mysql_grant { 'root@localhost/*.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'root@localhost',
  }
  mysql::db { 'zabbix':
    user        => 'zabbix',
    password    => 'zabbix',
    host        => 'localhost',
    grant       => ['ALL'],
  }
  class { '::mysql::bindings':
    php_enable => 1,
    perl_enable => 1
  }
}
