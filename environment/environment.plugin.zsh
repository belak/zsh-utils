#
# Requirements
#

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

#
# Options
#

# General options
setopt COMBINING_CHARS       # Combine zero-len chars (accents) into one character.
setopt MULTIOS               # Allow multi-redirections via implicit tee/cat.

# Directory options
setopt AUTO_PUSHD            # cd automatically uses the dirstack.
setopt PUSHD_IGNORE_DUPS     # No duplicates in the dirstack.
setopt PUSHD_MINUS           # Swap meanings of +/- to be more natural.
setopt PUSHD_SILENT          # Do not print the dirstack after pushd/popd.
setopt PUSHD_TO_HOME         # pushd with no args goes to home.

# I/O options
setopt INTERACTIVE_COMMENTS  # Enable comments in interactive shell.
setopt RC_QUOTES             # Allow '' to escape quotes in singly quoted string.

# Job options
setopt AUTO_RESUME           # Try to resume existing job before creating new.
setopt LONG_LIST_JOBS        # List jobs in long format.
setopt NOTIFY                # Report status of background jobs immediately.

#
# Aliases
#

# Show dirstack history.
alias dirh='dirs -v'
