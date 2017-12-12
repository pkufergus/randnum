
file1="shiyan.txt"
file2="duizhao.txt"

i=0
out1="out1"
out2="out2"
out3="out3"
rm -f $out1
c=0
for i in `seq 5001 6000`
do
    grep $i $file1 >/dev/null 2>&1
    ret1=$?
    grep $i $file2 >/dev/null 2>&1
    ret2=$?
    if [ "$ret1" != "0" -a "$ret2" != "0" ]; then
        printf "$i," >> $out1
        c=$(($c+1))
        if [ "$c" -ge 6000 ]; then
            break
        fi
    fi
done

for i in `seq 6001 10000`
do
    grep $i $file1 >/dev/null 2>&1
    ret1=$?
    grep $i $file2 >/dev/null 2>&1
    ret2=$?
    grep -r $i $file2 >/dev/null 2>&1
    ret3=$?
    if [ "$ret1" != "0" -a "$ret2" != "0" -a "$ret3" != "0" ]; then
        printf "$i," >> $out1
        c=$(($c+1))
        if [ "$c" -ge 6000 ]; then
            break
        fi
    fi
done
