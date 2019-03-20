# start a daemon keeping PGP keys unlocked

cite about-plugin
about-plugin 'start a daemon keeping PGP keys unlocked'

{ command -v gpg &>/dev/null \
  && command -v keychain &>/dev/null \
  && command -v killall &>/dev/null \
  && command -v readlink &>/dev/null \
  && command -v pinentry-curses &>/dev/null ;} \
  || return "${SKIPPED}"

killall --quiet gnome-keyring-daemon

FINGERPRINT=$(set -o pipefail; \
	gpg --list-secret-keys --with-colons \
	| sed --silent '/^sec:/,/^fpr/ { /^fpr:/p }' \
	| cut --delimiter=: --fields=10) \
    || return "${SKIPPED}"

PINENTRY_CURRENT=$(readlink --canonicalize-existing "$(command -v pinentry)")
PINENTRY_TTY=$(readlink --canonicalize-existing "$(command -v pinentry-curses)")
[ "${PINENTRY_CURRENT}" = "${PINENTRY_TTY}" ] || return "${SKIPPED}"

# Word splitting in `eval` clause is intentional, mute shellcheck.
# shellcheck disable=SC2046
eval $(keychain --agents gpg --eval "${FINGERPRINT}")

unset FINGERPRINT PINENTRY_CURRENT PINENTRY_TTY
