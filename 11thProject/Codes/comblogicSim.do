vsim comblogic

add wave *

force s1 0 0, 1 80 
force s0 0 0, 1 40 -repeat 80
force c 0 0, 1 20 -repeat 40
force tot_lt_s 0 0, 1 10 -repeat 20

run 160