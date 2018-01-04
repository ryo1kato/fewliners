#!/bin/bash

errors=0
PARA=./para

LOG () {
    echo
    echo "* $*"
}

OK () {
    echo OK
}

FAIL () {
    echo FAIL "$@" >2
    let errors++
}

ASSERT_EQ () {
    if [ "$1" == "$2" ]
    then
        OK
    else
        FAIL "'$1' != '$2'"
    fi
}

check_outputs () {
    while read rand md5 rest
    do
        echo -n "$rand $md5 $rest "
        md5here=$(printf "%s" "$rand" | md5sum | head -c 16)
        if [ $md5here = $md5 ]
        then
            OK
        else
            FAIL
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
hero' | $PARA --buffered "$@" ./test/para-cmd.bash '{}' | check_outputs



LOG "Buffered output test for --map"
$PARA --buffered --map "$@" ./test/para-cmd.bash one two three four five six seven eight nine ten | check_outputs


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
sleep 1; false' | $PARA sh -c '{}' 2> "$testout"; ret=$?

if [ "$(<$testout)" = 'WARN: para: Had 4 errors.' -a $ret -eq 1 ]; then
    OK
else
    echo "FAILED: unexpected (or lack of) error message and/or wrong exit code"
    echo "warn='$warn'"
    echo "exit code=$ret"
    FAIL
fi
rm -f "$testout"


full='/hoge/piyo/huga.ext'
noext='/hoge/piyo/huga'
base='huga.ext'
dirname='/hoge/piyo'
base_noext='huga'


LOG "Checking {} substitution"
ASSERT_EQ $(echo "$full" | $PARA echo '@{}@{}@') "@$full@$full@"

LOG "Checking {.} substitution"
ASSERT_EQ $(echo "$full" | $PARA echo '@{.}@{.}@') "@$noext@$noext@"

LOG "Checking {/} substitution"
ASSERT_EQ $(echo "$full" | $PARA echo '@{/}@{/}@') "@$base@$base@"

LOG "Checking {//} substitution"
ASSERT_EQ $(echo "$full" | $PARA echo '@{//}@{//}@') "@$dirname@$dirname@"

LOG "Checking {/.} substitution"
ASSERT_EQ $(echo "$full" | $PARA echo '@{/.}@{/.}@') "@$base_noext@$base_noext@"

LOG "Checking ALL of {*} substitution"
ASSERT_EQ $(echo "$full" | $PARA echo '@{}@{.}@{/}@{//}@{/.}@') "@$full@$noext@$base@$dirname@$base_noext@"

