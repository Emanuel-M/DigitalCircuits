vsim ffjk

add wave *

force P 0 0, 1 80 -repeat 160
force C 0 0, 1 40 -repeat 80
force J 0 0, 1 20 -repeat 40
force K 0 0, 1 10 -repeat 20
force clk 1 0, 0 1 -repeat 10  

run 170
