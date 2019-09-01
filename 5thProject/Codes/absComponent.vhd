-- abs file
-- this script get a 7 bits binary number and returns its absolute value (magnitude)
-- for more info, please go to github.com/mtxslv/DigitalCircuits


entity absComponent is
 	port( input_number: in bit_vector(6 downto 0);
		absolute_value: out bit_vector(6 downto 0));
end absComponent;

architecture absComponent_ckt of absComponent is
	component sevenbitMUX is
		port( vector_A, vector_B: in bit_vector(6 downto 0);
		      ControlBit: in bit;	
  		      output_vector: out bit_vector(6 downto 0));
	end component;

	component sevenbitsummer is
		port( inputA, inputB: in bit_vector(6 downto 0);
		      output: out bit_vector(6 downto 0));
	end component;

	component inversor is
  		port( original_vector: in bit_vector(6 downto 0);
        	      inverted_vector: out bit_vector(6 downto 0));
	end component;

	signal sgn_Inverted, sgn_Summed, sgn_A2: bit_vector(6 downto 0);
begin

-- first thing to do is to apply A1 complement (sgnInverted)

lbl_Inverted: inversor port map(original_vector(6) => input_number(6),
				original_vector(5) => input_number(5),
				original_vector(4) => input_number(4),
				original_vector(3) => input_number(3),
				original_vector(2) => input_number(2),
				original_vector(1) => input_number(1),
				original_vector(0) => input_number(0),
				inverted_vector(6) => sgn_Inverted(6),
				inverted_vector(5) => sgn_Inverted(5),
				inverted_vector(4) => sgn_Inverted(4),
				inverted_vector(3) => sgn_Inverted(3),
				inverted_vector(2) => sgn_Inverted(2),
				inverted_vector(1) => sgn_Inverted(1),
				inverted_vector(0) => sgn_Inverted(0));

-- now, we will finish the A2 complement summing 0000001 to sgn_Inverted

lbl_Summed: sevenbitsummer port map(inputA(6) => sgn_Inverted(6),
				    inputA(5) => sgn_Inverted(5),
				    inputA(4) => sgn_Inverted(4),
				    inputA(3) => sgn_Inverted(3),
				    inputA(2) => sgn_Inverted(2),
				    inputA(1) => sgn_Inverted(1),
				    inputA(0) => sgn_Inverted(0),
				    inputB(6) => '0',
				    inputB(5) => '0',
				    inputB(4) => '0',
				    inputB(3) => '0',
				    inputB(2) => '0',
				    inputB(1) => '0',
				    inputB(0) => '1',
				    output(6) => sgn_Summed(6),
				    output(5) => sgn_Summed(5),
				    output(4) => sgn_Summed(4),
				    output(3) => sgn_Summed(3),
				    output(2) => sgn_Summed(2),
				    output(1) => sgn_Summed(1),
				    output(0) => sgn_Summed(0));

-- Now, we gonna put sgn_Summed alongside input, in MUX7.
-- Remember that, if ControlBit == 1, vector_A goes to output. So, vector_A => sgn_Summed.
lbl_MUX: sevenbitMUX port map(ControlBit => input_number(6),
			      vector_A(6) => sgn_Summed(6),
			      vector_A(5) => sgn_Summed(5),
			      vector_A(4) => sgn_Summed(4),
			      vector_A(3) => sgn_Summed(3),
			      vector_A(2) => sgn_Summed(2),
			      vector_A(1) => sgn_Summed(1),
			      vector_A(0) => sgn_Summed(0),
			      vector_B(6) => input_number(6),
			      vector_B(5) => input_number(5),
			      vector_B(4) => input_number(4),
			      vector_B(3) => input_number(3),
			      vector_B(2) => input_number(2),
			      vector_B(1) => input_number(1),  
			      vector_B(0) => input_number(0), 
			      output_vector(6) => sgn_A2(6), 
			      output_vector(5) => sgn_A2(5), 
			      output_vector(4) => sgn_A2(4), 
			      output_vector(3) => sgn_A2(3), 
			      output_vector(2) => sgn_A2(2), 
			      output_vector(1) => sgn_A2(1), 
			      output_vector(0) => sgn_A2(0));

-- Now, we just need to absolute_value <= sgn_A2
absolute_value(6) <= sgn_A2(6);
absolute_value(5) <= sgn_A2(5);
absolute_value(4) <= sgn_A2(4);
absolute_value(3) <= sgn_A2(3);
absolute_value(2) <= sgn_A2(2);
absolute_value(1) <= sgn_A2(1);
absolute_value(0) <= sgn_A2(0);


end absComponent_ckt;