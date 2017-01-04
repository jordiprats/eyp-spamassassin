define spamassassin::rule (
                            $score,
                            $ruletype,
                            $expresion,
                            $rulename    = $name,
                            $description = undef,
                            $order       = '42',
                          ) {
  concat::fragment{ "localcf ${rulename}":
    target  => '/etc/mail/spamassassin/local.cf',
    order   => $order,
    content => template("${module_name}/rule.erb"),
  }
}
