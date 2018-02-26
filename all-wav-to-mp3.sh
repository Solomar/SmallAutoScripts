for i in *.wav;
do
  	# get the base filename by stripping off the ".wav" part
  	baseFilename=`basename "${i}" .wav`

 	# determine the preliminary output filename set to mp3
	outfile="${baseFilename}.mp3"
 	ffmpeg -i "$i" -af “volume=1.0f” “$outfile"
done
