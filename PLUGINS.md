# Plugin Details

## completion

Load and initialize the built-in zsh completion system. Note that this does not
include any additional completions. If you're looking for improved completion
support, the excellent
[zsh-completions](https://github.com/zsh-users/zsh-completions) repo is strongly
recommended. If used, any zsh-completions should be loaded *before* the completion module.

### Tweaks

- Enable completion caching and make it re-generate every 20 hours
- Allow completion to happen from anywhere in a word
- Improve the general feel of the tab-completion menu
- Allow for extended glob operators so caching works

## editor

Override and fill in the gaps of the default keybinds. Note that this resets
to the default keymap. To switch to emacs or vi-mode, call `bindkey -e` or
`bindkey -v` after loading.

The aim of this module is to smooth away some of the rough edges of the
default key-binds, not to emulate Emacs or Vi perfectly.

### All Modes

- Home, End, and Delete are properly bound.
- Control Left/Right and Alt Left/Right move back and forward by words

### Emacs Mode

Currently the only additions to Emacs mode are copied from Vi Insert mode (see
below). Note that this means that Control-W doesn't act how it would in Emacs,
but this is much more convenient and lets us line up with insert mode.

### Vi Command Mode

- Delete acts closer to its Vi counterpart

### Vi Insert Mode

- Backspace and Control-W both act closer to their Vi counterparts

## history

Load and initilize the built-in zsh history system.

### Tweaks

A number of history related settings are tweaked to make the out-of-the-box
experience better.

- History file is set to ~/.zhistory
- Size is set to 10000
- Write in expanded format
- Make dupe handling more straightforward (only keep the latest event, don't
  record consecutive dupes)
- Don't add events which start with a space to history

## prompt

Load and initialize the build-in zsh prompt system. This also provides a
number of additional prompts. Note that in order to actually set your prompt,
you must call `prompt <prompt name>`.

### Included Prompts

Note that each maintainer is allowed to have one prompt theme, matching their
github username. This is to improve maintainability by avoiding including any
themes which don't have someone willing to maintain them.

- `belak` - simple prompt originally based on the gentoo prompt with some
  additional information

### Tweaks

`promptinit` is run. This is simply a convenience so loading this module will
add prompts to the fpath and make them available to the prompt function.

## utility

Common shell utilities, aimed at making cross platform work less painful.

### Aliases

These aliases aim to provide a way of doing simple tasks in a cross platform
way so you don't need to remember a bunch of different commands.

- `o` - open the given argument with the default application
- `pbcopy`/`pbc` - named after the MacOS utility which stores stdin in the clipboard
- `pbpaste`/`pbp` - named after the MacOS utility which dumps the clipboard to stdout

### Tweaks

Utils which have support color available have aliases added to automatically
use colors when available. Additionally, directories are grouped first in `ls`
output.
