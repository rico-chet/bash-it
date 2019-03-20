# start a daemon keeping SSH keys unlocked

cite about-plugin
about-plugin 'start a daemon keeping SSH keys unlocked'

{ command -v keychain &>/dev/null \
  && command -v killall &>/dev/null \
  && command -v ssh &>/dev/null \
  && command -v ssh-add &>/dev/null ;} \
  || return "${SKIPPED}"

killall --quiet gnome-keyring-daemon

declare -a KEY_FILES
for key_type in dsa ed25519 rsa
do
  [ -r "${HOME}/.ssh/id_${key_type}" ] && KEY_FILES+=("id_${key_type}")
done

# Word splitting in `eval` clause is intentional, mute shellcheck.
# shellcheck disable=SC2046
eval $(keychain --agents ssh --eval "${KEY_FILES[@]}")
ssh-add -L 1>/dev/null || ssh-add

unset KEY_FILES
