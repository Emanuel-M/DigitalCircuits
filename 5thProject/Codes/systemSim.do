vsim system

add wave *
 
force input_vector(6) 0 0, 1 640   
force input_vector(5) 0 0, 1 320 -repeat 640    
force input_vector(4) 0 0, 1 160 -repeat 320   
force input_vector(3) 0 0, 1 80 -repeat 160  
force input_vector(2) 0 0, 1 40 -repeat 80 
force input_vector(1) 0 0, 1 20 -repeat 40 
force input_vector(0) 0 0, 1 10 -repeat 20  

run 1290