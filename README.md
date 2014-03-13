#fewliners

Various tiny scripts to help day-to-day CLI life

Most of the scripts have `--help` option

## Scripting
* `cutlink`  - Convert a symlink/hardlink to a real file (by copying it).
* `for-each-line` - Poor person's GNU parallel.
* `realpath` - Python implementation of `realpath`. Similar to `readlink -f`.
* `xcat` - Extended version of zcat - supports `.bz2`, `.xz`, `.lzma` also.
* `zpv`  - `zcat` equivalent of `pv`

## Data Manipuration
* `add`       - sum/avg/min/max or percentile of columns for CSV like data.
* `amlgrep`   - AWK Multiline Log Grep: AWK wrapper to grep multiline logs.
* `fancytee`  - Text version of pv with keyword counting (NOTE: it's slow).
* `timediff`  - Calculate time differences for list of datetime data.
* `urldecode` - URL encode.
* `urlencode` - URL decode.

## Systems Operations
* `batch-ssh` - ssh wrapper to enable `-o BatchMode=yes` and other options.
* `sshping`  - Check remote host health: ping, ssh port, ssh login, fs health.
* `apt`  - a tiny wrapper for `apt-{get,cache}` to just save key types.

## Other
* `git-add-backup` - Create a local backup repo and a hook to push on every commit.
* `args`  - Pretty print arguments of a command. Nice to debug looong Java command line etc.
* `now`  - realtime clock.

