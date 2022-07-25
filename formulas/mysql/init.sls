{% if grains['os'] == 'Debian' %}
mysql-repo:
  pkgrepo.managed:
    - humanname: MySQL Repo
    - name: deb http://repo.mysql.com/apt/debian bullseye mysql-8.0
      file: /etc/apt/sources.list.d/mysql.list
      refresh: True
      key_url: http://repo.mysql.com/RPM-GPG-KEY-mysql-2022
    - name: deb http://repo.mysql.com/apt/debian bullseye mysql-tools
      file: /etc/apt/sources.list.d/mysql.list
      refresh: True
      key_url: http://repo.mysql.com/RPM-GPG-KEY-mysql-2022
    - name: deb-src http://repo.mysql.com/apt/debian bullseye mysql-tools
      file: /etc/apt/sources.list.d/mysql.list
      refresh: True
      key_url: http://repo.mysql.com/RPM-GPG-KEY-mysql-2022
{% endif %}

mysql_package:
  pkg.installed:
    {% if grains['os'] == 'Debian' %}
    - name: mysql-server
    {% else %}
    - name: mariadb-server
    {% endif %}

mysql_conf:
  file.managed:
    - name: /etc/mysql/mysql.conf.d/mysqld.cnf
    - source: formulas/mysql/files/mysqld.cnf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: mysql_package

mysql_service:
  service:
    - name: mysql
    - running
    - enable: True
    - reload: True
    - require:
      - file: mysql_conf
    - watch:
      - file: mysql_conf
