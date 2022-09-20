# install `~/.tmux.conf`

cite about-dotfile
about-dotfile 'install `~/.emacs.el`'

# check precondition
_command_exists emacs || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${PWD}/dotfiles/available/.emacs.el" "${HOME}/.emacs.el"

# check postcondition
_command_exists diff && diff --brief \
  "${PWD}/dotfiles/available/.emacs.el" "${HOME}/.emacs.el" >/dev/null
