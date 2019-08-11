vsim display_controller

add wave *

force S(3) 0 0, 1 80
force S(2) 0 0, 1 40 -repeat 80
force S(1) 0 0, 1 20 -repeat 40
force S(0) 0 0, 1 10 -repeat 20

run 100