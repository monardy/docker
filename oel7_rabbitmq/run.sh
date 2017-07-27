sysctl -w net.ipv4.ip_local_port_range="100 65535"
sysctl -w net.core.somaxconn=4096
export RABBITMQ_USE_LONGNAME="true"
export RABBITMQ_NODENAME="rabbit@`hostname -f`"
export RABBITMQ_LOG_BASE="/media/data/rabbitmq/log"
export RABBITMQ_MNESIA_BASE="/media/data/rabbitmq/base"
export RABBITMQ_CLUSTER=`echo "'"$RABBITMQ_CLUSTER"'"|sed -e "s/ /', '/g"`

echo $RABBITMQ_ERLANG_COOKIE > /home/rabbitmq/.erlang.cookie
chown operator:root /home/rabbitmq/.erlang.cookie
chmod 400 /home/rabbitmq/.erlang.cookie


echo "[
  {rabbit, [
    {cluster_nodes, {["$RABBITMQ_CLUSTER"], disc}},
    {cluster_partition_handling, autoheal},
    {vm_memory_high_watermark, {absolute, \""$VM_MEMORY_HIGT_WATERMARK"MiB\"}},
    {disk_free_limit, \""$DISC_FREE_LIMIT"MiB\"},
    {default_user, <<\""$LOGIN"\">>},
    {default_pass, <<\""$PASS"\">>}
  ]},
  {kernel, [
    {inet_dist_listen_max, 44001},
    {inet_dist_listen_min, 44001}
  ]}
]." > /etc/rabbitmq/rabbitmq.config

echo '[rabbitmq_management,rabbitmq_top].' > /etc/rabbitmq/enabled_plugins

rabbitmq-server
