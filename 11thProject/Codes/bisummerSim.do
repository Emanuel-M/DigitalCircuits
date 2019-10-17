vsim bitsummer

add wave *
force C_in 0 0, 1 40
force A 0 0, 1 20 -repeat 40
force B 0 0, 1 10 -repeat 20

run 80