# zsh-utils

A minimal, opinionated set of ZSH plugins designed to be small, simple, and
focused.

This includes a number of simple plugins designed to smooth away some of the
rough edges of zsh without getting in your way. The idea is that you should be
able to say "I'd like to enable the history features of ZSH" (or other similar
features) without needing to know the gritty details and without worrying that
a bunch of unrelated settings will be enabled.

All the plugins are designed to work with no configuration and no additional
dependencies, but shouldn't conflict with additional configuration you want to
do.

## Driving Principles

Many other zsh config frameworks and modules do too much, are overly complex,
don't work well out of the box, and have many unmaintained modules. zsh-utils
aims to be small, simple, and focused.

- Don't reinvent the wheel. If there's an existing plugin elsewhere which works
  well it should be preferred (such as [zsh-completions](https://github.com/zsh-users/zsh-completions)
  and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).
- Clear is better than clever. The code should be easy to maintain for anyone
  with a decent knowledge of zsh. Comments should be included when anything needs
  explanation.
- Avoid configuration when possible. Most modules should be self-contained and
  work out of the box without any necessary configuration. These plugins make a
  number of opinionated decisions, so some settings may be provided to disable those.

## Recommended Installation

Officially [antigen][antigen] is recommended, but it should be possible to load
with other plugin managers like [zgen][zgen] or [zplug][zplug] as well.

The following example can be placed in your `.zshrc`. It will install antigen
if it's missing, load antigen, install the zsh-utils repo, and load any
specified plugins.

```sh
[[ ! -d "$HOME/.antigen" ]] && git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
source "$HOME/.antigen/antigen.zsh"

# Set the default plugin repo to be zsh-utils
antigen use belak/zsh-utils --branch=main

# Specify completions we want before the completion module
antigen bundle zsh-users/zsh-completions

# Specify plugins we want
antigen bundle editor@main
antigen bundle history@main
antigen bundle prompt@main
antigen bundle utility@main
antigen bundle completion@main

# Specify additional external plugins we want
antigen bundle zsh-users/zsh-syntax-highlighting

# Load everything
antigen apply

# Set any settings or overrides here
prompt belak
bindkey -e
```

## Provided Plugins

- `completion` - Load and initialize the built-in zsh completion system
- `editor` - Override and fill in the gaps of the default keybinds
- `history` - Load and initilize the built-in zsh history system
- `prompt` - Load and initialize the build-in zsh prompt system
- `utility` - Common shell utilities, aimed at making cross platform work less painful

## Plugin Details

For more specific information about the plugins, check out [PLUGINS.md](./PLUGINS.md).

[antigen]: https://github.com/zsh-users/antigen.git
[xdg-basedirs]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
[zgen]: https://github.com/tarjoilija/zgen
[zplug]: https://github.com/zplug/zplug
