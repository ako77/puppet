# Used to define/realize users on Puppet-managed Systems
#
class accounts {

  @accounts::virtual { 'ead' :
    uid      => 1001,
    realname => 'System Operator',
    pass     => '$6$uz2FWMAEGCpD91SJ$aFub4P9h8O.nBpeGc3vtFUcGMqU9PpPiyN9KGcPzCktBxx2bZ1Wxi.zxsrKLkPX5205JO0x9op1si2SruvHnB0',
    #require  => Class['accounts::config'],
  }
  @accounts::virtual { 'sysop' :
    uid      => 1002,
    realname => 'System Operator',
    pass     => '$6$uz2FWMAEGCpD91SJ$aFub4P9h8O.nBpeGc3vtFUcGMqU9PpPiyN9KGcPzCktBxx2bZ1Wxi.zxsrKLkPX5205JO0x9op1si2SruvHnB0',
    #require  => Class['accounts::config'],
  }
  @accounts::virtual { 'mku' :
    uid      => 1003,
    realname => 'Markus Künstler',
    pass     => '$6$dIJeZPsY/mI$VGgVVsFERsUHcFlJ9xJ76malX4j4Dztz6a4H5YWd8CBqghbvD1SFiZj4gHHMpO.dzvdJWKG3EHRLBJ/8pCQ7G.',
    #require  => Class['accounts::config'],
  }
}
