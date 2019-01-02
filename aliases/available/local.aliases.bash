cite 'about-alias'
about-alias 'machine-specific aliases'

# Check
[ -r "${HOME}/.bash_aliases.local" ] || return

# Pull in
source "${HOME}/.bash_aliases.local"
