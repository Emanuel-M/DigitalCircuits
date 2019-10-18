vsim bloco

add wave *

force load 1 0, 0 21, 1 29
force clear 1 0, 0 7, 1 40
force bloco_ld 0 0, 1 8, 0 9, 1 14, 0 17, 1 24, 0 27, 1 34, 0 37
force bloco_clk 0 0,1 5, 0 6 -repeat 10  

run 50
