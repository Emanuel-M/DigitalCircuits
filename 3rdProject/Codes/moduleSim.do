vsim module_entity

add wave *

force A(3) 0 0, 1 80
force A(2) 0 0, 1 40 -repeat 80
force A(1) 0 0, 1 20 -repeat 40
force A(0) 0 0, 1 10 -repeat 20

run 100