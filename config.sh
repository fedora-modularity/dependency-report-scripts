# This file contains defaults. Put local configuration into the file
# config_local.sh.

# Defaults go here. These will be eval'ed, therefore use single quotes.

CONFIG_DEFAULTS='
topdir=${here}/output
buildrequires_ref=master
requires_ref=master
components_ref=f27
'

# No user-serviceable parts below.

# Needs to be a function for 'local' to work.
_configure_the_things() {
    local here="$(dirname "$BASH_SOURCE")"

    local topdir_override="${topdir:-}"
    local buildrequires_ref_override="${buildrequires_ref:-}"
    local requires_ref_override="${requires_ref:-}"
    local components_ref_override="${components_ref:-}"

    if [ -e "$here/config_local.sh" ]; then
        source "$here/config_local.sh"
    fi

    eval "$(echo "$CONFIG_DEFAULTS" | sed -e 's/^\([^=]\+\)=\(.*\)/local \1_default=\2/g')"

    topdir="${topdir_override:-${topdir:-$topdir_default}}"
    buildrequires_ref="${buildrequires_ref_override:-${buildrequires_ref:-$buildrequires_ref_default}}"
    requires_ref="${requires_ref_override:-${requires_ref:-$requires_ref_default}}"
    components_ref="${components_ref_override:-${components_ref:-$components_ref_default}}"
}

_configure_the_things
