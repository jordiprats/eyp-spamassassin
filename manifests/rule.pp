#
# Notes about rule scores
#
# A few short words about the behavior of the "score" command.
#
#     rules with a score set to 0 are not evaluated at all
#     rules with no score statement will be scored at 1.0, unless 3 or 4 is true
#     rules starting with a double underscore are evaluated with no score, and are intended for use in meta rules where you don't want the sub-rules to have a score.
#     although intended for the sa development effort, any rule starting with T_ will be treated as a "test" rule and will be run with a score of 0.01 (nearly 0). This can be handy when testing rules so you don't have to create score lines for them if you think you're not going to keep them.
#
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
