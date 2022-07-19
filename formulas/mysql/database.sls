include:
  - formulas.mysql

python3-mysqldb:
  pkg.installed

stg_databases:
  mysql_database.present:
    - name: stagingdb
    - require:
      - pkg: python3-mysqldb
      - service: mysql_service

databases_to_remove:
  mysql_database.absent:
    - name: test
    - require:
      - pkg: python3-mysqldb
      - service: mysql_service
