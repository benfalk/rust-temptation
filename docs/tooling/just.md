# `just`

```admonish note

> Most of the workflows in this project utilize the `just` command runner.
> I highly recommend reading the offical documentation to get a feel for
> how to read the current _"recipes"_ in a `justfile`.
```

```admonish tip title = "Offical Docs"
> **<https://just.systems/man/en/>**
```

```admonish tip title = "Features"
`just` has a ton of useful features, and many improvements over `make`:

- `just` is a command runner, not a build system, so it avoids much of
  [`make`'s complexity and idiosyncrasies]. No need for `.PHONY` recipes!

- Linux, MacOS, and Windows are supported with no additional dependencies.
  (Although if your system doesn't have an `sh`, you'll need to
  [choose a different shell].)

- Errors are specific and informative, and syntax errors are reported along
  with their source context.

- Recipes can accept [command line arguments].

- Wherever possible, errors are resolved statically. Unknown recipes and
  circular dependencies are reported before anything runs.

- `just` [loads `.env` files], making it easy to populate environment variables.

- Recipes can be [listed from the command line].

- [Command line completion scripts] are available for most popular shells.

- Recipes can be written in [arbitrary languages], like Python or NodeJS.

- `just` can be invoked from any subdirectory, not just the directory that
  contains the `justfile`.

- And [much more](https://just.systems/man/en/)!

[`make`'s complexity and idiosyncrasies]: ./just/avoided-make-complexity.md
[choose a different shell]: ./just/choosing-a-different-shell.md
[command line arguments]: ./just/recipes-with-arguments.md
[loads `.env` files]: ./just/loading-env-files.md
[listed from the command line]: ./just/list-recipes.md
[Command line completion scripts]: ./just/command-line-completion.md
[arbitrary languages]: ./just/using-other-languages.md
```
