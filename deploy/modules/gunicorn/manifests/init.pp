class gunicorn() {

  package { 'gunicorn':
    provider  => pip,
    ensure    => present,
    require   => Package['python-pip'];
  }
}
