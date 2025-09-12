# use our `vimrc` for initialization

cite about-dotfile
about-dotfile 'use our `vimrc` for initialization'

# check precondition
_command_exists vim || return "${SKIPPED}"

# activate
export VIMINIT="source ${BASH_IT}/dotfiles/available/vimrc"
