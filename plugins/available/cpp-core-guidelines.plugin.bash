cite about-plugin
about-plugin 'C++ Core Guidelines helper functions'

function cppcgl-find-rule() {
  about 'Find a rule by a string'
  param '1: needle'
  group 'cppcgl'

  local -r needle="${1}"
  local -r tmpfile="${TMPDIR:-/tmp}/CppCoreGuidelines-master.md"

  if [ ! -r "${tmpfile}" ]
  then
    curl \
      --location \
      --silent \
      http://github.com/isocpp/CppCoreGuidelines/raw/master/CppCoreGuidelines.md \
      > "${tmpfile}"
  fi

  find_rule_line() {
    grep \
      --extended-regexp \
      --ignore-case \
      "^### .*[A-Z]+\\.[0-9]+: .*${needle}" \
      "${tmpfile}"
  }

  extract_rule_name() {
    grep \
      --extended-regexp \
      --only-matching \
      '[A-Z]+\.[0-9]+: .*$'
  }

  colorize_needle() {
    grep \
      --extended-regexp \
      --color=always \
      "${needle}"
  }

  find_rule_line \
  | extract_rule_name \
  | colorize_needle
}
