# spamassassin


#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What spamassassin affects](#what-spamassassin-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with spamassassin](#beginning-with-spamassassin)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What spamassassin affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements

This module requires pluginsync enabled

### Beginning with spamassassin

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

* defaults:
```
required_score 4.0
rewrite_header Subject [SPAM]
report_safe 0
use_pyzor 0
skip_rbl_checks 0
rbl_timeout 5
use_bayes 1
use_bayes_rules 1
bayes_auto_learn 1
bayes_path /home/spamd/.spamassassin/bayes
bayes_auto_learn_threshold_spam 10.0
```
* Poder afegir regles:
```
rawbody		UK_EXPORTS		/ukfoodexports/i
describe	UK_EXPORTS		Magnifics food exports de UK
score		UK_EXPORTS		4

body		USTED_SU_PROPIO_JEFE		/Usted mismo ser. su propio jefe/i
header 		CARRERA_EXITOSA		Subject =~ /Su carrera exitosa/i
header		MEJORAR_GANANCIAS	Subject =~ /Quiere mejorar sus ganancias/i
header 		COMPANIA_PROSPERA	Subject =~ /Comiencen el trabajo en una compania prospera/i
body		VIRGIN_MONEY		/Virgin Money/i
meta		OFERTES_FEINA_FRAUS	(MEJORAR_GANANCIAS || CARRERA_EXITOSA || COMPANIA_PROSPERA || VIRGIN_MONEY || USTED_SU_PROPIO_JEFE)
describe	OFERTES_FEINA_FRAUS	Merda de ofertes de feina
score		OFERTES_FEINA_FRAUS	6

body		TRADUCTOR_AUTOMATIC	/Buscamos a las personas que tienen el derecho de trabajar en Espa/i
describe	TRADUCTOR_AUTOMATIC	Frase de traductor automatic
score		TRADUCTOR_AUTOMATIC	6

body 		PETER_WONG_DONEM_LES_TEVES_DADES 	/Peter Wong Shun Tung/i
describe	PETER_WONG_DONEM_LES_TEVES_DADES	Peter pelma que vol tenir les teves dades
score		PETER_WONG_DONEM_LES_TEVES_DADES	8

rawbody __AMADEUS1 /BILLETE ELECTRONICO/
rawbody __AMADEUS2 /LOCALIZADOR DE RESERVA/
meta AMADEUS ((__AMADEUS1 + __AMADEUS2) > 1)
score AMADEUS -10
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
