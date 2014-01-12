node 'cmmaster', 'lnx-01' {
  include puppet
  include sudoers
  include accounts
  realize (Accounts::Virtual['ead', 'sysop', 'mku'])
  exec { 'Run arbitrary command' :
    command => '/bin/echo Ok, last ran papply on `/bin/date` > /tmp/command.output.txt',
  }
}
