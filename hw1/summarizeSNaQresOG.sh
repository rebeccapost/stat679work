# Program name: summarizeSNaQres
# Written by: Rebecca Post
# The purpose of this script is to create a table with relevant information about our analyses.
# The table has the name of the analysis, the number of hybridizations allowed, and the time
# the analysis took. The table is saved in summarizeSNaQres.csv.

#homework 1 exercise 2, ORIGINAL script

#make sure you run the script from the same directory that the data folder is located in.

#create headers for columns in table
echo analysis,h,CPUtime > summarizeSNaQres.csv

cd hw1-snaqTimeTests/log
for filename in *.log
  do
    #extract analysis name
    #would not work if there is another o or l in the filename.
    rootname="$(echo $filename | grep -o '[^\.log]*')"
    #extract number of hybridizations from log file.
    h="$(grep "hmax =" ${rootname}.log | grep -o "[0-9]*")"
    #extract elapsed time of analysis from out file.
    CPUtime="$(grep "Elapsed time" ../out/${rootname}.out | grep -Eo "[0-9]+\.[0-9]+")"

    #write analysis name, number of hybridizations, and elapsed time to table file
    echo ${rootname},${h},${CPUtime} >> ../../summarizeSNaQres.csv
  done
