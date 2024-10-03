# Database-Creation-Deletion-EOM

SQL Command Execution and Descriptions

1. Creating a Pluggable Database:
   ```sql
   CREATE PLUGGABLE DATABASE plsql_class2024db
   ADMIN USER ki_plsqlauca IDENTIFIED BY kitoga
   ROLES = (DBA)
   FILE_NAME_CONVERT = ('C:\ORACLEDB\ORADATA\ORCLE\PDBSEED\', 'C:\ORACLEDB\ORADATA\ORCLE\PLSQL_CLASS2024DB\');
   ```
   - Description: This command creates a new pluggable database named `plsql_class2024db`. It specifies an admin user `ki_plsqlauca` with a password (`kitoga`) and grants the user DBA (Database Administrator) roles. The `FILE_NAME_CONVERT` clause converts the file names from the source directory (`PDBSEED`) to the target directory for the new pluggable database.
   - Result: The command executed successfully, and a new pluggable database was created.

2. Opening the Pluggable Database:
   ```sql
   ALTER PLUGGABLE DATABASE plsql_class2024db OPEN;
   ```
   - Description: This command opens the previously created pluggable database.
   - Result: The pluggable database `plsql_class2024db` was altered and opened successfully, making it accessible for further operations.

3. Setting the Session Container:
   ```sql
   ALTER SESSION SET CONTAINER = plsql_class2024db;
   ```
   - Description: This command changes the current session to the context of the `plsql_class2024db` pluggable database. This means any subsequent commands will be executed within this database.
   - Result: The session was altered successfully, and the context is now set to `plsql_class2024db`.

4. Querying Tablespaces:
   ```sql
   SELECT tablespace_name FROM dba_tablespaces;
   ```
   - Description: This command retrieves a list of all tablespaces in the database.
   - Result: The output shows the existing tablespaces: `SYSTEM`, `SYSAUX`, `UNDOTBS1`, and `TEMP`.

5. Creating a New User:
   ```sql
   CREATE USER el_plsqlauca IDENTIFIED BY kitoga
   DEFAULT TABLESPACE system
   QUOTA UNLIMITED ON system;
   ```
   - Description: This command creates a new user `el_plsqlauca` with the password `kitoga`. The user is assigned the default tablespace as `SYSTEM`, and is granted unlimited quota on the `SYSTEM` tablespace.
   - Result: The user was created successfully.

6. Creating a New Tablespace:
   ```sql
   CREATE TABLESPACE users
   DATAFILE 'users01.dbf'
   SIZE 100M AUTOEXTEND ON NEXT 10M;
   ```
   - Description: This command creates a new tablespace named `users`, with a data file called `users01.dbf`, starting at 100 MB, and configured to auto-extend by 10 MB when needed.
   - Result: The tablespace `users` was created successfully.

7. Querying Tablespaces Again:
   ```sql
   SELECT tablespace_name FROM dba_tablespaces;
   ```
   - Description: This command retrieves the updated list of tablespaces, including the newly created `users` tablespace.
   - Result: The output now includes the `USERS` tablespace alongside the previous ones.

8. Creating Another User:
   ```sql
   CREATE USER er_plsqlauca IDENTIFIED BY kitoga
   DEFAULT TABLESPACE users
   QUOTA UNLIMITED ON users;
   ```
   - Description: This command creates another user `er_plsqlauca`, assigning it to the `users` tablespace and granting unlimited quota on it.
   - Result: The user was created successfully.

9. Granting Roles to the New User:
   ```sql
   GRANT CONNECT, RESOURCE TO er_plsqlauca;
   ```
   - Description: This command grants the `CONNECT` and `RESOURCE` roles to the user `er_plsqlauca`, allowing it to connect to the database and create resources.
   - Result: The roles were granted successfully.

10. Setting Container Back to CDB$ROOT:
    ```sql
    ALTER SESSION SET CONTAINER = CDB$ROOT;
    ```
    - Description: This command changes the session context back to the root container (CDB).
    - Result: The session was altered successfully to the root container.

11. Creating Another Pluggable Database:
    ```sql
    CREATE PLUGGABLE DATABASE er_to_delete_pdb
    ADMIN USER admin IDENTIFIED BY kitoga
    ROLES = (DBA)
    FILE_NAME_CONVERT = ('C:\ORACLEDB\ORADATA\ORCLE\PDBSEED\', 'C:\ORACLEDB\ORADATA\ORCLE\ER_TO_DELETE_PDB\');
    ```
    - Description: This command creates another pluggable database named `er_to_delete_pdb`, with an admin user `admin` and the password `kitoga`, and grants the user DBA roles. It uses `FILE_NAME_CONVERT` to designate a new storage location.
    - Result: The pluggable database was created successfully.

12. Opening the New Pluggable Database:
    ```sql
    ALTER PLUGGABLE DATABASE er_to_delete_pdb OPEN;
    ```
    - Description: This command opens the newly created pluggable database `er_to_delete_pdb`.
    - Result: The pluggable database was altered and opened successfully.

13. Closing the Pluggable Database:
    ```sql
    ALTER PLUGGABLE DATABASE er_to_delete_pdb CLOSE IMMEDIATE;
    ```
    - Description: This command closes the pluggable database `er_to_delete_pdb` immediately.
    - Result: The pluggable database was closed successfully.

14. Dropping the Pluggable Database:
    ```sql
    DROP PLUGGABLE DATABASE er_to_delete_pdb INCLUDING DATAFILES;
    ```
    - Description: This command drops the pluggable database `er_to_delete_pdb`, including all associated data files.
    - Result: The pluggable database was dropped successfully.



 Summary of Results and Transactions

Throughout the SQL command execution, various tasks were successfully completed, including the creation of new pluggable databases, user accounts, and tablespaces. The database environment was effectively managed with appropriate permissions and settings. The successful execution of these commands demonstrates the ability to manage Oracle Database environments efficiently, ensuring proper user roles and resource allocation. The final command confirmed the ability to remove unwanted pluggable databases, keeping the system organized and efficient.
