# install `~/.tmux.conf`

cite about-dotfile
about-dotfile 'install `~/.emacs.el`'

# check precondition
command -v emacs 1>/dev/null || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${PWD}/dotfiles/available/.emacs.el" "${HOME}/.emacs.el"

# check postcondition
command -v diff 1>/dev/null && diff --brief \
  "${PWD}/dotfiles/available/.emacs.el" "${HOME}/.emacs.el" >/dev/null
