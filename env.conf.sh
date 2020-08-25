#!/usr/bin/env bash
# Copyright (c) 2020 Wenhao Ji <predator.ray@gmail.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -euf -o pipefail

function print_add_env() {
    local env_name="$1"
    echo "    \"${env_name}\" => env.${env_name}"
}

cat << EOF
server.modules += ( "mod_setenv" )
setenv.add-environment = (
EOF

if [[ -n "${GITHUB_USER:-}" ]]; then
    print_add_env 'GITHUB_USER'
fi

if [[ -n "${GITHUB_ACCESS_TOKEN:-}" ]]; then
    print_add_env 'GITHUB_ACCESS_TOKEN'
fi

if [[ -n "${GITHUB_REPO:-}" ]]; then
    print_add_env 'GITHUB_REPO'
fi

if [[ -n "${GITHUB_API_SERVER:-}" ]]; then
    print_add_env 'GITHUB_API_SERVER'
fi

cat << EOF
)
EOF
