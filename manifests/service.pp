class spamassassin::service inherits spamassassin {

  #
  validate_bool($spamassassin::manage_docker_service)
  validate_bool($spamassassin::manage_service)
  validate_bool($spamassassin::service_enable)

  validate_re($spamassassin::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${spamassassin::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $spamassassin::manage_docker_service)
  {
    if($spamassassin::manage_service)
    {
      service { $spamassassin::params::service_name:
        ensure => $spamassassin::service_ensure,
        enable => $spamassassin::service_enable,
      }
    }
  }
}
