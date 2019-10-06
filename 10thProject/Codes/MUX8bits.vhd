-- MUX 8x1 
-- For more information, go to github.com/mtxslv/DigitalCircuits
-- Code by Mateus de Assis Silva

entity MUX8bits is
	port(in_vector: in bit_vector(7 downto 0);
	     s: in bit_vector(2 downto 0);
	     out_bit: out bit);
end MUX8bits;

architecture MUX8bits_ckt of MUX8bits is
begin
	out_bit <= ( NOT(s(2)) AND NOT(s(1)) AND NOT(s(0)) AND in_vector(0) ) OR
		   ( NOT(s(2)) AND NOT(s(1)) AND s(0) AND in_vector(1) ) OR
		   ( NOT(s(2)) AND s(1) AND NOT(s(0)) AND in_vector(2) ) OR
		   ( NOT(s(2)) AND s(1) AND s(0) AND in_vector(3) ) OR
		   ( s(2) AND NOT(s(1)) AND NOT(s(0)) AND in_vector(4) ) OR
		   ( s(2) AND NOT(s(1)) AND s(0) AND in_vector(5) ) OR
		   ( s(2) AND s(1) AND NOT(s(0)) AND in_vector(6) ) OR
		   ( s(2) AND s(1) AND s(0) AND in_vector(7) );
end MUX8bits_ckt;
