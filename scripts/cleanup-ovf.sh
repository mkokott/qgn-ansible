#! /bin/bash

TAGS=("<vssd:VirtualSystemType" "<Forwarding")
TMP="$1.tmp"

for tag in "${TAGS[@]}"
do
	egrep -v $tag $1 > $TMP && mv $TMP $1
done