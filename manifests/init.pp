class spamassassin(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                            $spamd_max_children    = '5',
                            $required_hits         = '5',
                            $report_safe           = '0',
                            $rewrite_header        = 'Subject [SPAM]',
                          ) inherits spamassassin::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::spamassassin::install': } ->
  class { '::spamassassin::config': } ~>
  class { '::spamassassin::service': } ->
  Class['::spamassassin']

}
