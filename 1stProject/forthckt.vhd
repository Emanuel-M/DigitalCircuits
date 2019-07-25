-- forth example

entity ELEMENT4 is
    port(A,B,C,D: in bit;
        S1,S2: out bit);
end ELEMENT4;

architecture CKT4 of ELEMENT4 is
    signal VAR1: bit;
    signal VAR2: bit;
    signal VAR3: bit;
    signal VAR4: bit;
    begin
	VAR1 <= B OR C;
	VAR2 <= VAR1 OR D;
	VAR3 <= D XOR C;
	VAR4 <= A XOR VAR1;
	S1 <= NOT(VAR3 XOR VAR2);
	S2 <= VAR4 OR VAR2;
end CKT4;