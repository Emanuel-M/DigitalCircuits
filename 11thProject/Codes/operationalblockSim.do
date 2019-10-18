vsim operationalblock

add wave *

force clk 0 0,1 5, 0 6 -repeat 10 
force S 00000111 0
force A 00000010 0
force ld 1 0, 0 23, 1 26
force clr 1 33, 0 38

run 80