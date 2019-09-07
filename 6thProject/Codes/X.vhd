-- Serial Comunication System: Receiver Module
-- For more info, see github.com/mtxslv/DigitalCircuits
-- This file needs ffd.vhd in order to work properly

entity X is
  port( Z: out bit_vector(3 downto 0);
        clock, clear: in bit;
        q_input: in bit);
end X;

architecture X_ckt of X is
  component ffd IS 
  	port(clk, D, P, C: IN BIT;
	                 q: OUT BIT);
  END component;        
  
  signal signal_3, signal_2, signal_1, signal_0: bit;
  
begin

  -- watch out! In order to clear, or to preset, send 0 to the flip flop!
 
  lbl_3: ffd port map( clk => clock,
                       D => q_input,
                       P => '1',
                       C => clear,
                       q => signal_3);
  lbl_2: ffd port map( clk => clock,
                       D => signal_3,
                       P => '1',
                       C => clear,
                       q => signal_2);
  lbl_1: ffd port map( clk => clock,
                       D => signal_2,
                       P => '1',
                       C => clear,
                       q => signal_1); 
  lbl_0: ffd port map( clk => clock,
                       D => signal_1,
                       P => '1',
                       C => clear,
                       q => signal_0);  
Z(3) <= signal_3;  
Z(2) <= signal_2;  
Z(1) <= signal_1;  
Z(0) <= signal_0;

end X_ckt;    