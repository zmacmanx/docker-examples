docker pull sath89/oracle-12c
CID=$(docker create sath89/oracle-12c)
docker start ${CID}
 
# Watch the output
docker logs -f ${CID}

# Connect to the container and run sqlplus
docker exec -it ${CID} sqlplus sys as sysdba
Password "oracle"

# Database setup
CREATE USER demo IDENTIFIED BY "password";
# Create a session and a table
GRANT CREATE SESSION, CREATE TABLE TO demo;
# Increase users limits
ALTER USER demo QUOTA 500M ON USERS;
# Connect to the instance with the new user
CONN demo
Password: "password"

# Create table and insert data for testing
CREATE TABLE T(D DECIMAL(3));

INSERT INTO T VALUES (123);
INSERT INTO T VALUES (234);
INSERT INTO T VALUES (567);

SELECT * FROM T;
  
  # Exit
exit

#
# Setup oracle qui
#
docker exec -it ${CID} /bin/bash
