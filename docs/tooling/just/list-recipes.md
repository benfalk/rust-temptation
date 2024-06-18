# List Recipes

Recipes can be listed in alphabetical order with `just --list`:

```sh
$ just --list
Available recipes:
    build
    test
    deploy
    lint
```

Recipes in submodules can be listed with `just --list PATH`, where `PATH` is a
space- or `::`-separated module path:

```
$ cat justfile
mod foo
$ cat foo.just
mod bar
$ cat bar.just
baz:
$ just --unstable foo bar
Available recipes:
    baz
$ just --unstable foo::bar
Available recipes:
    baz
```

`just --summary` is more concise:

```sh
$ just --summary
build test deploy lint
```

Pass `--unsorted` to print recipes in the order they appear in the `justfile`:

```just
test:
  echo 'Testing!'

build:
  echo 'Building!'
```

```sh
$ just --list --unsorted
Available recipes:
    test
    build
```

```sh
$ just --summary --unsorted
test build
```

If you'd like `just` to default to listing the recipes in the `justfile`, you
can use this as your default recipe:

```just
default:
  @just --list
```

Note that you may need to add `--justfile {{justfile()}}` to the line above.
Without it, if you executed `just -f /some/distant/justfile -d .` or
`just -f ./non-standard-justfile`, the plain `just --list` inside the recipe
would not necessarily use the file you provided. It would try to find a
justfile in your current path, maybe even resulting in a `No justfile found`
error.

The heading text can be customized with `--list-heading`:

```sh
$ just --list --list-heading $'Cool stuff…\n'
Cool stuff…
    test
    build
```

And the indentation can be customized with `--list-prefix`:

```sh
$ just --list --list-prefix ····
Available recipes:
····test
····build
```

The argument to `--list-heading` replaces both the heading and the newline
following it, so it should contain a newline if non-empty. It works this way so
you can suppress the heading line entirely by passing the empty string:

```sh
$ just --list --list-heading ''
    test
    build
```
