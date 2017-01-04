define spamassassin::rule (
                            $score,
                            $ruletype,
                            $expresion,
                            $rulename    = $name,
                            $description = undef,
                            $order       = '42',
                          ) {
  concat::fragment{ 'localcf header':
    target  => '/etc/mail/spamassassin/local.cf',
    order   => '00',
    content => template("${module_name}/rule.erb"),
  }
}
