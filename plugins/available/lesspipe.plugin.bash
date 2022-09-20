cite about-plugin
# shellcheck disable=SC2016
about-plugin 'make `less` more friendly for non-text input files, see lesspipe(1)'

# Check
_command_exists lesspipe || return "${SKIPPED}"

# As per lesspipe(1) manpage
eval "$(SHELL=/bin/sh lesspipe)"
