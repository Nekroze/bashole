# Bashole

Manage and share your ever growing collection of bash scripts.

# Installation

Bashole uses pure bash shell scripts for everything and can be run from the git directory as done in this document, however if you would like a deeper integration you can add the git repository and your `$BASHOLE_DIRECTORY` to your shell's `$PATH` environment variables.

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

If after this the script file opened is empty Bashole will delete it for you, allowing the `edit` command to handle creation, deletion, and modification. If not deleted then the following command will now execute your new script:

```bash
 $ ./bashole do-cool-thing
```

## Builtins

The following builtin scripts are available only when run through bashole.

- `ls` list all builtin and user scripts
- `dump` show all environment variables available to custom scripts
- `edit` edit any given user script, delete it if it is made empty
- `export` export a bundle of user scripts encoded as text
- `import` import text encoded bundle of user scripts
