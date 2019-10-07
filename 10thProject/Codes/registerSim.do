vsim register_custom

add wave *

force shl_in 0 0
force shr_in 1 0
force I 0101 0
force clk 1 0, 0 1 -repeat 5  

force kp  0 0, 1 32, 0 33
force ld  0 0, 1 25, 0 31 
force shr 0 0, 0 0
force shl 0 0, 0 0, 1 33
force set 1 0, 0 11, 1 21, 0 22
force clr 0 0, 1 11, 0 21


run 60
