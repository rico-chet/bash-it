# https://github.com/nvbn/thefuck

# Check
command -v thefuck 1>/dev/null || return "${SKIPPED}"
fc -ln -1 &>/dev/null || return 1
thefuck $(fc -ln -1) &>/dev/null || return 2

alias fuck='eval $(thefuck $(fc -ln -1))'
alias f='fuck'
alias please='fuck'
