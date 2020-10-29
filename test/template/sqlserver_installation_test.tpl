CREATE SERVER sqlserver_fdw FOREIGN DATA WRAPPER odbc_fdw
  OPTIONS (
   odbc_DRIVER '${driver}',
   "odbc_Server" '${host}',
   "odbc_Port" '${port}',
   "odbc_Database" '${dbname}'
  );
CREATE USER MAPPING FOR postgres SERVER sqlserver_fdw
  OPTIONS (
    "odbc_UID" '${user}',
    "odbc_PWD" '${password}'
);
IMPORT FOREIGN SCHEMA dbo
  FROM SERVER sqlserver_fdw
  INTO public
  OPTIONS(
    ApplicationIntent 'ReadOnly'
);
-- !OUTPUT! NOTICE:  Data type not supported (-3) for column ignored