SELECT
  t.TABLE_SCHEMA AS `schema`,
  t.TABLE_NAME AS `table`,
  t.AUTO_INCREMENT AS `auto_increment`,
  c.DATA_TYPE AS `pk_type`,
  (
    t.AUTO_INCREMENT / (
      CASE DATA_TYPE
        WHEN 'tinyint' THEN IF (COLUMN_TYPE LIKE '%unsigned', 255, 127)
        WHEN 'smallint' THEN IF (COLUMN_TYPE LIKE '%unsigned', 65535, 32767)
        WHEN 'mediumint' THEN IF (COLUMN_TYPE LIKE '%unsigned', 16777215, 8388607)
        WHEN 'int' THEN IF (
          COLUMN_TYPE LIKE '%unsigned',
          4294967295,
          2147483647
        )
        WHEN 'bigint' THEN IF (
          COLUMN_TYPE LIKE '%unsigned',
          18446744073709551615,
          9223372036854775807
        )
      END / 100
    )
  ) AS `max_value_percent`
FROM
  information_schema.TABLES t
  INNER JOIN information_schema.COLUMNS c ON t.TABLE_SCHEMA = c.TABLE_SCHEMA
  AND t.TABLE_NAME = c.TABLE_NAME
WHERE
  t.AUTO_INCREMENT IS NOT NULL
  AND c.COLUMN_KEY = 'PRI'
  AND c.DATA_TYPE LIKE '%int'
ORDER BY
  max_value_percent DESC
LIMIT
  40;
