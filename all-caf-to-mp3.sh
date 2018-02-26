#	Another one of my beautiful audio converting scripts
#	Author: Philippe Rosa-Pong

for i in *.caf;
do
  	# get the base filename by stripping off the ".caf" part
  	baseFilename=`basename "${i}" .caf`

 	# determine the preliminary output filename
	outfile="${baseFilename}.mp3"
 	ffmpeg -i "$i" "$outfile"
done
