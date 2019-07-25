--second circuit 

entity ELEMENT2 is
  port(A,B,C,D: in bit;
  S1,S2: out bit);
end ELEMENT2;

architecture CKT2 of ELEMENT2 is
  signal VAR1: bit;
  signal VAR2: bit;
  signal VAR3: bit;
  signal VAR4: bit;
  begin
    VAR1 <= NOT(B XOR C);
    VAR2 <= A AND VAR1;
    VAR3 <= A XOR B;
    VAR4 <= VAR1 XOR D;
    S1 <= VAR3 AND VAR2;
    S2 <=VAR2 OR VAR4 ;
end CKT2;