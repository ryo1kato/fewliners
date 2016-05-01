#!/bin/bash

set -e -u

scriptpath="${BASH_SOURCE[0]}"
tgt="${scriptpath%/*}/../jq-grep"
testdata="${scriptpath%/*}/test-jq-grep.json"

error=0
assert () {
    expected_ret="$1"
    expected_stdout="$2"
    shift 2
    printf "Testing '%s' ... " "$*"
    if stdout=$("$@" < "$testdata")
    then ret=$?
    else ret=$?
    fi
    if [ "$ret" -eq "$expected_ret" -a "$stdout" = "$expected_stdout" ]
    then
        printf "OK\n"
    else
        printf "ERROR\n"
        printf "  return code: '$ret' (expected: '$expected_ret')\n"
        printf "  output: '$stdout' (expected: '$expected_stdout')\n"
        let error+=1
    fi
}
assert 0 '4' $tgt --count 'foo'         '.list[].string'
assert 0 '4' $tgt --count --any 'foo'   '.list[].string'
assert 0 '1' $tgt --count --all 'foo'   '.list[].string'
assert 0 '2' $tgt --count -v 'foo'       '.list[].string'
assert 0 '2' $tgt --count -v --any 'foo' '.list[].string'
assert 0 '5' $tgt --count -v --all 'foo' '.list[].string'
assert 1 '0' $tgt --count 'FOO'          '.list[].string'
assert 0 '4' $tgt --ignore-case --count    'FOO' '.list[].string'
assert 0 '2' $tgt --ignore-case --count -v 'FOO' '.list[].string'
assert 0 '4' $tgt --count 'foo'
assert 1 ''  $tgt         'NONEXISTENT' '.list[].string'
assert 1 '0' $tgt --count 'NONEXISTENT' '.list[].string'

echo "Total Errors: $error"
((error == 0))
