# Bashole

Manage and share your ever growing collection of bash scripts.

# Installation

Bashole uses pure bash shell scripts for everything and can be run from the git directory as done in this document, however if you would like a deeper integration you can add the git repository and your `BASHOLE_DIRECTORY` to your shell's `PATH` environment variables.

There is a builtin script that will do an install assuming various things such as using bash as your primary shell and can be executed like so:

```bash
 $ ./bashole install
```

This will add to your `~/.bashrc` file an extension of your `PATH` environment variable to include this git repository and your `BASHOLE_DIRECTORY` to your path allowing usage of the `bashole` command anywhere along with direct usage of any of your user scripts without using the `bashole` as a wrapper although the environment variables described below would not be available in the direct user script execution.

# Usage

Bashole always takes a script name as its first parameter and then any other parameters that script may need afterwards. Bashole comes with a few builtin scripts that implement its core functionality and we can use that as an example, to run the ls script which will list all Bashole scripts (both builtins and user scripts) that Bashole could run and takes no parameters:

```bash
 $ ./bashole ls
```

## Scripting

All scripts managed and executed by Bashole will have available the following environment variables that they may use:

 - `BUILTIN_DIRECTORY` Directory containing builtin scripts to bashole
 - `BASHOLE_DIRECTORY` Directory containing user scripts managed by bashole, defaults to ~/.bashole
 - `BASHOLE_HELPERS` File containing various helper functions that bashole scripts or builtins may use
 - `BASHOLE_TEMPLATE` File containing various helper functions that bashole scripts or builtins may use

Those with the `BASHOLE_` prefix can be overriden by the user.

To start scripting a new script, or edit an existing script managed by bashole, you can utilize the `edit` builtin:

```bash
 $ ./bashole edit do-cool-thing
```

This will copy a modest template script (which can be overriden by setting `BASHOLE_TEMPLATE` in your shell) to `$BASHOLE_DIRECTORY/do-cool-thing` then make it executable before finally opening your favourite editor (indicated by the `EDITOR` environment variable) for you to write your script.

If you have [ShellCheck](https://www.shellcheck.net) installed it will be run on a script after your editor exits to show any unsafe or error prone sections of your script. If any issues are found you will be prompted to re-edit the script.

If after this the script file opened is empty Bashole will delete it for you, allowing the `edit` command to handle creation, deletion, and modification. If not deleted then the following command will now execute your new script:

```bash
 $ ./bashole do-cool-thing
```

## Builtins

The following builtin scripts are available only when run through bashole.

- `install`	install bashole into $PATH via ~/.bashrc
- `import`	import a previously exported user script bundle
- `rename`	rename a user script
- `export`	bundle and export one or more scripts with base64 encoding
- `edit` 	create/edit a user script, will delete it if the script is left empty
- `dump` 	Display all available environment variables for a user script
- `ls`	 	list builtin and user scripts

## Sharing

Sharing scripts, more accurately a bundle of one or more scripts, is easy with Bashole. To get a textual encoding of a collection of scripts you might use the `export` builtin.

```
 $ ./bashole export do-cool-thing
H4sIAMfJAlsAA+3OsQ6CMACEYWaeosSZ0AawD+CgJkYWXwCwCtHQpAUHn14kLi5u4PJ/y+WSG+5s49rae9w3bXcN5iFHOs/fqXQup66ybMpJrgOVpmNm2VqrQKpUjjMhZ/rzZfB96YQIOnNz9ml+7IzzSxxa1ipKBu+Squ0S0z1EVfom9KYXsRkuYWjqxopNURzEabc/bqPw33cBAAAAAAAAAAAAAAAAAB8vx4nw9AAoAAA=
```

The long string of text is a base64 encoded gzipped tarball and can be given to the `import` builtin which will replace my `do-cool-thing` script with the one that was exported.

```
 $ ./bashole import H4sIAMfJAlsAA+3OsQ6CMACEYWaeosSZ0AawD+CgJkYWXwCwCtHQpAUHn14kLi5u4PJ/y+WSG+5s49rae9w3bXcN5iFHOs/fqXQup66ybMpJrgOVpmNm2VqrQKpUjjMhZ/rzZfB96YQIOnNz9ml+7IzzSxxa1ipKBu+Squ0S0z1EVfom9KYXsRkuYWjqxopNURzEabc/bqPw33cBAAAAAAAAAAAAAAAAAB8vx4nw9AAoAAA=
do-cool-thing
```

If you have [ShellCheck](https://www.shellcheck.net) it will be executed on each script you attempt to import and will ask for imort confirmation should any problems be found.
