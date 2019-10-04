vsim ffd

add wave *

force D 0 0, 1 40 -repeat 80
force P 0 0, 1 20 -repeat 40   
force C 0 0, 1 10 -repeat 20

force clk 1 0, 0 1 -repeat 10  

run 90