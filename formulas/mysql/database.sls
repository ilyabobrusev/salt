include:
  - formulas.mysql


install_python_pkg:
  pkg.installed:
    {% if grains['os'] == 'Debian' %}
    - name: python3-mysqldb
    {% else %}
    - name: python36-mysql
    {% endif %}


stg_databases:
  mysql_database.present:
    - name: stagingdb
    - require:
      - pkg: install_python_pkg
      - service: mysql_service

databases_to_remove:
  mysql_database.absent:
    - name: test
    - require:
      - pkg: install_python_pkg
      - service: mysql_service
