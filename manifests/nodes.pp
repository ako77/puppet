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
    config_hash => { root_password => 'strongpassword' },
    override_options => { 'mysqld' => { 'max_connections' => '1024' } }
  }
  database_user { 'zabbix@localhost':
    password_hash   => mysql_password('zabbix')
  }
  database_grant { 'zabbix@localhost/*':
    privileges  => ['ALL'],
  }
  mysql::db { 'zabbix':
    user        => 'zabbix',
    password    => 'zabbix',
    host        => 'localhost',
    grant       => ['ALL'],
  } 
}
