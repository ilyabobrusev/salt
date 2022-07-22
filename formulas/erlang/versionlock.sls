versionlock_package:
  pkg.installed:
    - name: yum-plugin-versionlock

add_versionlock_erlang:
  cmd.run:
    - name: versionlock
    - onchanges:
        - cmd: yum versionlock erlang-19.3 erlang-*-19.3
