class pritunl::centos {
  package { 'epel-release': }

  $gpgkey = '/etc/pki/rpm-gpg/RPM-GPG-KEY-pritunl'

  file { $gpgkey:
    ensure  => present,
    content => file('pritunl/gnupg/pritunl.key'),
  }

  exec { 'install-gpg-key':
    command => "/bin/rpm --import ${gpgkey}",
    unless  => '/bin/rpm -q gpg-pubkey-cf8e292a',
    require => File[$gpgkey],
  }

  yumrepo { 'pritunl':
    enabled  => 1,
    gpgcheck => 1,
    descr    => 'Pritunl Repository',
    baseurl  => "https://repo.pritunl.com/stable/yum/centos/${::facts['os']['release']['major']}/",
  }
  ->
  package { 'pritunl':
    ensure  => present,
    require => [Package['epel-release'], Exec['install-gpg-key']]
  }
}