#!/usr/bin/env just --justfile
set dotenv-load := true

library-name := "tempted-library"

# lists out all available recipes
list:
  @just --list

# setup develop environment
init:
  cargo binstall -V || cargo install cargo-binstall
  cargo binstall mdbook --no-confirm
  cargo binstall mdbook-admonish --no-confirm
  cargo binstall mdbook-mermaid --no-confirm
  cargo binstall cargo-generate --no-confirm

# create docs
docs:
  mdbook build

docs-serve:
  mdbook serve -p 8003 --open

generate-tempted-library:
  cargo generate --path . --lib --name {{library-name}}
  cd {{library-name}} && just init

# build out template variations
generate:
  @just clean
  @just generate-tempted-library

ci:
  @just generate
  cd {{library-name}} && just test
  cd {{library-name}} && just benchmark

# clean up all builds
clean:
  rm -rf book
  rm -rf {{library-name}}
