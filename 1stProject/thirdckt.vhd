
-- third circuit

entity ELEMENT3 is
    port(A,B,C,D: in bit;
         S1,S2: out bit);
end ELEMENT3;

architecture CKT3 of ELEMENT3 is
    signal VAR1: bit;
    signal VAR2: bit;
    signal VAR3: bit;
    signal VAR4: bit;
    begin
	VAR1 <= B AND C;
	VAR2 <= VAR1 AND D;
	VAR3 <= D OR C;
	VAR4 <= A OR VAR1;
	S1 <= NOT(VAR3 XOR VAR2);
	S2 <= VAR4 OR VAR2;
end CKT3;