versionlock_package:
  pkg.installed:
    - name: yum-plugin-versionlock

#version_hold:
#  pkg.hold:
#    - pkgs: ["erlang-19.3", "erlang-*-19.3"]

version_hold:
  yumpkg.list_holds:
    - pattern: erlang-19.3
