# This file contains defaults. Put local configuration into the file
# config_local.sh.

# Defaults go here. These will be eval'ed, therefore use single quotes.

CONFIG_DEFAULTS='
topdir=${here}/output
'

# No user-serviceable parts below.

# Needs to be a function for 'local' to work.
_configure_the_things() {
    local here="$(dirname "$BASH_SOURCE")"

    local topdir_override="${topdir:-}"

    if [ -e "$here/config_local.sh" ]; then
        source "$here/config_local.sh"
    fi

    eval "$(echo "$CONFIG_DEFAULTS" | sed -e 's/^\([^=]\+\)=\(.*\)/local \1_default=\2/g')"

    topdir="${topdir_override:-${topdir:-$topdir_default}}"
}

_configure_the_things
