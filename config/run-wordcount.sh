#!/bin/bash

# test the hadoop cluster by running wordcount

# create input files 
mkdir input
echo "One for me. None for you." >input/file1.txt
echo "One for you. One for me." >input/file2.txt

# create input directory on HDFS
hadoop fs -mkdir -p input

# put input files to HDFS
hdfs dfs -put ./input/* input

# run wordcount
java -cp wordcount.jar clojure_hadoop.job -job wcclj.core/job -input input -output output

# print the input files
echo -e "\ninput file1.txt:"
hdfs dfs -cat input/file1.txt

echo -e "\ninput file2.txt:"
hdfs dfs -cat input/file2.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000
