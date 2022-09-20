#!/bin/bash
BASH_IT_LOG_PREFIX="core: reloader: "

function _set-prefix-based-on-path()
{
  filename=$(_bash-it-get-component-name-from-path "$1")
  extension=$(_bash-it-get-component-type-from-path "$1")
  BASH_IT_LOG_PREFIX="$extension: $filename: "
}

if [[ "$1" != "skip" ]] && [[ -d "$BASH_IT/enabled" ]]; then
  _bash_it_config_type=""

  case $1 in
    alias|completion|dotfile|plugin)
      _bash_it_config_type=$1
      _log_debug "Loading enabled $1 components..." ;;
    *|'')
      _log_debug "Loading all enabled components..." ;;
  esac

  for _bash_it_config_file in $(sort <(compgen -G "$BASH_IT/enabled/*${_bash_it_config_type}.bash")); do
    if [ -e "${_bash_it_config_file}" ]; then
      name_and_topic="$(basename --suffix=.bash "${_bash_it_config_file}" \
        | sed --regexp-extended 's/[[:digit:]]{1,3}-{3}//')"
      name="$(echo "${name_and_topic}" | cut --delimiter=. --fields=1)"
      topic="$(echo "${name_and_topic}" | cut --delimiter=. --fields=2)"
      print_doing "${topic}/${name}"

      _set-prefix-based-on-path "${_bash_it_config_file}"
      _log_debug "Loading component..."
      # shellcheck source=/dev/null
      if source $_bash_it_config_file
      then
        print_done "${topic}/${name}"
      else
        print_not_done "${topic}/${name}" ${?}
      fi

      unset name name_and_topic topic
    else
      echo "Unable to read ${_bash_it_config_file}" > /dev/stderr
    fi
  done
fi

if [[ -n "${2}" ]] && [[ -d "$BASH_IT/${2}/enabled" ]]; then
  case $2 in
    aliases|completion|dotfile|plugins)
      _log_warning "Using legacy enabling for $2, please update your bash-it version and migrate"
      for _bash_it_config_file in $(sort <(compgen -G "$BASH_IT/${2}/enabled/*.bash")); do
        if [[ -e "$_bash_it_config_file" ]]; then
          _set-prefix-based-on-path "${_bash_it_config_file}"
          _log_debug "Loading component..."
          # shellcheck source=/dev/null
          source "$_bash_it_config_file"
        else
          echo "Unable to locate ${_bash_it_config_file}" > /dev/stderr
        fi
      done ;;
  esac
fi

unset _bash_it_config_file
unset _bash_it_config_type
