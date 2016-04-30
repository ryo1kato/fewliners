#!/bin/bash

echo 'foo
bar
baz
quux
hoge
piyo
huga
hero' | ./para "$@" ./test/para-cmd.bash '{}' | while read rand md5 rest
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

echo 'sleep 1; true
sleep 1; false
sleep 1; true
sleep 1; false
sleep 1; true
sleep 1; false
sleep 1; true
sleep 1; false' | warn=$(para -v sh -c '{}' 2>&1); ret=$?

if [ "$warn" = 'WARN: para: Had 4 errors.' -a $ret -eq 1 ]; then
    echo "OK"
fi
