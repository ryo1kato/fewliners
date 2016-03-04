#!/bin/bash
#
# My template shell script command
#
set -ue
print_help () {
cat <<EOF
Usage: ${0##*/} [$(u OPTIONS)...] [$(u ARGS)]
  Shell script template.
$(b OPTIONS)
  -v,--verbose  Verbose output.
  -h,--help     Print this help.
EOF
}

b () { tput bold; echo -n "$*"; tput sgr0; } # bold
u () { tput smul; echo -n "$*"; tput rmul; } # underline

#shopt -s extglob

###############################################################################
trap 'echo "$0: Unexpected error at line $LINENO ($BASH_COMMAND, ret=$?)" >&2; exit 1;' ERR
ERROR () { echo "ERROR: $0: $*" >&2; }
DIE () { ERROR "$*"; exit 1; }


opt_verbose='no'
while [ $# -ge 1 ]
do
case $1 in
    -[^-][^-]*)
        # expand '-abcd' to '-a -bcd' (and eventually '-a -b -c -d')
        firstarg="$1"; shift
        set -- "${firstarg:0:2}" "-${firstarg:2}" "$@"; continue;;
    --*=*)
        firstarg="$1"; shift;
        set -- "${firstarg%%=*}" "${firstarg#*=}" "$@"; continue;;
    -v|--verbose) ((++opt_verbose));;
    -h|--help)    print_help; exit 0;;
    --) shift; break;;
    -*) DIE "Unknown option '$1'";;
    *) break;;
esac
shift
done


