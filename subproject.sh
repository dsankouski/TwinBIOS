#!/bin/sh

HELP=$(cat <<-END
This script creates subdirectory and places symlinks to schematic and libs there.

Usage: subproject.sh <subproject name>
END
)

if [ "$#" -ne 1 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  echo "$HELP"
  exit 1;
fi

SUB_PROJECT_NAME=$1

mkdir "$SUB_PROJECT_NAME"
cp subproject.template "$SUB_PROJECT_NAME"/"$SUB_PROJECT_NAME".pro
cp subproject-sym-lib-table.template "$SUB_PROJECT_NAME"/sym-lib-table
ln -s ../TwinBios.lib "$SUB_PROJECT_NAME"/"$SUB_PROJECT_NAME".lib
ln -s ../TwinBios.sch "$SUB_PROJECT_NAME"/"$SUB_PROJECT_NAME".sch
