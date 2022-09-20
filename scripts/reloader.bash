# shellcheck shell=bash
#
# The core component loader.

# shellcheck disable=SC2034
BASH_IT_LOG_PREFIX="core: reloader: "
_bash_it_reloader_type=""

if [[ "${1:-}" != "skip" ]] && [[ -d "${BASH_IT?}/enabled" ]]; then
	case $1 in
		alias | dotfile | completion | plugin)
			_bash_it_reloader_type=$1
			_log_debug "Loading enabled $1 components..."
			;;
		'' | *)
			_log_debug "Loading all enabled components..."
			;;
	esac

	for _bash_it_reloader_file in "$BASH_IT/enabled"/*"${_bash_it_reloader_type}.bash"; do
		if [[ -e "${_bash_it_reloader_file}" ]]; then
			_bash-it-log-prefix-by-path "${_bash_it_reloader_file}"

			name_and_topic="$(basename --suffix='.bash' "${_bash_it_reloader_file}" \
			| sed --regexp-extended 's/[[:digit:]]{1,3}-{3}//')"
			name="$(echo "${name_and_topic}" | cut --delimiter=. --fields=1)"
			topic="$(echo "${name_and_topic}" | cut --delimiter=. --fields=2)"
			print_doing "${topic}/${name}"

			_log_debug "Loading component..."
			# shellcheck source=/dev/null
			if source "$_bash_it_reloader_file"
			then
				print_done "${topic}/${name}"
			else
				print_not_done "${topic}/${name}" ${?}
			fi

			unset name name_and_topic topic

			_log_debug "Loaded."
		else
			_log_error "Unable to read ${_bash_it_reloader_file}"
		fi
	done
fi

if [[ -n "${2:-}" ]] && [[ -d "$BASH_IT/${2}/enabled" ]]; then
	case $2 in
		aliases | dotfiles | completion | plugins)
			_log_warning "Using legacy enabling for $2, please update your bash-it version and migrate"
			for _bash_it_reloader_file in "$BASH_IT/${2}/enabled"/*.bash; do
				if [[ -e "$_bash_it_reloader_file" ]]; then
					_bash-it-log-prefix-by-path "${_bash_it_reloader_file}"
					_log_debug "Loading component..."
					# shellcheck source=/dev/null
					source "$_bash_it_reloader_file"
					_log_debug "Loaded."
				else
					_log_error "Unable to locate ${_bash_it_reloader_file}"
				fi
			done
			;;
	esac
fi

unset "${!_bash_it_reloader_@}"
