cite about-plugin
# shellcheck disable=2016
about-plugin 'Set up `GNU stow` directories'

# Check
command -v stow &>/dev/null || return "${SKIPPED}"

# Use with e.g. CMake:
#   cmake libfoo-src -DCMAKE_INSTALL_PREFIX="${STOW_DIR}/libfoo"
#   or
#   configure --prefix="${STOW_DIR}/libfoo"
#   make && make install && stow --stow libfoo
#   stow --delete libfoo
export STOW_TARGET_DIR="${HOME}/.local"
export STOW_DIR="${STOW_TARGET_DIR}/stow"
# inform chkstow that it's not to check this dir
[ -r "${STOW_DIR}/.stow" ] \
  || { mkdir --parents "${STOW_DIR}" && touch "${STOW_DIR}/.stow"; }
# binaries
export PATH="${STOW_TARGET_DIR}/bin"${PATH:+:${PATH}}
# compiler
export CPATH=${CPATH:+${CPATH}:}"${STOW_TARGET_DIR}/include"
export LIBRARY_PATH=${LIBRARY_PATH:+${LIBRARY_PATH}:}"${STOW_TARGET_DIR}/lib"
# ld
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}"${STOW_TARGET_DIR}/lib"
