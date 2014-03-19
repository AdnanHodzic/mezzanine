class nginx::mezzanine_vhost ($project = "mezzanine_project") {
  file { "/etc/nginx/conf.d/$project.conf":
    ensure  => present,
    content => template("nginx/mezzanine_vhost.conf.erb"),
    require => Package["nginx"],
    notify  => Service["nginx"];
  }
}
