-- Comparer for 4-bit equality
-- For more info, go to github.com/mtxslv/DigitalCircuits
-- If the vector inputs are equal, the output goes to 1.
-- In order to work properly, make sure equal2input.vhd file is in the folder.
-- Coded by Mateus de Assis. 

entity equal2input4bit is
  port( vectorA,vectorB: in bit_vector(3  downto 0);
        equal: out bit);
end equal2input4bit;

architecture equal2input4bit_ckt of equal2input4bit is
  component equal2input is
    port( inputA,inputB: in bit;
          output: out bit);
  end component;
  
  signal aux : bit_vector(3 downto 0);
begin  
  lbl_3: equal2input port map(inputA =>vectorA(3),
                                  inputB =>vectorB(3),  
                                  output => aux(3));
  lbl_2: equal2input port map(inputA =>vectorA(2),
                                  inputB =>vectorB(2),  
                                  output => aux(2));
  lbl_1: equal2input port map(inputA =>vectorA(1),
                                  inputB =>vectorB(1),  
                                  output => aux(1));
  lbl_0:  equal2input port map(inputA =>vectorA(0),
                                  inputB => vectorB(0),  
                                  output => aux(0));
  equal <= aux(3) AND aux(2) AND aux(1) AND aux(0);                                
end equal2input4bit_ckt;                                