o="/etc/proxychains.conf"; echo "dynamic_chain">$o; echo "tcp_read_time_out 30000">>$o; echo "tcp_connect_time_out 15000">>$o; echo "[ProxyList]">>$o; for contador in 1 2 3 4 5 6 7 8; do wget -q -O pb "https://gimmeproxy.com/api/getProxy?protocol=socks5"; pip=$(jq '.ip' pb); ppo=$(jq '.port' pb); ip=$(echo $pip | sed 's/^.\|.$//g'); po=$(echo $ppo | sed 's/^.\|.$//g'); echo "socks5 $ip:$po"; echo "socks5 $ip $po" >>$o; done; exit;
