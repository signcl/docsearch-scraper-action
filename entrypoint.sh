#!/bin/sh
# https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions

# `$*` expands the `args` supplied in an `array` individually
# or splits `args` in a string separated by whitespace.
sh -c "ls -lah"
sh -c "ls -lah src"
sh -c "pipenv run python -m src.index $*"
