include:
  - formulas.erlang.versionlock

erlang-repo:
  pkgrepo.managed:
    - humanname: Centos $releasever - $basearch - Erlang Solutions
    - baseurl: http://packages.erlang-solutions.com/rpm/centos/$releasever/$basearch
    - gpgcheck: 1
    - gpgkey: http://packages.erlang-solutions.com/debian/erlang_solutions.asc

erlang_package:
  pkg.installed:
    - name: erlang-erts
    - version: 19.3
    - update_holds: true
    - hold: true
