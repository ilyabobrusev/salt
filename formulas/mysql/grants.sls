include:
  - formulas.mysql.database
  - formulas.mysql.users
  - formulas.mysql.query

first_table_grants:
  mysql_grants.present:
    - grant: all privileges
    - database: stagingdb.*
    - user: stg-admin
    - host: '%'
    - require:
      - mysql_user: first_db_user

second_table_grants:
  mysql_grants.present:
    - grant: select,insert,update
    - database: stagingdb.second_table
    - user: stg-db
    - host: '%'
    - require:
      - mysql_user: second_db_user
