# output stderr in red

cite about-plugin
about-plugin 'output stderr in red'

# load after the `stow` plugin (default priority of 250)
# BASH_IT_LOAD_PRIORITY: 255

# build and install in `GNU stow`:
# git clone https://github.com/sickill/stderred.git
# cd stderred && make build
# cmake -DCMAKE_INSTALL_PREFIX="${STOW_DIR}/stderred" build
# make --jobs install && stow --stow stderred

[ -n "${STOW_TARGET_DIR}" ] \
  && [ -x "${STOW_TARGET_DIR}/lib/libstderred.so" ] \
	&& command -v tput &>/dev/null \
  || return "${SKIPPED}"

bold=$(tput bold || tput md)
red=$(tput setaf 1)
STDERRED_ESC_CODE=$(echo -e "${bold}${red}")
export STDERRED_ESC_CODE
export LD_PRELOAD="${STOW_TARGET_DIR}/lib/libstderred.so${LD_PRELOAD:+:${LD_PRELOAD}}"
unset bold red
