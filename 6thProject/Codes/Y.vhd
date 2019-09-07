-- Serial Comunication System: Sender Module
-- For more info, see github.com/mtxslv/DigitalCircuits
-- This file needs ffd.vhd in order to work properly

entity Y is
  port( A: in bit_vector(3 downto 0);
        clock, clear: in bit;
        q_output: out bit);
end Y;

architecture Y_ckt of Y is
  component ffd IS 
  	port(clk, D, P, C: IN BIT;
	                 q: OUT BIT);
  END component;        
  
  signal signal_3, signal_2, signal_1, signal_0: bit;
  
begin

  -- watch out! In order to clear, or to preset, send 0 to the flip flop!
  
  lbl_3: ffd port map( clk => clock,
                       D => '0',
                       P => A(3),
                       C => clear,
                       q => signal_3);
  lbl_2: ffd port map( clk => clock,
                       D => signal_3,
                       P => A(2),
                       C => clear,
                       q => signal_2);
  lbl_1: ffd port map( clk => clock,
                       D => signal_2,
                       P => A(1),
                       C => clear,
                       q => signal_1); 
  lbl_0: ffd port map( clk => clock,
                       D => signal_1,
                       P => A(0),
                       C => clear,
                       q => signal_0);  
   q_output <= signal_0;
end Y_ckt;    