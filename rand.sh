
file1="shiyan.txt"
file2="duizhao.txt"
file3="backup/duizhao.txt"
file4="backup/shiyan.txt"
file5="backup/zhaozhuang.sid"

i=0
out1="out1"
out2="out2"
out3="out3"
rm -f $out1
c=0
echo "c=$c"
total_num=4000
for i in `seq 5001 6000`
do
    grep $i $file1 >/dev/null 2>&1
    ret1=$?
    grep $i $file2 >/dev/null 2>&1
    ret2=$?
    if [ "$ret1" != "0" -a "$ret2" != "0" ]; then
        printf "$i," >> $out1
        c=$(($c+1))
        if [ "$c" -ge $total_num ]; then
            break
        fi
    fi
done

echo "c=$c"
for i in `seq 6001 9999`
do
    grep $i $file1 >/dev/null 2>&1
    ret1=$?
    grep $i $file2 >/dev/null 2>&1
    ret2=$?
    grep -r $i backup/  >/dev/null 2>&1
    ret3=$?
    if [ "$ret1" != "0" -a "$ret2" != "0" -a "$ret3" != "0" ]; then
        if [ "$c" -ge $total_num ]; then
            break
        fi
        printf "$i," >> $out1
        c=$(($c+1))
    fi
done
echo "c=$c"
for i in `seq 1 5000`
do
    if [ "$i" == "2011" -o "$i" == "1753" -o "$i" == "2489" -o "$i" == "936" ]; then
        continue
    fi
    grep ",$i," backup/zhaozhuang.sid  >/dev/null 2>&1
    ret1=$?
    if [ "$ret1" != "0" ]; then
        if [ "$c" -ge $total_num ]; then
            break
        fi
        printf "$i," >> $out1
        c=$(($c+1))
    fi
done
echo "c=$c"
