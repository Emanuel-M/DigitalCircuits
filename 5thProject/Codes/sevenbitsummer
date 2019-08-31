-- seven bit summer
-- for more info: github.com/mtxslv/DigitalCircuits

entity sevenbitsummer is
	port( inputA, inputB: in bit_vector(6 downto 0);
		output: out bit_vector(6 downto 0));
end sevenbitsummer;

architecture sevenbitsummer_ckt of sevenbitsummer is
	component bitsummer is
		port( A, B, C_in: in bit;
			S,C_out: out bit);
	end component;
	signal C_outAux, SAux: bit_vector(6 downto 0);
begin
-- primeiro, conectar os componentes
 lbl_0: bitsummer port map( A => inputA(0),
			    B => inputB(0),
			    C_in => '0',
			    S => SAux(0),
			    C_out => C_outAux(0));
 lbl_1: bitsummer port map( A => inputA(1),
			    B => inputB(1),
			    C_in => C_outAux(0),
			    S => SAux(1),
			    C_out => C_outAux(1));
 lbl_2: bitsummer port map( A => inputA(2),
			    B => inputB(2),
			    C_in => C_outAux(1),
			    S => SAux(2),
			    C_out => C_outAux(2));
 lbl_3: bitsummer port map( A => inputA(3),
			    B => inputB(3),
			    C_in => C_outAux(2),
			    S => SAux(3),
			    C_out => C_outAux(3));
 lbl_4: bitsummer port map( A => inputA(4),
			    B => inputB(4),
			    C_in => C_outAux(3),
			    S => SAux(4),
			    C_out => C_outAux(4));
 lbl_5: bitsummer port map( A => inputA(5),
			    B => inputB(5),
			    C_in => C_outAux(4),
			    S => SAux(5),
			    C_out => C_outAux(5));
 lbl_6: bitsummer port map( A => inputA(6),
			    B => inputB(6),
			    C_in => C_outAux(5),
			    S => SAux(6),
			    C_out => open);	
 -- por fim, conexão dos sinais de saida com as saídas do módulo					
 output(0) <= SAux(0);						
 output(1) <= SAux(1);						
 output(2) <= SAux(2);						
 output(3) <= SAux(3);						
 output(4) <= SAux(4);						
 output(5) <= SAux(5);				
 output(6) <= SAux(6);	

end sevenbitsummer_ckt;