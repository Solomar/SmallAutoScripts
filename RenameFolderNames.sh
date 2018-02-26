#	Rename .lproj folders
#	Author: Philippe Rosa-Pong

find . -name '*\.lproj*' | while read f; do mv "$f" "${f//\.lproj/}"; done