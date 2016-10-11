#!/bin/bash
set -e
set -u
set -o pipefail

# Program name: summarizeSNaQres
# Written by: Rebecca Post
# The purpose of this script is to create a table with relevant information about our analyses,
# including the name of the analysis, the time it took to complete, the seed, some tuning
# parameters, and number of runs that returned a score under a certain threshold.
# The table is saved in summarizeSNaQres.csv.

#make sure you run the script from the same directory that the data folder is located in.

#create headers for columns in table
echo analysis,h,CPUtime,Nruns,Nfail,fabs,frel,xabs,xrel,seed,under3460,under3450,under3440 > summarizeSNaQres.csv

cd hw1-snaqTimeTests/log
for filename in *.log
  do
    #extract directory
    directory="$(dirname $(pwd))"

    #extract analysis name
    rootname="$(basename $filename .log)"

    #extract number of hybridizations from log file.
    h="$(sed -E -n 's/ hmax = ([0-9]),/\1/p' ${rootname}.log)"

    #extract elapsed time of analysis from out file.
    CPUtime="$(sed -E -n 's/ Elapsed time: ([0-9]+\.[0-9]+) seconds.*/\1/p' ${directory}/out/${rootname}.out)"

    #extract number of runs
    Nruns="$(sed -E -n 's/BEGIN: ([0-9]+) runs.*/\1/p' ${directory}/log/${rootname}.log)"

    #extract max number of failed proposals
    Nfail="$(sed -E -n 's/ max number of failed proposals = ([0-9]+), .*/\1/p' ${directory}/log/${rootname}.log)"

    #extract absolute tolerated difference of score function
    fabs="$(sed -E -n 's/.*ftolAbs=([0-9]+.*[0-9]+),/\1/p' ${directory}/log/${rootname}.log)"

    #extract relative tolerated difference of score function
    frel="$(sed -E -n 's/.*ftolRel=([0-9]+.*[0-9]+), ftolAbs.*/\1/p' ${directory}/log/${rootname}.log)"

    #extract xtolAbs
    xabs="$(sed -E -n 's/xtolAbs=([0-9]+\.[0-9]+),.*/\1/p' ${directory}/log/${rootname}.log)"

    #extract xtolRel
    xrel="$(sed -E -n 's/.*xtolRel=([0-9]+\.[0-9]+)\./\1/p' ${directory}/log/${rootname}.log)"

    #extract main seed (seed for the first run)
    seed="$(sed -E -n 's/main seed ([0-9]+)/\1/p' ${directory}/log/${rootname}.log)"

    #find number of runs that returned a network score better than a certain threshold
    under3460=0
    under3450=0
    under3440=0
    #extract -loglik values for each run
    #note: numbers were cut off at the decimal place in order to be processed as an integer
    #this does not affect the categories the values are assigned to because we used lt
    loglik2="$(sed -E -n 's/.*\-loglik ([0-9]+)\..*/\1/p' ${directory}/out/${rootname}.out)"

    #compare each -loglik value to the different thresholds
    for value in $loglik2
    do
      if [ $value -lt 3460 ]
      then
        ((++under3460))
        fi

      if [ $value -lt 3450 ]
      then
        ((++under3450))
      fi

      if [ $value -lt 3440 ]
      then
        ((++under3440))
      fi
    done

    #write the extracted values to a csv file
    echo $rootname,$h,$CPUtime,$Nruns,$Nfail,$frel,$xabs,$xrel,$seed,$under3460,$under3450,$under3440>> ../../summarizeSNaQres.csv
  done
