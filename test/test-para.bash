#!/bin/bash

LOG () {
    echo
    echo "* $*"
}

check_outputs () {
    while read rand md5 rest
    do
        echo -n "$rand $md5 $rest "
        md5here=$(printf "%s" "$rand" | md5sum | head -c 16)
        if [ $md5here = $md5 ]
        then
            echo "OK"
        else
            echo "MD5 mismatch"
            exit 1
        fi
    done
}



LOG "Buffered output test"
echo 'foo
bar
baz
quux
hoge
piyo
huga
hero' | ./para --buffered "$@" ./test/para-cmd.bash '{}' | check_outputs



LOG "Buffered output test for --map"
./para --buffered --map "$@" ./test/para-cmd.bash one two three four five six seven eight nine ten | check_outputs


testout="./.${0##*/}.$$"
touch "$testout"
LOG "Checking error handling"
echo 'sleep 1; true
sleep 1; false
sleep 1; true
sleep 1; false
sleep 1; true
sleep 1; false
sleep 1; true
sleep 1; false' | ./para sh -c '{}' 2> "$testout"; ret=$?

if [ "$(<$testout)" = 'WARN: para: Had 4 errors.' -a $ret -eq 1 ]; then
    echo "OK"
else
    echo "FAILED: unexpected (or lack of) error message and/or wrong exit code"
    echo "warn='$warn'"
    echo "exit code=$ret"
    exit 1
fi
rm -f "$testout"
