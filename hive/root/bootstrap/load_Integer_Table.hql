DROP TABLE Integer_Table;
CREATE TABLE Integer_Table ( 
KeyColumn string, Column1 int )
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INPATH '/bootstrap/Integer_Table.csv'

OVERWRITE INTO TABLE Integer_Table;
