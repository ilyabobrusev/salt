percona_repo:
  pkg.installed:
    - sources:
      - percona-release_latest: https://repo.percona.com/apt/percona-release_latest.jammy_all.deb

percona-release:
  cmd.run:
    - name: percona-release setup ps80

percona_pkg:
  pkg.installed:
    - pkgs:
      - percona-server-server
      - percona-server-client

mysql_service:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: percona_pkg
