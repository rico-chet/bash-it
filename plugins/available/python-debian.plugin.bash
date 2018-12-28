cite about-plugin
about-plugin 'add python site-packages for separate storage of user-built modules'

# For now, python 2.7 only

# Check
command -v python2 || return "${SKIPPED}"
{ python2 --version | grep --quiet '^Python 2\.7' ;} || return "${SKIPPED}"
[ -r /etc/os-release ] \
	&& grep --quiet debian /etc/os-release \
	&& [ -d "/usr/local/lib/python2.7/site-packages" ] \
	|| return "${SKIPPED}"

# https://wiki.debian.org/Python#Deviations_from_upstream
export PYTHONPATH="/usr/local/lib/python2.7/site-packages${PYTHONPATH:+:$PYTHONPATH}"
