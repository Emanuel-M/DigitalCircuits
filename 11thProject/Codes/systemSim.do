vsim system

add wave *


force clk 0 0,1 5, 0 6 -repeat 10 
force clr_aux 0 0, 1 1
force c 1 0, 0 23, 1 26
force S 00000111 0 
force A 00000010 0

run 140