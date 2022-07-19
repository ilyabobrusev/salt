include:
  - formulas.mysql.database

db_user:
  mysql_user.present:
    - name: stg_db
    - host: '%'
    - password: '{{ pillar['mysql']['stg-passwd'] }}'
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"
    - require:
      - mysql_database: stg_databases

first_db_user:
  mysql_user.present:
    - name: stg-admin
    - password: '{{ pillar['mysql']['stg-passwd'] }}'
    - host: '%'
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"
    - require:
      - mysql_database: stg_databases

second_db_user:
  mysql_user.present:
    - name: stg-db
    - password: '{{ pillar['mysql']['stg-passwd'] }}'
    - host: '%'
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"
    - require:
      - mysql_database: stg_databases
