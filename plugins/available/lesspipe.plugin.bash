cite about-plugin
# shellcheck disable=SC2016
about-plugin 'make `less` more friendly for non-text input files, see lesspipe(1)'

# Check
command -v lesspipe &>/dev/null || return

# As per lesspipe(1) manpage
eval "$(SHELL=/bin/sh lesspipe)"
