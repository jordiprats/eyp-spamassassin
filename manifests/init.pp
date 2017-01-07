class spamassassin(
                    $manage_package                     = true,
                    $package_ensure                     = 'installed',
                    $manage_service                     = true,
                    $manage_docker_service              = true,
                    $service_ensure                     = 'running',
                    $service_enable                     = true,
                    $spamd_max_children                 = '5',
                    $required_score                     = '5',
                    $report_safe                        = false,
                    $rewrite_header                     = 'Subject [SPAM]',
                    $use_pyzor                          = false,
                    $skip_rbl_checks                    = false,
                    $rbl_timeout                        = '5',
                    $use_bayes                          = true,
                    $use_bayes_rules                    = true,
                    $bayes_auto_learn                   = true,
                    $bayes_auto_learn_threshold_spam    = '10.0',
                    $bayes_auto_learn_threshold_nonspam = '-0.1',
                    $use_auto_whitelist                 = false,
                  ) inherits spamassassin::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::spamassassin::install': } ->
  class { '::spamassassin::config': } ~>
  class { '::spamassassin::service': } ->
  Class['::spamassassin']

}
