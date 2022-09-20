# install `~/.editorconfig`

cite about-dotfile
about-dotfile 'install `~/.editorconfig`'

# check precondition
_command_exists editorconfig || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${PWD}/dotfiles/available/.editorconfig" "${HOME}/.editorconfig"

# check postcondition
_command_exists diff && diff --brief \
  "${PWD}/dotfiles/available/.editorconfig" "${HOME}/.editorconfig" >/dev/null
