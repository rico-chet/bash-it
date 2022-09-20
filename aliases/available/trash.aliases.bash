cite 'about-alias'
# shellcheck disable=SC2016
about-alias 'replace `rm` with a faster and safer `t`'

# Check
for i in gio gvfs-trash trash
do
  if _command_exists "${i}" /dev/null
  then
    _trash="${i}"
    if [ "${i}" = "gio" ]
    then
      _trash+=" trash"
    fi
    break
  fi
done

[ -n "${_trash}" ] || return "${SKIPPED}"

# Replace `rm`
rmrm() {
  /bin/rm "${@}"
}

rm_disabled() {
  # shellcheck disable=SC2016
  echo '`rm` is disabled by `bash-it`, use `t` or `rmrm` instead' > /dev/stderr
  return 1
}

alias rm=rm_disabled

# shellcheck disable=SC2139
alias t="${_trash}"
unset _trash
