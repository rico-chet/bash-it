cite 'about-alias'
# shellcheck disable=SC2016
about-alias '`tiga` alias'

# Check
_command_exists tig || return "${SKIPPED}"

# Alias
alias tiga='tig --all'
