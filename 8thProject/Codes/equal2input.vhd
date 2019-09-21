-- Comparer for 2 bit equality
-- if two 1bit inputs are equal, the output goes to 1.
-- Coded by Mateus de Assis. For more info, go to github.com/mtxslv/DigitalCircuits

entity equal2input is
  port( inputA,inputB: in bit;
        output: out bit);
end equal2input;

architecture equal2input_ckt of equal2input is
begin  
  output <= (inputA AND inputB)OR(NOT(inputA) AND NOT(inputB));
end equal2input_ckt;   