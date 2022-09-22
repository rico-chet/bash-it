# install `~/.editorconfig`

cite about-dotfile
about-dotfile 'install `~/.editorconfig`'

# check precondition
command -v editorconfig 1>/dev/null || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${BASH_IT}/dotfiles/available/.editorconfig" "${HOME}/.editorconfig"

# check postcondition
command -v diff 1>/dev/null \
&& diff --brief \
  "${BASH_IT}/dotfiles/available/.editorconfig" \
  "${HOME}/.editorconfig" >/dev/null
