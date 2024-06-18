# Recipes with Arguments

`just` supports a number of useful command line options for listing, dumping,
and debugging recipes and variables:

```sh
$ just --list
Available recipes:
  js
  perl
  polyglot
  python
  ruby
$ just --show perl
perl:
  #!/usr/bin/env perl
  print "Larry Wall says Hi!\n";
$ just --show polyglot
polyglot: python js perl sh ruby
```

Some command-line options can be set with environment variables. For example:

```sh
export JUST_UNSTABLE=1
just
```

Is equivalent to:

```sh
just --unstable
```

Consult `just --help` to see which options can be set from environment
variables.
