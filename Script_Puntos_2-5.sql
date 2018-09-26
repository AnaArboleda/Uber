
---------------PUNTO NO.2 ------------------------------------------
-----------------Create 3 Tablespaces (0.1)?:
--a. first one with 2 Gb and 1 datafile, tablespace should be named "uber?"
 
    CREATE TABLESPACE uber
    DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\df_uber.dbf' SIZE 2G;
    
--b. Undo tablespace with 25Mb of space and 1 datafile

    CREATE UNDO TABLESPACE undo_uber
    DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\df_undo_uber.dbf' SIZE 25M;

--c. Bigfile tablespace of 5Gb

   CREATE BIGFILE TABLESPACE big_uber
   DATAFILE 'C:/oraclexe\app/oracle\oradata/XE/df_big_uber.dbf' SIZE 5G;

--d. Set the undo tablespace to be used in the system

   ALTER SYSTEM SET UNDO_TABLESPACE = df_undo_uber;
   
---------------PUNTO NO.3 ------------------------------------------
--Create a DBA user (with the role DBA) and assign it to the tablespace called "uber?", this user has
--unlimited space on the tablespace (The user should have permission to connect) (0.1)

    CREATE USER dba_user_uber
    IDENTIFIED BY dba_user_uber
    DEFAULT TABLESPACE uber
    QUOTA UNLIMITED ON uber;

    GRANT DBA, CONNECT TO dba_user_uber;
    
-------------- PUNTO NO.4 ------------------------------------------- 
--Create 2 profiles. (0.1)
--a. Profile 1: "clerk" password life 40 days, one session per user, 10 minutes idle, 4 failed login attempts
  
    CREATE PROFILE PRF_cleck LIMIT
    SESSIONS_PER_USER    1
    PASSWORD_LIFE_TIME  40
    IDLE_TIME           10
    FAILED_LOGIN_ATTEMPTS   4;

--b. Profile 3: "development" password life 100 days, two session per user, 30 minutes idle, no
--failed login attempts

    CREATE PROFILE PRF_development LIMIT
    SESSIONS_PER_USER    2
    PASSWORD_LIFE_TIME  100
    IDLE_TIME           30;

-------------- PUNTO NO.5 ------------------------------------- 
--Create 4 users, assign them the tablespace "uber?":
--a. 2 of them should have the clerk profile and the remaining the development profile, all the users
--should be allow to connect to the database.

    CREATE USER clerk_user1
    IDENTIFIED BY user1
    PROFILE PRF_cleck
    DEFAULT TABLESPACE uber;
    
    CREATE USER clerk_user2
    IDENTIFIED BY user1
    PROFILE PRF_cleck
    DEFAULT TABLESPACE uber;
    
    CREATE USER development_user1
    IDENTIFIED BY user1
    PROFILE PRF_development
    QUOTA UNLIMITED ON uber
    ACCOUNT UNLOCK
    DEFAULT TABLESPACE uber;
    
    CREATE USER development_user2
    IDENTIFIED BY user1
    PROFILE PRF_development
    DEFAULT TABLESPACE uber;
    
    --remaining the development profile, all the users should be allow to connect to the database
    GRANT CREATE SESSION, CREATE TABLE TO development_user1;

--b. Lock one user associate with clerk profile (0.1)

    ALTER USER clerk_user2
    IDENTIFIED BY user1
    DEFAULT TABLESPACE uber
    PROFILE PRF_cleck
    ACCOUNT LOCK;
    
    




