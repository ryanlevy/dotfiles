#!/bin/sh
#description: Cleanup homebrew repositories without removing pinned/specific repositories
#author:      Ryan Levy
#usage:       ./cleanup_homebrew.sh [y]
#notes:       doesn't cleanup by default
#Last revised 3/18/18

#Add extra packages to not clean using package1|package2
#note to not add any extra spaces, or trail with |
DONT_CLEAN="eigen|lmod|hdf5"
#DONT_CLEAN=""

#combine pinned and listed
PINNED=$(brew list --pinned)
if [[ ! -z $DONT_CLEAN ]]; then PINNED="$PINNED|$DONT_CLEAN"; fi
PINNED=$(echo "${PINNED}" | tr '\r\n' '|') #format for grep
PINNED=${PINNED%"|"} #remove trailing '|'

echo "Not removing: ${PINNED}"
if [[ $1 == 'y' || $1 == 'Y' || $1 == 'yes' ]]
then
  brew cleanup $(brew list | grep -Ev "$PINNED" )
else
  echo "Testing cleanup by default; run with ./cleanup_homebrew.sh y "
  brew cleanup -n $(brew list | grep -Ev "$PINNED" )
fi
