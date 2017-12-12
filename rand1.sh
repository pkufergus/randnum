
file1="shiyan.txt"
file2="duizhao.txt"

i=0
out1="out1"
out2="out2"
out3="out3"
c=0
out=$out3
cat /dev/null>$out
for i in `seq 7001 8000`
do
    grep $i $file1 >/dev/null 2>&1
    ret1=$?
    grep $i $file2 >/dev/null 2>&1
    ret2=$?
    if [ "$ret1" != "0" -a "$ret2" != "0" ]; then
        printf "$i," >> $out
        c=$(($c+1))
        if [ "$c" -ge 100 ]; then
            break
        fi
    fi
done

