vsim Y

add wave *

force A(3) 0 0, 1 80 -repeat 160
force A(2) 0 0, 1 40 -repeat 80
force A(1) 0 0, 1 20 -repeat 40
force A(0) 0 0, 1 10 -repeat 20

force load 1 0,  0 1 -repeat 10
force clear 0 0, 1 80 -repeat 160
force clock 1 0, 0 1 -repeat 2 

run 160
