# install `~/.editorconfig`

cite about-dotfile
about-dotfile 'install `~/.editorconfig`'

# check precondition
command -v editorconfig 1>/dev/null || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${PWD}/dotfiles/available/.editorconfig" "${HOME}/.editorconfig"

# check postcondition
command -v diff 1>/dev/null && diff --brief \
  "${PWD}/dotfiles/available/.editorconfig" "${HOME}/.editorconfig" >/dev/null
