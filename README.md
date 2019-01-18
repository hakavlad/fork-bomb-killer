# fork-bomb-killer
A daemon for Linux that detects and safely neutralises simple fork bombs.

## Download
```bash
$ git clone https://github.com/hakavlad/fork-bomb-killer.git
$ cd fork-bomb-killer
```

## Run
```
$ sudo nice -n -20 ./fork-bomb-killer
```

## Output

like follow:

```
Fork bomb detecting started!
Fork bomb detected! Spawned 10548 processess in 5 seconds
Find name of bomb processes
[('bash', 10478)]
Time: 0.791
Send SIGSTOP to bomb processes: bash
Total stop time: 1.729
Analyze stopped processes...
Find bomb cmdline
[('bash', 6404), ('/bin/bash', 1)]
0.5072736740112305
Find bomb eUID
[('1000', 6405)]
0.5482015609741211
Find bomb PPid
Number of unique PPids: 56
[('1', 6347), ('6387', 2), ('5481', 2), ('1787', 2), ('11193', 1), ('10781', 1), ('11235', 1), ('11245', 1), ('11741', 1)]
0.5469646453857422
Analysis complete. It's time to kill!
Send SIGKILL to stopped processes
Number of killed processes: 6404 
Kill time: 1.172
Send SIGCONT to innocent victims
  1864 bash ['/bin/bash']
Number of continued: 1
Fork bomb is deactivated in 5.313 seconds 
  Bomb name:    bash 
  Bomb cmdline: bash 
  Bomb eUID:    1000 
  Bomb PPid:    1 
 ==============================================================================
```

## Side effect

Temporary stopping of processes whose names coincide with the names of the processes of the bomb during the neutralisation of the fork bomb.

