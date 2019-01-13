# install `~/.tmux.conf`

cite about-dotfile
about-dotfile 'install `~/.tmux.conf`'

# check precondition
command -v tmux 1>/dev/null || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${PWD}/dotfiles/available/tmux.conf" "${HOME}/.tmux.conf"

# check postcondition
command -v diff 1>/dev/null && diff --brief \
  "${PWD}/dotfiles/available/tmux.conf" "${HOME}/.tmux.conf" >/dev/null
