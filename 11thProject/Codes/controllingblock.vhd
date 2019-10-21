-- Control Block
-- to work properly, make sure ffd.vhd file is in the current project folder
-- the code receives 3 inputs: a signal 'c', indicating a coin was received 
-- and a signal tot_lt_s,instructing the right amount of money was reached.
-- The last one is:
--      the signal d, instructing to release a product.
--      tot_ld: instructing to sum one more monetary unity
--      tot_clr: telling the operational block to clear the register.
-- for more info, please go to github.com/mtxslv/DigitalCircuits
-- code by mtxslv

entity controllingblock is
  port(c, tot_lt_s, clk, aux_clr: in bit;
        d, tot_ld, tot_clr: out bit);
end controllingblock;    


architecture controllingblock_ckt of controllingblock is
  
  component ffd IS 
  	port(clk, D, P, C: IN BIT;
	                 q: OUT BIT);
  END component;
  
  signal s1,s0, n1, n0: bit;

begin
  
  n1 <= (NOT(s1) AND NOT(tot_lt_s) AND s0) OR (NOT(s1) AND c AND s0);
  n0 <= (NOT(s1) AND NOT(c)) OR ( NOT(s0));

  
  ffd1: ffd port map(clk => clk,
                     D => n1,
                     P => '1',
                     C => aux_clr,
                     q => s1);
                     
  ffd0: ffd port map(clk => clk,
                     D => n0,
                     P => '1',
                     C => aux_clr,
                     q => s0);
                     
  d <= s1 AND s0;
  tot_ld <= s1 AND NOT(s0);
  tot_clr  <= NOT(s1) AND NOT(s0);                   
    
end controllingblock_ckt;    