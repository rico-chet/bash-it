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

# enable history search with current input
# https://superuser.com/a/1271740
# This will map ALT-R to CTR-A CTR-R CTR-Y CTR-R
# Description:
#     Alt-R: the binding key
#     Ctrl-A: Go to the beginning of the line (memorizing what is written)
#     Ctrl-R: Start the reverse search
#     Ctrl-Y: Paste what Ctrl-A memorized as part of the search
#     Ctrl-R: Trigger the reverse search with the characters so far
bind '"\er":"\C-a\C-r\C-y\C-r"'
