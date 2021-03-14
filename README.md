#fewliners

Various tiny scripts to help day-to-day CLI life
Most of the scripts have `--help` option


## Scripting
* `cutlink`       - Convert a symlink/hardlink to a real file (by copying it).
* `fancytee`      - Text version of pv with keyword counting (NOTE: it's slow).
* `for-each-line` - Poor person's GNU parallel (an xargs wrapper) (see 'para' also).
* `header`, (`hgrep`, `hsort`)
                  - Run a filter command with keeping a header line in input.
* `map`           - do `for var in value1 value2 ..; do mycmmand $var; done` with less key types.
* `mkoneliner`    - run a Makefile command oneliner.
* `para`          - Bash implementation of commandline parallelizer, like xargs or GNU Parallel.
* `realpath`      - Python implementation of `realpath`. Similar to `readlink -f`.
* `xcat`          - Extended version of zcat - supports `.bz2`, `.xz`, `.lzma` also.
* `zpv`           - `zcat` equivalent of `pv`

## CSV or tabular data Manipuration
* `add`           - Sum/avg/min/max or percentile of columns for CSV like data.
* `bar`           - Bar chart(AWK) from a CSV file
* `concurrent-events`
                  -  Count numbers of concurrent events (transactions-in-flight in a logfile) from timestamp data.
* `csvhist`       - Print a histgram from CSV like data.
* `cute`          - Extended `cut(1)` command with regex and column re-ordering.
* `mjoin`         - join(1) for multiple files.
* `percentile`    - Compute percentile, avg, sigma, total, etc of a CSV file data
* `tsd-aggregate` - deprecated AWK implementation of tsd-resample
* `tsd-resample`  - Resample and aggregate (calculate sum, avg, quantile) from a time series data.
* `transpose`     - An AWK wrapper to transpose a matrix.

## Other Data Manipuration
* `hashuniq`      - A 100x faster alternative for "sort | uniq".
* `jq-grep`       - grep like tool to filter JSON with support for options like --count, --invert-match (wrapper for jq)
* `setop`         - Line wise set operations (union, intersection, diff, super/subset test) for two files
* `timediff`      - Calculate time differences for list of datetime data.
* `urldecode`     - URL encode strings.
* `urlencode`     - URL decode strings.

## Systems Operations
* `batch-ssh`     - ssh wrapper to enable `-o BatchMode=yes` and other options.
* `sshping`       - Check remote host health: ping, ssh port, ssh login, fs health.
* `suf`           - Batch operation to change or remove filename extensions
* `tarzcf`        - A `tar zxvf DIRNAME.tar.gz DIRNAME` shorthand.

## Other
* `args`          - Pretty print arguments of a command. Useful for debugging loooong Java command line etc.
* `now`           - Realtime clock.
* `mov2gif`       - An ffmpeg wrapper to convert a movie file to animation GIF
* `compress-pdf`  - GostScript wrapper to compress raster data in a PDF file
