# Used to define/realize users on Puppet-managed Systems
#
class accounts {

  @accounts::virtual { 'ubuntu' :
    uid        => 1000,
    realname   => 'System Operator',
    pass       => '$6$uz2FWMAEGCpD91SJ$aFub4P9h8O.nBpeGc3vtFUcGMqU9PpPiyN9KGcPzCktBxx2bZ1Wxi.zxsrKLkPX5205JO0x9op1si2SruvHnB0',
    sshkeytype => 'ssh-rsa',
    sshkey     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD7LDYeZRR6tdynb6PCBm3h4eShTZb0RTsHpmfF5NmXejbgNWpBjqQrJDY0dqch73jkVjjoUolwT9UZrV6WJrYrzjb2wsgWNo3Yl4yUH/B11kLwok8PkyHdgptY6ZLNJ1ZKBw48BFwQekKNme/9TC1MmZtsYpmOtQ/CWvcH+WGn5vZ38gSLbvRkR91lRqchGnXDp9+oGUsiLXqBa6sbe9ATsx5AjiAg9jAFx+9BJudgxR+Aloht6O6Zg5QRS/6ziIXq6qQclm7aROhVndnLetQ5/hCf0SZgdu/YZ+Aer7ys7C9WINwRjuUSqVdy/CSSlq6qsByidhaDV+sfTD4c7047',
    #require    => Class['accounts::config'],
  }
 
  @accounts::virtual { 'ead' :
    uid        => 1001,
    realname   => 'System Operator',
    pass       => '$6$uz2FWMAEGCpD91SJ$aFub4P9h8O.nBpeGc3vtFUcGMqU9PpPiyN9KGcPzCktBxx2bZ1Wxi.zxsrKLkPX5205JO0x9op1si2SruvHnB0',
    sshkeytype => 'ssh-rsa',
    sshkey     => 'AAAAB3NzaC1yc2EAAAABJQAAAQBhWrCVlRU+7M43dSC+InWXNTQiRX9yI3wtt3ek4Jr8URPM6Daep6JJhVhsHFua8LMk/Sga/jysQXJlBmPxa6XSMeAhKXwtQy3zrx8e6QvM4YKpeJho+21LhHdZmtDWgcdS9GIsO1fLC+3a8osTOznHMqghW0Iy9B6b+CeG+/X/B37UIjoaH5swY8sh53wzpx0lBbDX5b/vDadYlHKagtTU1ghMk+OvHcuWEjg3Hzu3D+uuY9GVY6cEJbPuGFh0hvWz2+KnTQqN4JpDjd5Wh/VIw6PPWhkF9ulSVTVVFsTCokPyMCClYEVy73geqHi8YxYNu4KFcgnrQsQZS1eXOnxP',
    #require    => Class['accounts::config'],
  }
  @accounts::virtual { 'sysop' :
    uid        => 1002,
    realname   => 'System Operator',
    pass       => '$6$uz2FWMAEGCpD91SJ$aFub4P9h8O.nBpeGc3vtFUcGMqU9PpPiyN9KGcPzCktBxx2bZ1Wxi.zxsrKLkPX5205JO0x9op1si2SruvHnB0',
    sshkeytype => '',
    sshkey     => '',
    #require    => Class['accounts::config'],
  }
  @accounts::virtual { 'mku' :
    uid        => 1003,
    realname   => 'Markus Künstler',
    pass       => '$6$dIJeZPsY/mI$VGgVVsFERsUHcFlJ9xJ76malX4j4Dztz6a4H5YWd8CBqghbvD1SFiZj4gHHMpO.dzvdJWKG3EHRLBJ/8pCQ7G.',
    sshkeytype => '',
    sshkey     => '',
    #require    => Class['accounts::config'],
  }
}
