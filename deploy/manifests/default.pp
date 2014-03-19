$user       = "sanoma"
$password   = "devops"
$project    = "devops_challenge"

user { "$user": 
  ensure      => present,
  password    => sha1("$password"),
  home        => "/home/$user",
  managehome  => true
}

file { "/home/$user":
  ensure  => directory,
  owner   => $user,
  group   => $user,
  mode    => 755,
  require => User["$user"]
}

file { "/home/$user/$project":
  ensure  => directory,
  owner   => $user,
  group   => $user,
  mode    => 755
}

class { 'mezzanine':
  user    => $user,
  project => $project
}

class { 'nginx': }

class { 'nginx::mezzanine_vhost':
  project => $project
}

class { 'gunicorn': }
