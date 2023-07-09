# Rebranding script --- nimtemplate
# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

## Script to rebrand this template repository.

import std/[os, strutils]

let input = commandLineParams()
if input.len notin {1, 3}:
  echo "Usage: rebrand PROJECT_NAME [<AUTHOR> <EMAIL>]"
  quit 1

if input.len == 3:
  for file in ["rebrand.nim", "README.md", "nimtemplate.nimble", "src/nimtemplate.nim", "src/nimtemplate/common.nim", "tests/test.nim", ".github/dependabot.yml", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/nim-run/action.yml", ".gitignore"]:
    file.writeFile file.readFile.multiReplace(("nimtemplate", input[0]), ("gruruya.chi4c@slmails.com", input[2]), ("Gruruya", input[1]))
else:
  for file in ["rebrand.nim", "README.md", "nimtemplate.nimble", "src/nimtemplate.nim", "src/nimtemplate/common.nim", "tests/test.nim", ".github/dependabot.yml", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/nim-run/action.yml"]:
    file.writeFile file.readFile.replace("nimtemplate", input[0])

moveFile("nimtemplate.nimble", project & ".nimble")
moveFile("src/nimtemplate.nim", "src/" & project & ".nim")
moveDir("src/nimtemplate", "src/" & project)

echo "Done"
