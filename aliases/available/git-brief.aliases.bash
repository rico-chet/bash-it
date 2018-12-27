cite 'about-alias'
about-alias 'brief git abbreviations'

# Check
command -v git &>/dev/null || return "${SKIPPED}"

# Subdirectories as prefixes
declare -A git_prefixes=(
  [m]=main
  [k]=kissy_build
)

# Common operations as suffixes
declare -A git_suffixes=(
  [a]="add --interactive"
  [d]=diff
  [dc]="diff --cached"
  [s]=status
)

for git_prefix_key in "${!git_prefixes[@]}" ""
do
  for git_suffix_key in "${!git_suffixes[@]}" ""
  do
    ALIAS="${git_prefix_key}git${git_suffix_key}"
    [ "${ALIAS}" != "git" ] || continue
    DIR_CLAUSE="${git_prefix_key:+-C \"${git_prefixes[${git_prefix_key}]}\"}"
    OP_CLAUSE="${git_suffix_key:+${git_suffixes[${git_suffix_key}]}}"

    # shellcheck disable=SC2139 disable=SC2140
    alias "${ALIAS}"="git ${DIR_CLAUSE} ${OP_CLAUSE}"

    unset ALIAS DIR_CLAUSE OP_CLAUSE
  done
done
