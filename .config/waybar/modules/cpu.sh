read cpu a b c previdle rest < /proc/stat
prevtotal=$((a+b+c+previdle))
sleep 3.0
read cpu a b c idle rest < /proc/stat
sleep 3.0
total=$((a+b+c+idle))
cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))

echo  $cpu%
