#All the network space and veth will be removed when removing ns.
sudo ip netns delete ns1
sudo ip netns delete ns2
sudo ip link set br1 down
sudo brctl delbr br1
