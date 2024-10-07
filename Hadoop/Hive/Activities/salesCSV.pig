-- Load the CSV file
salesTable = LOAD 'hdfs:///user/sudheerkumar/sales.csv' USING PigStorage(',') AS (Product:chararray,Price:chararray,Payment_Type:chararray,Name:chararray,City:chararray,State:chararray,Country:chararray);
-- Group data using the country column
GroupByCountry = GROUP salesTable BY Country;
-- Generate result format
CountByCountry = FOREACH GroupByCountry GENERATE CONCAT((chararray)$0, CONCAT(':', (chararray)COUNT($1)));
rmf hdfs:///user/sudheerkumar/salesOutput1;
-- Save result in HDFS folder
STORE CountByCountry INTO 'salesOutput1' USING PigStorage('\t');
