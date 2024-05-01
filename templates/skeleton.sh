#!/usr/bin/env bash
set -o errexit -o errtrace -o noclobber -o nounset -o pipefail
IFS=$'\n\t'

trap '>&2 echo "Error occurred!"' ERR
