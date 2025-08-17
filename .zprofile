################################################################################
# Runs once at login shells (including when opening a new terminal tab)        #
# Best place for heavy exports (things that need commands to calculate,        #
# or that don’t belong in scripts).                                            #
################################################################################

# Guard to avoid repeated work across new login shells
if [[ -z ${_LOGIN_ENV_DONE-} ]]; then
  export _LOGIN_ENV_DONE=1

  if [[ -d /usr/local/opt/python@3.13/libexec/bin ]]; then
    export PATH="/usr/local/opt/python@3.13/libexec/bin:$PATH"
  else
    # Fallback only if needed (one external call at login)
    echo "Falling back to brew python version. Please update zprofile"
    export PATH="$(brew --prefix python)/libexec/bin:$PATH"
  fi

  # Toolchains (avoid xcrun on every shell)
  : "${CC:=/usr/bin/clang}"
  : "${CXX:=/usr/bin/clang++}"
  export CC CXX

  # Java (set only if you actually need Java 8 globally)
  # This external call happens once per login
  if [[ -z ${JAVA_HOME-} ]]; then
    JAVA_HOME="$(
      /usr/libexec/java_home -v 1.8.0 2>/dev/null || true
    )"
    [[ -n $JAVA_HOME ]] && export JAVA_HOME
  fi

  export HOMEBREW_NO_AUTO_UPDATE=1
fi

