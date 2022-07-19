# salt

https://serverspace.ru/support/help/nastrojka-salt-master-minions-na-ubuntu/
https://github.com/saltstack-formulas

```
#master
sudo apt -y install salt-api salt-cloud salt-master salt-ssh salt-syndic
sudo ufw allow proto tcp from any to any port 4505,4506

vi /etc/salt/master
interface: 99.99.99.99

systemctl restart salt-master
salt-key -F master
#need master.pub


#minion
sudo apt -y install salt-minion
sudo ufw allow proto tcp from any to any port 4505,4506

vi /etc/hosts
99.99.99.99 salt

vi /etc/salt/minion_id
hostid
	
vi /etc/salt/minion
master_finger: 'master.pub'

systemctl restart salt-minion

salt-key -L
salt-key --accept='hostid'
salt-key --accept='*'

salt hostid test.ping
salt '*' test.ping
```
_____________________________________________________________________________

https://serverspace.ru/support/help/ispolzovanie-platformy-salt/
```
#commands
salt '*' disk.usage
salt 'hostid' pkg.install nginx
salt hostid pkg.install npm
salt hostid npm.install gulp
salt '*' cmd.run 'ls -l /var'
salt 'hostid' state.apply webserver_setup
salt '*' state.apply
```
#jinja
https://docs.saltproject.io/en/latest/topics/jinja/index.html

_____________________________________________________________________________

```
#orher
salt hostid sys.list_functions test
salt --verbose hostid test.ping
salt '*' cmd.run_all 'echo HELLO'
salt --out=nested hostid cmd.run_all 'echo HELLO'
salt --out=row hostid cmd.run_all 'echo HELLO'
salt --out=json hostid cmd.run_all 'echo HELLO'
salt --out=yaml hostid cmd.run_all 'echo HELLO'
salt --out=quiet hostid cmd.run_all 'echo HELLO'
salt host-* test.ping
salt -E '^my$' test.ping
salt -L 'hostid01,hostid04,hostid10' test.ping
salt hostid grains.items
salt hostid grains.item os_family
salt --grain 'os_family:Debian' test.ping
salt -G 'os_family:Debian' test.ping
salt -G 'os_family:D*' test.pin
salt '*' grains.setval foo bar
salt '*' grains.item foo
salt '*' grains.setval baz '["larry", "moe", "curly"]'
salt '*' grains.item baz
salt '*' grains.delval baz force=True
salt '*' grains.delval baz destructive=True
cat /etc/salt/grains
salt '*' pkg.install nano
salt '*' pkg.version nano
salt '*' pkg.remove nano

salt '*' saltutil.refresh_pillar
salt '*' pillar.items

salt hostid state.sls formulas/formula_name
salt '*' state.highstate
```

```
#salt-call
salt-call state.apply test=true
salt-call state.apply -l debug
salt-call state.enable highstate
salt-call state.disable highstate
```
_____________________________________________________________________________

```
vi /etc/salt/master
file_roots:
  base:
    - /srv/salt/
  dev:
    - /srv/salt/dev/services
    - /srv/salt/dev/states
  prod:
    - /srv/salt/prod/services
    - /srv/salt/prod/states
pillar_roots:
  base:
    - /srv/pillar
  webserver:
    - /srv/pillar-webserver

```
