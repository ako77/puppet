# Used to define/realize users on Puppet-managed Systems
#
class accounts {

  @accounts::virtual { 'ead' :
    uid      => 1001,
    realname => 'System Operator',
    pass     => '',
  }
  @accounts::virtual { 'sysop' :
    uid      => 1002,
    realname => 'System Operator',
    pass     => '',
  }
  @accounts::virtual { 'mku' :
    uid      => 1003,
    realname => 'Markus Künstler',
    pass     => '',
  }
}
