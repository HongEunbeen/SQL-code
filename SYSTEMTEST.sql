-- USER SQL
CREATE USER SHOPTEST IDENTIFIED BY 6666 
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- QUOTAS
ALTER USER SHOPTEST QUOTA 8M ON USERS;

-- ROLES
GRANT CONNECT TO SHOPTEST;
GRANT RESOURCE TO SHOPTEST;

-- SYSTEM PRIVILEGES