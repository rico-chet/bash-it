# add a convenience function enabling calling a single command with proxies
# enabled

cite about-plugin
about-plugin 'add `proxy` function'

# Check
[ -r "${HOME}/proxies.sh" ] || return "${SKIPPED}"

proxy() {
    (
        source "${HOME}/proxies.sh"
        "${@}"
    )
}
