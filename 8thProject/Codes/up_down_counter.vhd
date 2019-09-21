-- up down counter
-- for more info go to github.com/mtxslv
-- in order to work properly, please 
-- make sure equal2input4bit.vhd file is
-- in the folder.
-- coded by Mateus de Assis Silva

entity up_down_counter is
  port(upper_lim, lower_lim: in bit_vector(3 downto 0); -- B = upper_lim , A = lower_lim
        En, Clr, Clk, load: in bit;
        Q: out bit_vector(3 downto 0));
end up_down_counter;    

architecture up_down_counter_ckt of up_down_counter is
  
  component equal2input4bit is
    port( vectorA,vectorB: in bit_vector(3  downto 0);
          equal: out bit);
  end component;
  
  component ffjk IS
    port(clk, J,K,P,C: IN BIT;
                    q: OUT BIT);
  END component;
  
  signal q_aux : bit_vector(3 downto 0);
  signal preset_aux, clear_aux, not_clear_aux, not_preset_aux, M: bit;
  signal ckt01, ckt12, ckt23: bit;
  
  -- in order to make a useful use of lower limit, we'll need to use
  -- parallel load
  signal load_lower_lim, load_clear: bit_vector(3 downto 0);
  -- the usage of parallel load demmands a circuit for clear
  
begin
  
  -- parallel load
  load_lower_lim(3) <= NOT(lower_lim(3) AND load);
  load_lower_lim(2) <= NOT(lower_lim(2) AND load);
  load_lower_lim(1) <= NOT(lower_lim(1) AND load);
  load_lower_lim(0) <= NOT(lower_lim(0) AND load);
  
  --parallel clear
  -- watch out! In order to clear the output of the flipflops, Clr <- 1
  load_clear(3) <= NOT(Clr OR (load_lower_lim(3) AND load));
  load_clear(2) <= NOT(Clr OR (load_lower_lim(2) AND load));
  load_clear(1) <= NOT(Clr OR (load_lower_lim(1) AND load));
  load_clear(0) <= NOT(Clr OR (load_lower_lim(0) AND load));
  
      
  COMP_UPPER: equal2input4bit port map(vectorA(3) => upper_lim(3),
                                       vectorA(2) => upper_lim(2),
                                       vectorA(1) => upper_lim(1),
                                       vectorA(0) => upper_lim(0),
                                       vectorB(3) => q_aux(3),
                                       vectorB(2) => q_aux(2),
                                       vectorB(1) => q_aux(1),
                                       vectorB(0) => q_aux(0),
                                       equal => preset_aux); --comparator of upper limit
                                       
  COMP_LOWER: equal2input4bit port map(vectorA(3) => lower_lim(3),
                                       vectorA(2) => lower_lim(2),
                                       vectorA(1) => lower_lim(1),
                                       vectorA(0) => lower_lim(0),
                                       vectorB(3) => q_aux(3),
                                       vectorB(2) => q_aux(2),
                                       vectorB(1) => q_aux(1),
                                       vectorB(0) => q_aux(0),
                                       equal => clear_aux); --comparator of lower limit
  
  not_clear_aux <= NOT(clear_aux OR Clr); -- we need to define it this way so we can have a globally static expression
  not_preset_aux <= NOT(preset_aux); -- we need to define it this way so we can have a globally static expression
                                       
  COMP_FF: ffjk port map(clk => Clk,
                         J => '0',
                         K => '0',
                         P => not_preset_aux,
                         C => not_clear_aux,
                         q => M); -- the outputs of the comparators go to the jk flip flop
                         
   -- FF00 is the flip flop responsible for Q(0) bit
   FF00: ffjk port map(clk => Clk,
                        J => En,
                        K => En,
                        P => load_lower_lim(0),
                        C => load_clear(0),
                        q => q_aux(0)); -- first jk flipflop 
                                                
    ckt01 <= ((q_aux(0) AND NOT(M)) OR (NOT(q_aux(0)) AND M)) AND En; --circuit between FF0 and FF1                                                  
                           
   -- FF01 is the flip flop responsible for Q(1) bit  
    FF01: ffjk port map(clk => Clk,
                        J => ckt01,
                        K => ckt01,
                        P => load_lower_lim(1),
                        C => load_clear(1),
                        q => q_aux(1)); -- second jk flipflop  
                                                
    ckt12 <= ((q_aux(1) AND (q_aux(0) AND NOT(M))) OR (NOT(q_aux(1)) AND (NOT(q_aux(0)) AND M))) AND En; --circuit between FF0 and FF1                                                  
                           
   -- FF02 is the flip flop responsible for Q(2) bit
    FF02: ffjk port map(clk => Clk,
                        J => ckt12,
                        K => ckt12,
                        P => load_lower_lim(2),
                        C => load_clear(2),
                        q => q_aux(2)); -- third jk flipflop
                        
    ckt23 <= ((q_aux(2) AND (q_aux(1) AND (q_aux(0) AND NOT(M)))) OR (NOT(q_aux(2)) AND NOT(q_aux(1)) AND (NOT(q_aux(0)) AND M))) AND En; --circuit between FF2 and FF3                                     
        
    -- FF03 is the flip flop responsible for Q(3) bit
    FF03: ffjk port map(clk => Clk,
                        J => ckt23,
                        K => ckt23,
                        P => load_lower_lim(3),
                        C => load_clear(3),
                        q => q_aux(3)); -- third jk flipflop    
    Q(3) <= q_aux(3);
    Q(2) <= q_aux(2);
    Q(1) <= q_aux(1);
    Q(0) <= q_aux(0);
                       
end up_down_counter_ckt;  