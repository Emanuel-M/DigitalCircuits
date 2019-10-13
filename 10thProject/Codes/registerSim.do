vsim register_custom

add wave *

force shl_in 0 0
force shr_in 1 0
force I 2#0101 0, 2#0110  7

force clk 1 0, 0 1 -repeat 5  

force kp  0 0, 1 7, 0 12 
force ld  1 0, 1 7, 0 17
force shr 0 0, 1 7, 0 27   
force shl 0 0, 1 7, 0 37  
force set 0 0, 1 7, 0 47  
force clr 0 0, 1 7 


run 60
