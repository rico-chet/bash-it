# install `~/.tmux.conf`

cite about-dotfile
about-dotfile 'install `~/.emacs.el`'

# check precondition
command -v emacs 1>/dev/null || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${BASH_IT}/dotfiles/available/.emacs.el" "${HOME}/.emacs.el"

# check postcondition
command -v diff 1>/dev/null && diff --brief \
  "${BASH_IT}/dotfiles/available/.emacs.el" "${HOME}/.emacs.el" >/dev/null
