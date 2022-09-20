# start a daemon keeping PGP keys unlocked

cite about-plugin
about-plugin 'start a daemon keeping PGP keys unlocked'

{ _command_exists gpg \
  && _command_exists keychain \
  && _command_exists killall \
  && _command_exists readlink \
  && _command_exists pinentry-curses ;} \
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
