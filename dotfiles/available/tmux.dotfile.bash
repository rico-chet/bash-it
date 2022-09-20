# install `~/.tmux.conf`

cite about-dotfile
about-dotfile 'install `~/.tmux.conf`'

# check precondition
_command_exists tmux || return "${SKIPPED}"

# install
cp --no-clobber --symbolic-link \
  "${PWD}/dotfiles/available/tmux.conf" "${HOME}/.tmux.conf"

# check postcondition
_command_exists diff && diff --brief \
  "${PWD}/dotfiles/available/tmux.conf" "${HOME}/.tmux.conf" >/dev/null

# install for byobu when present
if _command_exists byobu
then
  if [ -d "${XDG_CONFIG_HOME:-/dev/null}/byobu" ]
  then
    byobu_conf_dir="${XDG_CONFIG_HOME}/byobu"
  elif [ -d "${HOME}/.byobu" ]
  then
    byobu_conf_dir="${HOME}/.byobu"
  fi

  if [ -n "${byobu_conf_dir}" ]
  then
    # install
    cp --remove-destination --symbolic-link \
      "${PWD}/dotfiles/available/tmux.conf" "${byobu_conf_dir}/.tmux.conf"

  # check postcondition
  _command_exists diff \
  && diff --brief \
    "${PWD}/dotfiles/available/tmux.conf" "${byobu_conf_dir}/.tmux.conf" \
    >/dev/null
  fi
fi
