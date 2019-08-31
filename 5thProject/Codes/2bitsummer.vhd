-- 2 bit summer
-- based on my early project
-- for more info, please go to github.com/mtxslv/DigitalCircuits
-- the code receives three inputs: C_in, A and B
-- it outputs two things: C_out and S.

entity bitsummer is
	port( A, B, C_in: in bit;
		S,C_out: out bit);
end bitsummer;

architecture bitsummer_ckt of bitsummer is
begin
	S <= (NOT(A) AND NOT(B) AND C_in) OR (NOT(A) AND B AND NOT(C_in)) OR (A AND B AND C_in) OR (A AND NOT(B) AND NOT(C_in));
	C_out <= (A AND B) OR (B AND C_in) OR (A AND C_in);
end bitsummer_ckt;	
