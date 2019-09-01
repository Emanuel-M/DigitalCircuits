-- multiplexer for two seven-bit
-- for more info, go to github.com/mtxslv/DigitalCircuits
-- if ControlBit = 1, vector_A goes to output. Else, vector_B goes.

entity sevenbitMUX is
	port( vector_A, vector_B: in bit_vector(6 downto 0);
	      ControlBit: in bit;	
		output_vector: out bit_vector(6 downto 0));
end sevenbitMUX;

architecture sevenbitMUX_ckt of sevenbitMUX is
	component  MUX2bits is
  		port( inputA,inputB,Control: in bit;
        		output: out bit);
	end component;
	signal SAux: bit_vector(6 downto 0);
begin
-- first, let's multiplex each bit-pair
lbl_0: MUX2bits port map(inputA => vector_A(0),
			 inputB => vector_B(0),
			 Control => ControlBit,
			 output => SAux(0)); 
lbl_1: MUX2bits port map(inputA => vector_A(1),
			 inputB => vector_B(1),
			 Control => ControlBit,
			 output => SAux(1)); 
lbl_2: MUX2bits port map(inputA => vector_A(2),
			 inputB => vector_B(2),
			 Control => ControlBit,
			 output => SAux(2)); 
lbl_3: MUX2bits port map(inputA => vector_A(3),
			 inputB => vector_B(3),
			 Control => ControlBit,
			 output => SAux(3)); 
lbl_4: MUX2bits port map(inputA => vector_A(4),
			 inputB => vector_B(4),
			 Control => ControlBit,
			 output => SAux(4)); 
lbl_5: MUX2bits port map(inputA => vector_A(5),
			 inputB => vector_B(5),
			 Control => ControlBit,
			 output => SAux(5)); 
lbl_6: MUX2bits port map(inputA => vector_A(6),
			 inputB => vector_B(6),
			 Control => ControlBit,
			 output => SAux(6)); 

-- now we gonna put the aux signals into the actual outputs.

output_vector(0) <= SAux(0);
output_vector(1) <= SAux(1);
output_vector(2) <= SAux(2);
output_vector(3) <= SAux(3);
output_vector(4) <= SAux(4);
output_vector(5) <= SAux(5);
output_vector(6) <= SAux(6);

end sevenbitMUX_ckt;