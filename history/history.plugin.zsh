#
# Options
#

setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.

#
# Variables
#

# Set the path to the history file.
if zstyle -t ':zsh-utils:plugins:history' use-xdg-basedirs; then
  HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/${ZHISTFILE:-history}"
  [[ -d "${HISTFILE:h}" ]] || mkdir -p "${HISTFILE:h}"
else
  HISTFILE="${ZDOTDIR:-$HOME}/${ZHISTFILE:-.zsh_history}"
fi
HISTSIZE=10000  # The maximum number of events to save in the internal history.
SAVEHIST=10000  # The maximum number of events to save in the history file.

#
# Aliases
#

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
