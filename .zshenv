################################################################################
# Runs for every zsh, even non-interactive scripts.                            #
# Keep this file as tiny as possible: only exports that must exist             #
# in all contexts (scripts, cronjobs, interactive shells).                     #
################################################################################

export PATH="/opt/homebrew/bin:$PATH"

export PATH="/usr/local/Cellar/openvpn/3.5.7/sbin:$PATH"
export PATH="/usr/local/share/john:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/Users/cgrace/dev/tools/aseprite/build/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin/clang-format:$PATH"
#export PATH="/Users/cgrace/dev/tools/zig-macos-x86_64-0.14.0-dev:$PATH"

