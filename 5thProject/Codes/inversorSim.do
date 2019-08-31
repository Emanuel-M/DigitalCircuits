vsim inversor

add wave *

force original_vector(6) 0 0, 1 640
force original_vector(5) 0 0, 1 320 -repeat 640
force original_vector(4) 0 0, 1 160 -repeat 320
force original_vector(3) 0 0, 1 80 -repeat 160
force original_vector(2) 0 0, 1 40 -repeat 80
force original_vector(1) 0 0, 1 20 -repeat 40
force original_vector(0) 0 0, 1 10  -repeat 20

run 650