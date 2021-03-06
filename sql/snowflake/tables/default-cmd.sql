/* IMPORTANT: If you modify this file, rename it to cmd.sql (so it won't be overwritten when you upgrade lionfish).
Only cmd.sql will be used when both exist.*/


select
  t.table_catalog as dbName,
  t.table_schema as schemaName,
  t.table_name as tableName,
  case when t.table_type = 'VIEW' then 'Y'
       when t.table_type = 'BASE TABLE' then 'N'
       else t.table_type
  end as isView,
  c.column_name,
  c.data_type,
  null as comments
from
  "##DBNAME##".information_schema.tables t,
  "##DBNAME##".information_schema.columns c
where
  t.table_catalog = c.table_catalog
  and t.table_schema = c.table_schema
  and t.table_name = c.table_name
  and upper(t.table_schema) not in ('PG_CATALOG', 'INFORMATION_SCHEMA')
order by t.table_catalog, t.table_schema, t.table_name, c.ordinal_position;