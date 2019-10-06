vsim MUX8bits 

add wave *

force in_vector 11111111 0

force s(2) 0 0, 1 40 
force s(1) 0 0, 1 20 -repeat 40
force s(0) 0 0, 1 10 -repeat 20

run 80