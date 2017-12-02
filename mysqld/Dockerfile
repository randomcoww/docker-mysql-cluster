FROM randomcoww/k8s-mysql_cluster:latest

COPY my.cnf /etc/my.cnf
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
