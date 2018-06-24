hwclock -s
export BOOTSTRAP_IP=`getent hosts bootstrap | /usr/bin/cut -d " " -f1`
echo ${BOOTSTRAP_IP};
geth --datadir=/root/.ethereum/poa init /root/files/genesis.json
geth --datadir=/root/.ethereum/poa \
--bootnodes enode://288b97262895b1c7ec61cf314c2e2004407d0a5dc77566877aad1f2a36659c8b698f4b56fd06c4a0c0bf007b4cfb3e7122d907da3b005fa90e724441902eb19e@${BOOTSTRAP_IP}:30303 \
--rpcapi "db,personal,eth,net,web3" --rpccorsdomain="*" \
--password /root/files/password \
--keystore /root/files/keystore \
--unlock $ACCOUNT \
--etherbase $ACCOUNT \
--networkid=59267 --rpc --rpcaddr="0.0.0.0" &
geth_pid=$!
swarm  \
--datadir /root/.ethereum/poa \
--bzzport 8500 \
--corsdomain '*' \
--bootnodes enode://288b97262895b1c7ec61cf314c2e2004407d0a5dc77566877aad1f2a36659c8b698f4b56fd06c4a0c0bf007b4cfb3e7122d907da3b005fa90e724441902eb19e@${BOOTSTRAP_IP}:30399 \
--bzzaccount $ACCOUNT  \
--password /root/files/password \
--keystore /root/files/keystore \
--bzznetworkid 1234 &
swarm_pid=$1
wait $geth_pid $swarm_pid
