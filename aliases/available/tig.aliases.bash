cite 'about-alias'
# shellcheck disable=SC2016
about-alias '`tiga` alias'

# Check
command -v tig &>/dev/null || return

# Alias
alias tiga='tig --all'
