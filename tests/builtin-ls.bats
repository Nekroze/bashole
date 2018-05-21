#! /usr/bin/env nix-shell
#! nix-shell -i bats -p bats

@test "invoking bashole ls lists ls" {
  run ./bashole ls
  [ "$status" -eq 0 ]
  [[ " ${lines[@]} " =~ "ls	 list builtin and user scripts" ]]
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
