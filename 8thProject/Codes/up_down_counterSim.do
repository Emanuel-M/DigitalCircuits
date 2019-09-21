vsim up_down_counter

add wave *

force upper_lim 1101 0, 0000 750
force load 1 0, 0 1
force lower_lim 0101 0, 1111 750
force En 1 0, 0  328, 1 384
force Clr 0 0, 1 484, 0 488
force Clk 1 0, 0 1 -repeat 10 


run 750 