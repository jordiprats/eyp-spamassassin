class spamassassin::config inherits spamassassin {

  if($spamassassin::params::sysconfig_file!=undef)
  {
    file { $spamassassin::params::sysconfig_file:
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/${spamassassin::params::sysconfig_template}"),
    }
  }

  file { '/etc/mail/spamassassin/local.cf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/localcf.erb"),
  }

}
