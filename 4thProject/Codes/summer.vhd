-- simulation of the circuit
-- complete summer of two bits
-- Code by Mateus de Assis Silva
-- for more info, please go to github.com/mtxslv/DigitalCircuits

entity summer is
  port(A,B,C_in: in bit;
       S, C_out: out bit);
end summer;

architecture summer_ckt of summer is
  signal S1, S2, S3, S4, S5, S6, S7: bit;
begin
  S1 <= A NAND B;
  S2 <= S1 NAND A;
  S3 <= S1 NAND B;
  S4 <= S2 NAND S3;
  S5 <= S4 NAND C_in;
  S6 <= S4 NAND S5;
  S7 <= S5 NAND C_in;
  S <= S6 NAND S7;
  C_out <= S1 NAND S5;
end summer_ckt;  