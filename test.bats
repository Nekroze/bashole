#! /usr/bin/env nix-shell
#! nix-shell -i bats -p bats

@test "invoking bashole without arguments prints usage" {
  run ./bashole
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Bashole the Bash Script Hole." ]
  [ "${lines[2]}" = "Usage:" ]
}

@test "invoking bashole ls lists ls" {
  run ./bashole ls
  [ "$status" -eq 0 ]
  [[ " ${lines[@]} " =~ "ls" ]]
}

@test "invoking bashole ls lists dump" {
  run ./bashole ls
  [ "$status" -eq 0 ]
  [[ " ${lines[@]} " =~ "dump" ]]
}

@test "invoking bashole ls lists edit" {
  run ./bashole ls
  [ "$status" -eq 0 ]
  [[ " ${lines[@]} " =~ "edit" ]]
}
