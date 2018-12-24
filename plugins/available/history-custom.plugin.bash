cite about-plugin
about-plugin 'history customizations'

# ignore certain common commands that are rarely of interest
export HISTIGNORE="pwd:df:du"

# don't store duplicates
export HISTCONTROL="erasedups:ignoredups"

# bump up history length
export HISTSIZE=$((1024 * 32))
export HISTFILESIZE=-1

# enable Ctrl+S as pendant to Ctrl+R
stty stop ^X
