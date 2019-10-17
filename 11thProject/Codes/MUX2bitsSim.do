vsim MUX2bits

add wave *

force Control 0 0, 1 40
force inputA 0 0, 1 20 -repeat 40
force inputB 0 0, 1 10 -repeat 20

run 80