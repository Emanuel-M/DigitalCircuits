-- Total Value Register
-- to work properly, make sure bloco.vhd file is in the current project folder
-- the code receives 4 inputs: a byte (8 bits long) value to store, named received_value;
-- a clear signal (clr); a load signal, which instructs the system to load a new value.
-- The last one is the block clock, to keep flipflop running
-- Watch out! Only clear signal is asynchronous. All other signals wait for clock change.
-- its output is the stored digital information (q_tot).
-- for more info, please go to github.com/mtxslv/DigitalCircuits
-- code by mtxslv

entity tot is 
  port(tot_clk, tot_clr, tot_ld: in bit;
       received_value: in bit_vector(7 downto 0);
       q_tot: out bit_vector(7 downto 0));
end tot;

architecture tot_ckt of tot  is

  component bloco is 
      port(bloco_ld, load, clear,bloco_clk: in bit;
           q_bloco: out bit);
  end component;       
  
  signal q_aux: bit_vector(7 downto 0);
  
begin
  
bloco_0: bloco port map(bloco_ld => tot_ld,
                        load => received_value(0),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(0));

bloco_1: bloco port map(bloco_ld => tot_ld,
                        load => received_value(1),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(1));

bloco_2: bloco port map(bloco_ld => tot_ld,
                        load => received_value(2),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(2));

bloco_3: bloco port map(bloco_ld => tot_ld,
                        load => received_value(3),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(3));

bloco_4: bloco port map(bloco_ld => tot_ld,
                        load => received_value(4),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(4));

bloco_5: bloco port map(bloco_ld => tot_ld,
                        load => received_value(5),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(5));

bloco_6: bloco port map(bloco_ld => tot_ld,
                        load => received_value(6),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(6));

bloco_7:  bloco port map(bloco_ld => tot_ld,
                        load => received_value(7),
                        clear => tot_clr,
                        bloco_clk => tot_clk,
                        q_bloco => q_aux(7));
                         
q_tot(0) <= q_aux(0);                         
q_tot(1) <= q_aux(1);                         
q_tot(2) <= q_aux(2);                         
q_tot(3) <= q_aux(3);                         
q_tot(4) <= q_aux(4);                         
q_tot(5) <= q_aux(5);                         
q_tot(6) <= q_aux(6);                         
q_tot(7) <= q_aux(7);
                        
end tot_ckt;