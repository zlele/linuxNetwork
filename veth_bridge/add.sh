sudo ip link add tap1 type veth peer name tap1_peer
sudo ip link add tap2 type veth peer name tap2_peer
sudo ip netns add ns1
sudo ip netns add ns2
sudo ip link set tap1 netns ns1
sudo ip link set tap2 netns ns2
sudo brctl addbr br1
sudo brctl addif br1 tap1_peer
sudo brctl addif br1 tap2_peer
sudo ip netns exec ns1 ip addr add local 192.168.50.1/24 dev tap1
sudo ip netns exec ns2 ip addr add local 192.168.50.2/24 dev tap2
sudo ip link set br1 up
sudo ip link set tap1_peer up
sudo ip link set tap2_peer up
sudo ip netns exec ns1 ip link set tap1 up
sudo ip netns exec ns2 ip link set tap2 up
#sudo ip netns exec ns1 ping 192.168.50.2
