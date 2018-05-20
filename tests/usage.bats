#! /usr/bin/env nix-shell
#! nix-shell -i bats -p bats

@test "invoking bashole without arguments prints usage" {
  run ./bashole
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Bashole the Bash Script Hole." ]
  [ "${lines[2]}" = "Usage:" ]
}

