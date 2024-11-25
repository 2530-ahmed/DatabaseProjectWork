SET GLOBAL general_log = 'ON';
SET GLOBAL log_output = 'TABLE';
SELECT * FROM mysql.general_log LIMIT 10;

-- Login Activity Report
SELECT event_time, user_host, command_type
FROM mysql.general_log
WHERE command_type = 'Connect';

-- Data Modification Report
SELECT event_time, user_host, argument
FROM mysql.general_log
WHERE argument LIKE '%INSERT%' OR argument LIKE '%UPDATE%' OR argument LIKE '%DELETE%';

-- Role Assignment Report
SELECT event_time, user_host, argument
FROM mysql.general_log
WHERE argument LIKE 'GRANT%' OR argument LIKE 'REVOKE%';

-- Frequent Failed Login Attempts
SELECT event_time, user_host
FROM mysql.general_log
WHERE argument LIKE '%Access denied%';


-- Unauthorized Queries
SELECT event_time, user_host, argument
FROM mysql.general_log
WHERE user_host LIKE '%readonly_user%'
AND (argument LIKE '%UPDATE%' OR argument LIKE '%DELETE%');
