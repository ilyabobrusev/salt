network_utilities:
  pkg.installed:
    - pkgs:
      - rsync
      - curl

install_apache:
  pkg.installed:
    {% if grains['os'] == 'CentOS' %}
    - name: httpd
    {% else %}
    - name: apache2
    {% endif %}

apache_service:
  service.running:
    {% if grains['os'] == 'CentOS' %}
    - name: httpd
    {% else %}
    - name: apache2
    {% endif %}
    - enable: True
    - require:
      - pkg: install_apache
    - watch:
      - file: sync file.txt

sync file.txt:
  file.managed:
    - name: /tmp/file.txt
    - source: salt://files/file.txt
    - user: root
    - group: root
    - mode: 777
