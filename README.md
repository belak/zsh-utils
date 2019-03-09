# zsh-utils

A minimal set of ZSH plugins designed to be low-friction and low-complexity.

This includes a number of simple plugins designed to smooth away some of the
rough edges of zsh without getting in your way. The idea is that you should be
able to say "I'd like to enable the history features of ZSH" (or other similar
features) without needing to know the gritty details.

All the plugins are designed to work with no configuration and no additional
dependencies, but shouldn't conflict with additional configuration you want to
do.

## Recommended Installation

Officially [antigen](https://github.com/zsh-users/antigen.git) is
recommended, but it should be possible to load with other plugin managers like
[zgen](https://github.com/tarjoilija/zgen) or
[zplug](https://github.com/zplug/zplug) as well.

The following example can be placed in your `.zshrc`. It will install antigen
if it's missing, load antigen, install the zsh-utils repo, and load any
specified plugins.

```sh
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

# Specify additional external plugins we want
antigen bundle zsh-users/zsh-syntax-highlighting

# Load everything
antigen apply

# Set any settings or overrides here
prompt belak
bindkey -e
```

## Provided Plugins

- completion - Load and initialize the built-in zsh completion system
- editor - Override and fill in the gaps of the default keybinds
- history - Load and initilize the built-in zsh history system
- prompt - Load and initialize the build-in zsh prompt system
- utility - Common shell utilities, aimed at making cross platform work less painful

## Plugin Details

For more specific information about the plugins, check out [PLUGINS.md](./PLUGINS.md).
