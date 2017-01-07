# bayes_ignore_to users@spamassassin.apache.org
# bayes_ignore_to spamassassin-users@incubator.apache.org
# bayes_ignore_from *@spamassassin.apache.org
define spamassassin::bayes_ignore (
                                    $ignore_email = $name,
                                    $from         = false,
                                    $to           = false,
                                  ) {
  if($from)
  {
    concat::fragment{ "localcf bayes_ignore ${ignore_email} from":
      target  => '/etc/mail/spamassassin/local.cf',
      order   => '99',
      content => "bayes_ignore_from $ignore_email\n",
    }
  }

  if($to)
  {
    concat::fragment{ "localcf bayes_ignore ${ignore_email} to":
      target  => '/etc/mail/spamassassin/local.cf',
      order   => '99',
      content => "bayes_ignore_to $ignore_email\n",
    }
  }

}
