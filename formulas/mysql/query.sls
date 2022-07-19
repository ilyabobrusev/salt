include:
  - formulas.mysql.database

create_first_table:
  mysql_query.run:
    - database: stagingdb
    - query: "create table if not exists first_table(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(100) NOT NULL, PRIMARY KEY ( id ));"
    - output: "/tmp/create_first_table.txt"
    - require:
      - mysql_database: stg_databases

create_second__table:
  mysql_query.run:
    - database: stagingdb
    - query: "create table if not exists second_table(id INT, address VARCHAR(100));"
    - output: "/tmp/create_second_table.txt"
    - require:
      - mysql_database: stg_databases
