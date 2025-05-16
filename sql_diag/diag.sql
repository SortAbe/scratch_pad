--Active load

SELECT *
FROM  performance_schema.global_status
WHERE VARIABLE_NAME LIKE 'Threads_running'
OR VARIABLE_NAME LIKE 'Max_used_connections';

SELECT *
FROM  information_schema.global_status
WHERE VARIABLE_NAME LIKE 'Threads_running'
OR VARIABLE_NAME LIKE 'Max_used_connections';

SHOW VARIABLES LIKE 'max_connections';

--Engine usage
SELECT *
FROM information_schema.ENGINES;

SELECT TABLE_SCHEMA, TABLE_NAME, ENGINE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA like 'DB_NAME';

SELECT TABLE_SCHEMA, TABLE_NAME, ENGINE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA like 'DB_NAME'
AND ENGINE NOT LIKE 'InnoDB';

SELECT COUNT(*)/(
  SELECT COUNT(*)
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA NOT LIKE '%schema'
  AND TABLE_SCHEMA NOT LIKE 'mysql'
) as 'Ratio'
FROM information_schema.TABLES
WHERE TABLE_SCHEMA NOT LIKE '%schema'
AND TABLE_SCHEMA NOT LIKE 'mysql'
AND ENGINE NOT LIKE 'InnoDB';

SELECT TABLE_SCHEMA, TABLE_NAME, ENGINE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA NOT LIKE '%schema'
AND TABLE_SCHEMA NOT LIKE 'mysql'
AND ENGINE NOT LIKE 'InnoDB';

SELECT COUNT(*)
FROM information_schema.TABLES
WHERE TABLE_SCHEMA NOT LIKE '%schema'
AND TABLE_SCHEMA NOT LIKE 'mysql'
AND ENGINE NOT LIKE 'InnoDB';

SELECT USER, DB, TIME, STATE, STAGE, REGEXP_REPLACE(INFO, '[[:space:]]+', ' ') AS 'Query'
FROM information_schema.PROCESSLIST
WHERE INFO IS NOT NULL
AND DB NOT LIKE 'information_schema';

SELECT CONCAT(USER, '@', HOST) as User, DB, TIME, STATE, STAGE, PROGRESS, COMMAND, CONCAT((MEMORY_USED/(1024 * 1024)), ' MB') as 'RAM', EXAMINED_ROWS
FROM information_schema.PROCESSLIST
WHERE INFO IS NOT NULL
AND DB NOT LIKE 'information_schema';

SELECT DISTINCT
    TABLE_NAME,
    INDEX_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'tp1'
AND TABLE_NAME = 'cars';


--Locks
SHOW VARIABLES LIKE 'innodb_lock_wait_timeout';
SELECT @@lock_wait_timeout;
SELECT * FROM performance_schema.data_locks;
--SELECT * FROM information_schema.innodb_locks;


--performance_schema logging
SHOW VARIABLES LIKE 'performance_schema%';
SHOW VARIABLES LIKE 'log_error';

SELECT *
FROM performance_schema.setup_consumers
WHERE NAME LIKE '%statements%';

UPDATE performance_schema.setup_consumers
SET ENABLED = 'YES'
WHERE NAME = 'events_statements_current';

SELECT THREAD_ID, EVENT_NAME, LOCK_TIME, SQL_TEXT, CURRENT_SCHEMA, WARNINGS, ERRORS
FROM performance_schema.events_statements_current
WHERE SQL_TEXT IS NOT NULL;

SELECT *
FROM performance_schema.prepared_statements_instances;

SELECT *
FROM performance_schema.setup_instruments
WHERE NAME = 'statement/sql/select'
OR NAME = 'statement/sql/insert'
OR NAME = 'statement/sql/update'
OR NAME = 'statement/com/Prepare'
OR NAME = 'statement/com/Execute'
OR NAME = 'statement/sql/prepare_sql'
OR NAME = 'statement/sql/execute_sql';

--Tools
PURGE BINARY LOGS BEFORE NOW();



SET GLOBAL general_log_file = '/var/log/mysql/mysql_general.log';
SET GLOBAL log_output = 'FILE';
