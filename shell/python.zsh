# Copyright (c) 2018 Andreas Spannagel <spannagel.andreas@gmail.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

if [[ -o login ]]; then
  # Initialize pyenv
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi

  # Initialize poetry
  export PATH="$HOME/.poetry/bin:$PATH"

  # pip should only run if there is a virtualenv currently activated
  export PIP_REQUIRE_VIRTUALENV=true

  # Commands to override pip restriction above.
  # Use `gpip` or `gpip3` to force installation of a package in the global
  # python environment.
  gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
  }
  gpip3(){
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
  }
fi