#stat679work.hw1

This directory will contain the script files for the exercises of homework1 for stat 679 as well as the data for homework 1. The data for this homework was obtained from the class repository.

The data originally came from (downloaded on 9/15/16):
```r
git clone git@github.com:UWMadison-computingtools/coursedata.git
```
The data is stored originally in ~/stat679/coursedata.
The data was moved to this directory by:
```r
cp -R hw1-snaqTimeTests ~/stat679/homework/stat679work/hw1
```

Homework1 has 3 exercises. (2 scripts written as of 9/28)
1. Exercise1: normalizeFileNames.sh
This exercise normalized the filenames so that the numbers went from 01-13, instead of 1-13.
2. Exercise2: summarizeSNaQres.sh
This exercise creates a table containing the allowable number of hybridizations in each analysis and the elapsed time of each anaylsis. This outputs a csv file titled summarizeSNaQres.csv.
3. Exercise3: summarizeSNaQres.sh
This exercise creates a table, just like exercise 2, but includes more columns with further information about the analyses. The output is a csv file titled summarizeSNaQres.csv.

NOTE: Exercise2 and Exercise3 have the same file name. This means this script will no longer produce the output of Exercise2. The script has been preserved both by copying the file to another name (summarizeSNaQresOG.sh), and by saving the version in git before it was altered.
 The version was saved on 10/4:
 ```r
 git tag v1.2
 git push origin v1.2
 ```

Important for running script files:
1. All exercises assume you are in the same directory as the hw1-snaqTimeTests folder (the data folder), NOT IN hw1-snaqTimeTests. The scripts access the log and out folders under this assumption. The data folder must be called hw1-snaqTimeTests, or the script will not run either.
2. The table generated in exercise 2 will be placed in the same directory as the script that you ran.
