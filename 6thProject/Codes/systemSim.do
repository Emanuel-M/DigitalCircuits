vsim system

add wave *

force CLK 0 0, 1 10 -repeat 20
force A(3) 0 0, 1 10
force A(2) 0 0, 1 10
force A(1) 0 0, 1 10
force A(0) 0 0, 1 10

run 50