-- Connect to the database as SYSDBA
sqlplus sys as SYSDBA;

-- Create a new pluggable database
CREATE PLUGGABLE DATABASE plsql_class2024db
ADMIN USER ki_plsqlauca IDENTIFIED BY kitoga
ROLES = (DBA)
FILE_NAME_CONVERT = ('C:\ORACLEDB\ORADATA\ORCLE\PDBSEED\', 'C:\ORACLEDB\ORADATA\ORCLE\PLSQL_CLASS2024DB\');

-- Open the pluggable database
ALTER PLUGGABLE DATABASE plsql_class2024db OPEN;

-- Set the session container to the new pluggable database
ALTER SESSION SET CONTAINER = plsql_class2024db;

-- Query to list existing tablespaces
SELECT tablespace_name FROM dba_tablespaces;

-- Create a new user
CREATE USER el_plsqlauca IDENTIFIED BY kitoga
DEFAULT TABLESPACE system
QUOTA UNLIMITED ON system;

-- Create a new tablespace
CREATE TABLESPACE users
DATAFILE 'users01.dbf'
SIZE 100M AUTOEXTEND ON NEXT 10M;

-- Query to list tablespaces again
SELECT tablespace_name FROM dba_tablespaces;

-- Create another user
CREATE USER er_plsqlauca IDENTIFIED BY kitoga
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;

-- Grant roles to the new user
GRANT CONNECT, RESOURCE TO er_plsqlauca;

-- Set the session container back to CDB$ROOT
ALTER SESSION SET CONTAINER = CDB$ROOT;

-- Create another pluggable database
CREATE PLUGGABLE DATABASE er_to_delete_pdb
ADMIN USER admin IDENTIFIED BY kitoga
ROLES = (DBA)
FILE_NAME_CONVERT = ('C:\ORACLEDB\ORADATA\ORCLE\PDBSEED\', 'C:\ORACLEDB\ORADATA\ORCLE\ER_TO_DELETE_PDB\');

-- Open the newly created pluggable database
ALTER PLUGGABLE DATABASE er_to_delete_pdb OPEN;

-- Close the pluggable database
ALTER PLUGGABLE DATABASE er_to_delete_pdb CLOSE IMMEDIATE;

-- Drop the pluggable database including datafiles
DROP PLUGGABLE DATABASE er_to_delete_pdb INCLUDING DATAFILES;
