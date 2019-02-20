# https://github.com/nvbn/thefuck

# Check
command -v thefuck 1>/dev/null || return "${SKIPPED}"
thefuck --alias fuck &>/dev/null || return 1

eval $(thefuck --alias f)
eval $(thefuck --alias fuck)
eval $(thefuck --alias please)
