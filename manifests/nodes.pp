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
    php_enable => 0,
    perl_enable => 1,
  }
}
