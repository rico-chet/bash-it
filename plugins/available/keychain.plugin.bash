# start a daemon keeping keys unlocked

cite about-plugin
about-plugin 'start a daemon keeping keys unlocked'

{ command -v keychain &>/dev/null \
  && command -v killall &>/dev/null \
  && command -v ssh-add &>/dev/null ;} \
  || return

killall --quiet gnome-keyring-daemon

declare KEY_AGENTS
command -v ssh &>/dev/null && export KEY_AGENTS="${KEY_AGENTS:+${KEY_AGENTS},}ssh"
command -v gpg &>/dev/null && export KEY_AGENTS="${KEY_AGENTS:+${KEY_AGENTS},}gpg"

declare -a KEY_FILES
for key_type in dsa ed25519 rsa
do
  [ -r "${HOME}/.ssh/id_${key_type}" ] && KEY_FILES=${KEY_FILES[*]} id_${key_type}
done

# Word splitting in `eval` clause is intentional, mute shellcheck.
# shellcheck disable=SC2046
eval $(keychain --agents "${KEY_AGENTS}" --eval "${KEY_FILES[@]}")
ssh-add -L 1>/dev/null || ssh-add

unset KEY_AGENTS KEY_FILES
