#
# Requirements
#

if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

# Check whether to use XDG basedir locations or $ZDOTDIR.
if zstyle -t ':zsh-utils:plugins:completion' use-xdg-basedirs; then
  [[ -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh ]] || mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}/zsh
  _zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  _zcompcache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
else
  _zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  _zcompcache="${ZDOTDIR:-$HOME}/.zcompcache"
fi

#
# Options
#

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

#
# Styles
#

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$_zcompcache"

#
# Init
#

# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
autoload -Uz compinit
_comp_files=($_zcompdump(Nmh-20))
if (( $#_comp_files )); then
  compinit -i -C -d "$_zcompdump"
else
  compinit -i -d "$_zcompdump"
fi
unset _comp_files _zcompdump _zcompcache
