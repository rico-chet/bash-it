# shellcheck shell=bash
about-alias 'fuck/please to retry last command with sudo'
url "https://github.com/Bash-it/bash-it"

# Check
_command_exists thefuck || return "${SKIPPED}"
thefuck --alias fuck &>/dev/null || return 1

# Play nicely with 'thefuck' plugin
if ! _command_exists fuck ; then
	eval $(thefuck --alias fuck)
fi
alias please=fuck
alias plz=please
alias fucking=sudo
alias f=fuck
