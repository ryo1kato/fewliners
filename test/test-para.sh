#!/bin/bash

echo 'foo
bar
baz
quux
hoge
piyo
huga
hero' | ./para "$@" ./test/para-cmd.sh {} | while read rand md5 rest
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
