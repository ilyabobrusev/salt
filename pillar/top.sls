base:
  'd11-11':
    - mysql
  'd11-12':
    - user_info
    - core
  'os_family:debian':
    - match: grain
    - pub_ssh_key
