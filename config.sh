# This file contains defaults. Put local configuration into the file
# config_local.sh.

_thisdir="$(dirname "$BASH_SOURCE")"
_topdir_override="${topdir:-}"

if [ -e "$_thisdir/config_local.sh" ]; then
    source "$_thisdir/config_local.sh"
fi

topdir="${_topdir_override:-${topdir:-$_thisdir/output}}"
