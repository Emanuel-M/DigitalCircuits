-- Multiplexer of two bit signal.
-- if Control = 1, inputA goes to output. Else, inputB goes.
-- Based on the scheme presented in VAHID
-- Code by Mateus de Assis Silva
-- For more info, go to github.com/mtxslv/DigitalCircuits

entity MUX2bits is
  port( inputA,inputB,Control: in bit;
        output: out bit);
end MUX2bits;

architecture MUX2bits_ckt of MUX2bits is
begin  
  output <= (inputA AND Control)OR(inputB AND NOT(Control));
end MUX2bits_ckt;   