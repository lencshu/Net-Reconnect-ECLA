DATE=`date +%Y-%m-%d-%H:%M:%S`
tries=0
echo --- my watchdog start ---
while [[ $tries -lt 5 ]]
do
        if /bin/ping -c 1 8.8.8.8 >/dev/null
        then
                echo --- exit ---
                exit 0
        fi
        tries=$((tries+1))
        sleep 10
done
echo $DATE network est encule >>net.log
/etc/init.d/network restart