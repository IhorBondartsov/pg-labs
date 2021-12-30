SELECT *
FROM information_schema.role_table_grants
WHERE grantee in ('read_write_ukraine', 'read_ukraine', 'ukraine_owner', 'admin');