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
  # Homebrew
  if [ "$(uname -m)" = "arm64" ]; then
    # Use arm64 brew, with fallback to x86 brew
    if [ -f /opt/homebrew/bin/brew ]; then
      export PATH="/usr/local/bin${PATH+:$PATH}";
      eval $(/opt/homebrew/bin/brew shellenv)
    fi
  else
    # Use x86 brew, with fallback to arm64 brew
    if [ -f /usr/local/bin/brew ]; then
      export PATH="/opt/homebrew/bin${PATH+:$PATH}";
      eval $(/usr/local/bin/brew shellenv)
    fi
  fi

  # NPM
  # export PATH="$PATH:`npm bin -g`"

  # Golang
  # export PATH="$PATH:$HOME/go/bin"

  # Python
  # if [ -d "$HOME/Library/Python/3.7/bin" ]; then
  #   export PATH="$PATH:$HOME/Library/Python/3.7/bin"
  # fi

  # indy-sdk libindy
  # export DYLD_LIBRARY_PATH=/Users/andreasspannagel/perfectid/ssi/indy-sdk/libindy/target/debug
  # export LD_LIBRARY_PATH=/Users/andreasspannagel/perfectid/ssi/indy-sdk/libindy/target/debug

  export LC_ALL=en_US.UTF-8
  # export LANG=en_US.UTF-8
fi