vsim bloco

add wave *

force de 0 0
force dd 1 0
force i 0 0
force bloco_clk 0 0,1 5, 0 6 -repeat 10  

force s(2) 0 0, 1 40 
force s(1) 0 0, 1 20 -repeat 40
force s(0) 0 0, 1 10 -repeat 20

run 60