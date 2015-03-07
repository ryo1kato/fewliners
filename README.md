#fewliners

Various tiny scripts to help day-to-day CLI life

Most of the scripts have `--help` option

## Scripting
* `cutlink`  - Convert a symlink/hardlink to a real file (by copying it).
* `for-each-line` - Poor person's GNU parallel.
* `header`, (`hgrep`, `hsort`) - Run a filter command with keeping a header line in input.
* `map` - do `for var in value....; do command xxx; done` with less key types
* `mkoneliner` - run a Makefile command oneliner
* `realpath` - Python implementation of `realpath`. Similar to `readlink -f`.
* `xcat` - Extended version of zcat - supports `.bz2`, `.xz`, `.lzma` also.
* `zpv`  - `zcat` equivalent of `pv`

## Data Manipuration
* `add`       - sum/avg/min/max or percentile of columns for CSV like data.
* `amlgrep`   - AWK Multiline Log Grep: AWK wrapper to grep multiline logs.
* `concurrent-events` - Count a 
* `cute`      - CUT Extended. A `cut(1)` like command implemented by awk
* `fancytee`  - Text version of pv with keyword counting (NOTE: it's slow).
* `timediff`  - Calculate time differences for list of datetime data.
* `transpose` - An AWK wrapper to transpose matrix
* `tsd-aggregate - Aggregate (calc. sum and avg.) from time series data.
* `uniqcc` - Similar to Synonymous to 'uniq -c', but counts to the right, commna separated.
* `urldecode` - URL encode.
* `urlencode` - URL decode.


## Systems Operations
* `apt`  - a tiny wrapper for `apt-{get,cache}` to just save key types. (e.g. `apt install PKG` as opposed to `sudo apt-get install PKG`)
* `batch-ssh` - ssh wrapper to enable `-o BatchMode=yes` and other options.
* `sshping`  - Check remote host health: ping, ssh port, ssh login, fs health.
* `tarzcf` - A `tar zxvf DIRNAME.tar.gz DIRNAME` shorthand.

## Other
* `args` - Pretty print arguments of a command. Nice to debug looong Java command line etc.
* `git-add-backup` - Create a local backup repo and a hook to push on every commit.
* `gnuplot-xy-csv` - Draw a graph from 2-column CSV file using gnuplot.
* `now` - realtime clock.

