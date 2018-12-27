# make `less` interpret color escape sequences

cite about-plugin
# shellcheck disable=2016
about-plugin 'make `less` interpret color escape sequences'

# Check
command -v less &>/dev/null || return "${SKIPPED}"

export LESS="${LESS:+${LESS} }--RAW-CONTROL-CHARS"
