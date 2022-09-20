cite 'about-alias'
about-alias 'sudo --askpass alias'

# Check
{ _command_exists sudo  && [ -r ~/.askpass.sh ] ;} || return "${SKIPPED}"

export SUDO_ASKPASS=~/.askpass.sh
alias sudoa='sudo --askpass'
