erlang-repo:
  pkgrepo.managed:
    - humanname: Centos $releasever - $basearch - Erlang Solutions
    - mirrorlist: http://packages.erlang-solutions.com/rpm/centos/$releasever/$basearch
    - gpgcheck: 1
    - gpgkey: http://packages.erlang-solutions.com/debian/erlang_solutions.asc

mysql_package:
  pkg.installed:
   - name: erlang
