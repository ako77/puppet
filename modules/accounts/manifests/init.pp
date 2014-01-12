# Used to define/realize users on Puppet-managed Systems
#
class accounts {

  @accounts::virtual { 'ead' :
    uid      => 1001,
    realname => 'System Operator',
    pass     => '',
  }
}
