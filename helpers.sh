set -euf
# Not Uility Functions

# Get path to this file and the directory in which it resides as local
# variables SOURCE and SOURCE_DIRECTORY respectively.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SOURCE_DIRECTORY="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Setup variables to export and provide bashole scripts.
BUILTIN_DIRECTORY="$SOURCE_DIRECTORY/builtins"
BASHOLE_DIRECTORY="${BASHOLE_DIRECTORY:-$HOME/.bashole}"
BASHOLE_HELPERS="$SOURCE"
BASHOLE_TEMPLATE="${BASHOLE_TEMPLATE:-$SOURCE_DIRECTORY/template.sh}"

export BUILTIN_DIRECTORY BASHOLE_DIRECTORY BASHOLE_HELPERS BASHOLE_TEMPLATE

# Utility Functions

# Get the path to a user script by its name
function find_script_by_name() {
	WHICH="$(which which)"
	PATH="$SOURCE_DIRECTORY/builtins:$BASHOLE_DIRECTORY" $WHICH "$1"
}

# Ask the user a question and yes or no defaulting to no.
function get_informed_consent() {
	message="$1"
	read -r -p "$message [y/N]?" yn
	case $yn in
		[Yy]* ) return 0;;
		[Nn]* ) return 1;;
		* ) return 1;;
	esac
}

# Wrapper around any command and its params to supress stdout and stderr
function silently() {
	$@ >/dev/null 2>&1
}

# This is a wrapper around shellcheck so it does not fail if shellcheck is not installed
function maybe_shellcheck() {
	if silently hash shellcheck; then
		shellcheck "$1"
	else
		return 0
	fi
}

function get_file_description() {
	grep "^# Description" "$1" | cut -d":" -f2 | sed -e 's/^[[:space:]]*//' || true
}
