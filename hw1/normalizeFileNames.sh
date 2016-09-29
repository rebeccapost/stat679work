# Program name: normalizeFileNames
# Written by: Rebecca Post
# The purpose of this program was to alter the file names in the log and out folder from 1-13 to 01-13.
# This will make it easier to go through the analyses in order.

#change all of the filenames in the log folder
cd hw1-snaqTimeTests/log/
for i in {1..9}
do
  echo timetest0${i}_snaq.log
  mv timetest${i}_snaq.log timetest0${i}_snaq.log
done

#changes all of the filenames in the out folder
cd ../out/
for i in {1..9}
do
  echo timetest0${i}_snaq.out
  mv timetest${i}_snaq.out timetest0${i}_snaq.out
done
