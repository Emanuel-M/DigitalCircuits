vsim absComponent

add wave *
 
force input_number(6) 0 0, 1 640   
force input_number(5) 0 0, 1 320 -repeat 640    
force input_number(4) 0 0, 1 160 -repeat 320   
force input_number(3) 0 0, 1 80 -repeat 160  
force input_number(2) 0 0, 1 40 -repeat 80 
force input_number(1) 0 0, 1 20 -repeat 40 
force input_number(0) 0 0, 1 10 -repeat 20  

run 1290
