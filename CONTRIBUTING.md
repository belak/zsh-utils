# Contributing

If you have ideas on how to improve maintenance or improve its performance, do
not hesitate to fork and send pull requests.

## Issue Reporting

- Check that the issue has not already been reported.
- Check that the issue has not already been fixed in the latest code.
- Open an issue with a clear title and description.

## Pull Requests

- Use a topic branch to easily amend a pull request later, if necessary.
- Write [good commit messages][good-commit-messages].
- Use the same coding style and spacing.
- Keep pull requests to one feature and include a clear title and description.

## Code Style

This project follows the [Google Shell Style Guide][google-shell-style] when
possible. However, there are a number of additional things to keep in mind.

- Local variables should be used whenever possible.
- Prefer (( ... )) over [[ ... ]] for arithmetic expression.
- Use the function keyword to define functions.
- The 80 character hard limit can be waived for readability.

## Plugins

- Large functions must be placed in a *functions* directory
- All plugins and features must be documented in PLUGINS.md (this means they
  need to be simple enough to explain in a sentence or two)
- Plugins must be in the oh-my-zsh format
  (`{plugin-name}/{plugin-name}.plugin.zsh`) for compatibility reasons

### Sections

Each plugin can have multiple sections and must be in the proper order.

- Requirements - checks for any environment requirements
- Options - any options which need to be configured using setopt
- Styles - any options which need to be configured using zstyle
- Variables - any options which need to be configured using envars
- Init - any code that needs to be run for the module to work
- Aliases - any shell aliases
- Cleanup - unset/remove any temporary variables, functions, files, etc

[good-commit-messages]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[google-shell-style]: https://google.github.io/styleguide/shell.xml
