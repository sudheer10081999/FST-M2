-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/sudheerkumar/input.txt' AS (line);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
totalCount = FOREACH grpd GENERATE $0 AS word, COUNT($1) AS countOfWords;
--Remove the old results folder
rmf hdfs:///user/sudheerkumar/PigResult;
-- Store the result in HDFS
STORE totalCount INTO 'hdfs:///user/sudheerkumar/PigResults';
