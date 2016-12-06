class spamassassin::install inherits spamassassin {

  if($spamassassin::manage_package)
  {
    package { $spamassassin::params::package_name:
      ensure => $spamassassin::package_ensure,
    }
  }

}
