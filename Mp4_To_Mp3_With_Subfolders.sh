#	Another one of my beautiful audio converting scripts
#	Author: Philippe Rosa-Pong
#
for i in $(find . -name *.mp4);
do
  	# get the base filename by stripping off the ".caf" part
  	baseFilename=$(basename "$i" .mp4)
	#echo ${baseFilename}
	basePathname=$(dirname "$i")
	#echo ${basePathname}
 	# determine the preliminary output filename
	outfile="${basePathname}/${baseFilename}.mp3"
	echo ${outfile}
 	ffmpeg -i "$i" "${outfile}"
done
