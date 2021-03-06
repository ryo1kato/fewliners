#fewliners

Various tiny scripts to help day-to-day CLI life
Most of the scripts have `--help` option


## Scripting
* `cutlink`  - Convert a symlink/hardlink to a real file (by copying it).
* `for-each-line` - Poor person's GNU parallel.
* `header`, (`hgrep`, `hsort`) - Run a filter command with keeping a header line in input.
* `jq-grep` - grep like tool to filter JSON with support for options like --count, --invert-match (wrapper for jq)
* `map` - do `for var in value1 value2 ..; do mycmmand $var; done` with less key types.
* `mkoneliner` - run a Makefile command oneliner.
* `realpath` - Python implementation of `realpath`. Similar to `readlink -f`.
* `xcat` - Extended version of zcat - supports `.bz2`, `.xz`, `.lzma` also.
* `zpv`  - `zcat` equivalent of `pv`


## Data Manipuration
* `add`       - sum/avg/min/max or percentile of columns for CSV like data.
* `bar`       - bar chart(AWK)
* `concurrent-events` - Count numbers of concurrents in logfile.
* `cute`      - Extended `cut(1)` command with regex and column re-ordering.
* `fancytee`  - Text version of pv with keyword counting (NOTE: it's slow).
* `hashuniq`  - a 100x faster alternative for "sort | uniq".
* `mjoin`     - join(1) for multiple files.
* `timediff`  - Calculate time differences for list of datetime data.
* `transpose` - An AWK wrapper to transpose a matrix.
* `tsd-aggregate` - Aggregate (calc. sum and avg.) from time series data.
* `uniqcc`    - Synonymous to 'uniq -c', but commna separated and number on the right side.
* `urldecode` - URL encode strings.
* `urlencode` - URL decode strings.


## Systems Operations
* `apt`       - a tiny wrapper for `apt-{get,cache}` to just save key types. (e.g. `apt install PKG` as opposed to `sudo apt-get install PKG`)
* `batch-ssh` - ssh wrapper to enable `-o BatchMode=yes` and other options.
* `sshping`   - Check remote host health: ping, ssh port, ssh login, fs health.
* `tarzcf`    - A `tar zxvf DIRNAME.tar.gz DIRNAME` shorthand.


## Other
* `args` - Pretty print arguments of a command. Useful for debugging loooong Java command line etc.
* `git-add-backup` - Create a local backup repo and a hook to push on every commit.
* `gnuplot-xy-csv` - Draw a graph from 2-column CSV file using gnuplot.
* `now` - realtime clock.
