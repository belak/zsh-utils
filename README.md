# zsh-utils

A set of modules designed to be easy to use with plugin managers

## Why Another Framework?

After spending quite a bit of my time maintaining prezto, there were a number
of main problems I noticed:

* Most zsh config frameworks contain a collection of modules along with a
  plugin manager. Most bundled plugin managers are fairly minimal. Existing
  plugin managers could be used because the plugins themselves contain the bulk
  of framework code.
* It takes a ton of work to get a module ready for prezto, even small modules.
* Too many options.
* A number of the behaviors in prezto do strange things and set up rather odd
  defaults.
* Many plugins end up being a small wrapper around an external repo

That being said, there are a number of strengths to configuration frameworks as
well.

* Plugins work well together. As an example, prezto's git plugin provides a
  git-info command which can be used by prompts.
* Having a number of plugins bundled together in one place makes it simple to
  enable the ones you want without having to do too much additional work.

This project aims to solve some of the problems faces by larger frameworks by
focusing on the following goals:

* Loadable by any compatible plugin manager
* Plugins will be kept small, relatively inflexible, and well organized
* No external dependencies without very good reason
* Focus on improving the existing experience rather than expanding it

## Recommended Installation

Personally, I recommend [antigen](https://github.com/zsh-users/antigen.git), but
it should be possible to load with other plugin managers like
[zgen](https://github.com/tarjoilija/zgen) or
[zplug](https://github.com/zplug/zplug) as well.

The following example can be placed in your `.zshrc` and will install antigen
if it's missing, load antigen, install the zsh-utils repo, and load any
specified plugins.

```
[[ ! -d "$HOME/.antigen" ]] && git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
source "$HOME/.antigen/antigen.zsh"

# Set the default plugin repo to be zsh-utils
antigen use belak/zsh-utils

# Specify completions we want before the completion module
antigen bundle zsh-users/zsh-completions

# Specify plugins we want
antigen bundle editor
antigen bundle history
antigen bundle prompt
antigen bundle utility
antigen bundle completion

# Specify external plugins we want
antigen bundle zsh-users/zsh-syntax-highlighting

# Load everything
antigen apply

# Set any settings or overrides here
prompt belak
bindkey -e
```

## Provided Plugins

### completion

Load and initialize the built-in zsh completion system. Note that this does not
include any additional completions. If you're looking for improved completion
support, the excellent
[zsh-completions](https://github.com/zsh-users/zsh-completions) repo is strongly
recommended. Note that it should be loaded *before* the completion module.

### editor

Override and fill in the gaps of the default emacs and vi-mode keybinds. Note
that this resets to the default keymap. To switch to emacs or vi-mode, call
`bindkey -e` or `bindkey -v` after loading.

### history

Load and initilize the built-in zsh history system.

### prompt

Load and initialize the build-in zsh prompt system. This also provides a number
of additional prompts. Note that in order to actually set your prompt, you must call
`prompt <prompt name>`

### utility

Common shell utilities, aimed at making cross platform work less painful.
