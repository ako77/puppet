class puppet {

  file { '/usr/local/bin/papply':
    source  => 'puppet:///modules/puppet/papply.sh',
    mode    => '0755',
  }

  file { '/usr/local/bin/pull-updates':
    source  => 'puppet:///modules/puppet/pull-updates.sh',
    mode    => '0755',
  }

#  file { '/etc/vim/vimrc':
#    source  => 'puppet:///modules/puppet/vimrc',
#    mode    => '0644',
#    owner   => 'root',
#    group   => 'root',
#  }

  #file { '/home/ubuntu/.ssh/id_rsa':
    #source  => 'puppet:///modules/puppet/ubuntu.priv',
    #owner   => 'ubuntu',
    #mode    => '0600',
  #}

  cron { 'run-puppet':
    ensure  => 'absent',
    user    => 'ubuntu',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/15',
    hour    => '*',
  }

  exec { "change vimrc":
    command => "/usr/bin/sudo /bin/sed -i 's/\"set background=dark/set background=dark/g' /etc/vim/vimrc",
  }
}
