# Geth Swarm Cluster
A geth and swarm cluster powerd by docker and docker compose  

geth use POA ( Proof Of Authority ) Mode

use nginx for load balancing

## How To Use

### Bootstrap node

```
docker-compose up -d bootstrap  
```

### Not mining node, just accept block
```
docker-compose up -d --scale eth=3 eth # how many node you want
```

### Mining node
Because every miner must have different address, so can't scale as many as we want.

Must start at least 2 for POA Mode
```
docker-compose up -d miner1
docker-compose up -d miner2
docker-compose up -d miner3
```

### Nginx for load balancing
```
docker-compose up -d nginx
```


## Reference
- https://github.com/calee0219/docker-geth-cluster
- https://github.com/konradkonrad/docker-pyeth-cluster
