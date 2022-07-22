versionlock_package:
  pkg.installed:
    - name: yum-plugin-versionlock

version_hold:
  yumpkg.hold:
    - pkgs: '["erlang-19.3", "erlang-*-19.3"]'
