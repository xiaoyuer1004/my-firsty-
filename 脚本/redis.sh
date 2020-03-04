#!/bash/bin
ip=`ifconfig ens33 | awk '/netmask/{print $2}'`
port=`echo $ip | awk -F. '{print $4 }'`
cd  ruanjian 
tar -xf  redis-4.0.8.tar.gz
cd redis-4.0.8
yum -y install gcc
make && make install 
bash utils/install_server.sh
ss -nutlp | grep redis-server
/etc/init.d/redis_6379  stop
sed -i "s/bind 127.0.0.1/bind $ip/"  /etc/redis/6379.conf
sed -i  "s/port 6379/port 63$port/"  /etc/redis/6379.conf
sed -i 's/# cluster-enabled yes/cluster-enabled yes/' /etc/redis/6379.conf 
sed -i  's/# cluster-config-file nodes-6379.conf/cluster-config-file nodes-6379.conf/'  /etc/redis/6379.conf
sed -i 's/# cluster-node-timeout 15000/cluster-node-timeout 5000/' /etc/redis/6379.conf
/etc/init.d/redis_6379  start
ss -nutlp | grep redis-server
