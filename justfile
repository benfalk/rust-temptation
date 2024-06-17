#!/usr/bin/env just --justfile
set dotenv-load := true

library-name := "tempted-library"

# lists out all available recipes
list:
  @just --list

# setup develop environment
init:
  cargo binstall -V || cargo install cargo-binstall
  cargo binstall mdbook
  cargo binstall cargo-generate

# create docs
docs:
  mdbook build

generate-tempted-library:
  cargo generate --path . --lib --name {{library-name}}

# build out template variations
generate:
  @just clean
  @just generate-tempted-library

# clean up all builds
clean:
  rm -rf {{library-name}}
