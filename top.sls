base:
  '*':
    - formulas.universal_setup

  'd11-11':
    - formulas.apache_install
    - formulas.mysql
    - formulas.mysql.users
    - formulas.mysql.grants

  'd11-12':
    - formulas.webserver_setup
    - formulas.percona.percona
