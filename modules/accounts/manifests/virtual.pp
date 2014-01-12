# Defined type for creating virtual users accounts
#
define accounts::virtual($uid,$realname,$pass,$sshkeytype,$sshkey) {
#  include accounts::params
  # Pull in values from accounts::params
#  $homepath = $accounts::params::homepath
#  $shell = $accounts::params::shell

  user { $title :
    ensure     => present,
    uid        => $uid,
    gid        => $title,
    shell      => '/bin/bash',
    home       => "/home/${title}",
    comment    => $realname,
    password   => $pass,
    managehome => true,
    require    => Group[$title],
  }

  group { $title :
    gid        => $uid,
  }

  file { "/home/${title}" :
    ensure     => directory,
    owner      => $title,
    group      => $title,
    mode       => '0750',
    require    => [ User[$title], Group[$title] ],
  }

  # Ensure the .ssh directory exists with the right permissions
  file { "/home/${title}/.ssh" :
    ensure     => directory,
    owner      => $title,
    group      => $title,
    mode       => '0700',
    require    => File["/home/${title}"],
  }

  # Add user's SSH key
  if ($sshkey != '' and $sshkeytype != '') {
    ssh_authorized_key { $title :
      ensure   => present,
      name     => $title,
      user     => $title,
      type     => $sshkeytype,
      key      => $sshkey,
      require => File["/home/${title}/.ssh"]
    }
  }
}
