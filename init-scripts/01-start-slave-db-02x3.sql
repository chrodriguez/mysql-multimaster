change master to master_host='db-01', master_user='repl', master_password='pass', master_auto_position=1 for channel 'db-01';
change master to master_host='db-03', master_user='repl', master_password='pass', master_auto_position=1 for channel 'db-03';
start slave;

