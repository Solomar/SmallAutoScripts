#	Another one of my beautiful audio converting scripts
#	Author: Philippe Rosa-Pong

for i in *.mp3;
do
  	# get the base filename by stripping off the ".caf" part
  	baseFilename=`basename "${i}" .mp3`

 	# determine the preliminary output filename
	outfile="${baseFilename}_boosted.mp3"
 	ffmpeg -i "$i" -af “volume=2.35f” “$outfile"
done
