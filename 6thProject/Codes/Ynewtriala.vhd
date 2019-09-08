-- Serial Comunication System: Sender Module
-- For more info, see github.com/mtxslv/DigitalCircuits
-- This file needs ffd.vhd in order to work properly

entity Y is
  port( A: in bit_vector(3 downto 0);
        clock, clear, load: in bit;
        q_output: out bit);
end Y;

architecture Y_ckt of Y is
  component ffd IS 
  	port(clk, D, P, C: IN BIT;
	                 q: OUT BIT);
  END component;        
  
  signal signal_3, signal_2, signal_1, signal_0, in_3, in_2, in_1, in_0, clear_3, clear_2, clear_1, clear_0: bit;
  
begin


  -- watch out! In order to clear, or to preset, send 0 to the flip flop!
  in_3 <= NOT(A(3) AND load);
  in_2 <= NOT(A(2) AND load);
  in_1 <= NOT(A(1) AND load);
  in_0 <= NOT(A(0) AND load);

  clear_3 <= NOT(in_3 AND load);
  clear_2 <= NOT(in_2 AND load);
  clear_1 <= NOT(in_1 AND load);
  clear_0 <= NOT(in_0 AND load);

  lbl_3: ffd port map( clk => clock,
                       D => '0',
                       P => in_3,
                       C => clear_3,
                       q => signal_3);
  lbl_2: ffd port map( clk => clock,
                       D => signal_3,
                       P => in_2,
                       C => clear_2,
                       q => signal_2);
  lbl_1: ffd port map( clk => clock,
                       D => signal_2,
                       P => in_1,
                       C => clear_1,
                       q => signal_1); 
  lbl_0: ffd port map( clk => clock,
                       D => signal_1,
                       P => in_0,
                       C => clear_0,
                       q => signal_0);  
   q_output <= signal_0;
end Y_ckt;    	
