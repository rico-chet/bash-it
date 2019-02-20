cite 'about-alias'
about-alias 'replace `rm` with a faster and safer `t`'

# Check
for i in gvfs-trash trash
do
  if command -v "${i}" &> /dev/null
  then
    _trash="${i}"
    break
  fi
done

[ -n "${_trash}" ] || return "${SKIPPED}"

# Replace `rm`
rm() {
  echo '`rm` is disabled by `bash-it`, use `t` instead' > /dev/stderr
  return 1
}

alias t="${_trash}"
