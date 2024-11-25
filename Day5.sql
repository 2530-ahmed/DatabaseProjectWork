SELECT * FROM mysql.user 
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\user_backup_new.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';
