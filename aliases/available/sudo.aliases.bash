cite 'about-alias'
about-alias 'sudo --askpass alias'

# Check
{ command -v sudo  &>/dev/null && [ -r ~/.askpass.sh ] ;} || return

export SUDO_ASKPASS=~/.askpass.sh
alias sudoa='sudo --askpass'
