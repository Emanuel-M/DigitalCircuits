vsim system

add wave *

force global_A(3) 0 0, 1 80 -repeat 160
force global_A(2) 0 0, 1 40 -repeat 80
force global_A(1) 0 0, 1 20 -repeat 40
force global_A(0) 0 0, 1 10 -repeat 20

force global_load 1 0,  0 1 -repeat 10

force K(1) 0 0, 1 160 -repeat 320
force K(0) 0 0, 1 80 -repeat 160

force CLK 1 0, 0 1 -repeat 2 

run 320
