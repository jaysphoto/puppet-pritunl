class pritunl::ubuntu {
#  apt::key { 'pritunl':
#    id => '7568D9BB55FF9E5287D586017AE645C0CF8E292A',
#    server => 'keyserver.ubuntu.com'
#  }
  apt::source { 'pritunl':
    location  => 'https://repo.pritunl.com/stable/apt',
    repos     => 'main',
    key => {
      id      => '7568D9BB55FF9E5287D586017AE645C0CF8E292A',
      server  => 'keyserver.ubuntu.com'
    }
  }

  package { 'pritunl':
    require => Apt::Source['pritunl']
  }
}
