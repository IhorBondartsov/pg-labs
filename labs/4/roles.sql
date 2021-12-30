CREATE ROLE admin SUPERUSER;

-- User for work with scheme (read write user)
CREATE ROLE read_write_ukraine LOGIN;
GRANT CREATE, USAGE ON SCHEMA ukraine TO read_write_ukraine;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ukraine TO read_write_ukraine;

-- User - scheme owner (read write user which can add Privileges to other users)
CREATE ROLE ukraine_owner LOGIN;
GRANT CREATE, USAGE ON SCHEMA ukraine to ukraine_owner;
ALTER SCHEMA ukraine OWNER TO ukraine_owner;

-- read  user
CREATE ROLE read_ukraine LOGIN;
GRANT USAGE ON SCHEMA ukraine TO read_ukraine;
GRANT SELECT ON ALL TABLES IN SCHEMA ukraine TO read_ukraine;



