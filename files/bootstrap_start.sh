hwclock -s
export BOOTSTRAP_IP=`getent hosts bootstrap | /usr/bin/cut -d " " -f1`;
echo $BOOTSTRAP_IP;
geth --datadir=/root/.ethereum/poa init /root/files/genesis.json
geth \
--datadir /root/.ethereum/poa \
--nodekeyhex 091bd6067cb4612df85d9c1ff85cc47f259ced4d4cd99816b14f35650f59c322 \
--rpcapi "db,personal,eth,net,web3" --rpccorsdomain "*" \
--password /root/files/password \
--keystore /root/files/keystore \
--unlock $ACCOUNT \
--etherbase $ACCOUNT \
--networkid 59267 --rpc --rpcaddr "0.0.0.0" &
geth_pid=$!
swarm  \
--datadir /root/.ethereum/poa \
--bzzport 8500 \
--corsdomain '*' \
--nodekeyhex 091bd6067cb4612df85d9c1ff85cc47f259ced4d4cd99816b14f35650f59c322 \
--bzzaccount $ACCOUNT  \
--password /root/files/password \
--keystore /root/files/keystore \
--bzznetworkid 1234 &
swarm_pid=$1
wait $geth_pid $swarm_pid
