-- Operacional Block
-- To work correctly, make sure the following files are in the current project folder:  tot.vhd,  bytelesscomparator.vhd, eightbitsummer.vhd .
-- code by mtxslv
-- for more info about the project, go to github.com/mtxslv

entity operationalblock is
    port(S,A: in bit_vector(7 downto 0);
         ld, clr, clk: in bit;
         me: out bit);
end operationalblock; 

architecture operationalblock_ckt of operationalblock is
    
    component bytelesscomparator is
        port( A , B: in bit_vector(7 downto 0);
            	 a_lt_b: out bit);
    end component;
    
    component tot is 
       port(tot_clk, tot_clr, tot_ld: in bit;
            received_value: in bit_vector(7 downto 0);
            q_tot: out bit_vector(7 downto 0));
    end component;
  
    component eightbitsummer is
	      port( inputA, inputB: in bit_vector(7 downto 0);
		          output: out bit_vector(7 downto 0));
    end component;
    
    signal tot_saida, summer_saida: bit_vector(7 downto 0);
    
begin

tot_lbl: tot port map(tot_clk => clk,
                      tot_clr => clr,
                      tot_ld => ld,
                      received_value(7) => summer_saida(7),
                      received_value(6) => summer_saida(6),
                      received_value(5) => summer_saida(5),
                      received_value(4) => summer_saida(4),
                      received_value(3) => summer_saida(3),
                      received_value(2) => summer_saida(2),
                      received_value(1) => summer_saida(1),
                      received_value(0) => summer_saida(0),
                      q_tot(7) => tot_saida(7),
                      q_tot(6) => tot_saida(6),
                      q_tot(5) => tot_saida(5),
                      q_tot(4) => tot_saida(4),
                      q_tot(3) => tot_saida(3),
                      q_tot(2) => tot_saida(2),
                      q_tot(1) => tot_saida(1),
                      q_tot(0) => tot_saida(0));

summer_lbl: eightbitsummer port map(inputA(0) => A(0),
                                    inputA(1) => A(1),
                                    inputA(2) => A(2),
                                    inputA(3) => A(3),
                                    inputA(4) => A(4),
                                    inputA(5) => A(5),
                                    inputA(6) => A(6),
                                    inputA(7) => A(7),
                                    inputB(0) => tot_saida(0),
                                    inputB(1) => tot_saida(1),
                                    inputB(2) => tot_saida(2),
                                    inputB(3) => tot_saida(3),
                                    inputB(4) => tot_saida(4),
                                    inputB(5) => tot_saida(5),
                                    inputB(6) => tot_saida(6),
                                    inputB(7) => tot_saida(7),
                                    output(0) => summer_saida(0),
                                    output(1) => summer_saida(1),
                                    output(2) => summer_saida(2),
                                    output(3) => summer_saida(3),
                                    output(4) => summer_saida(4),
                                    output(5) => summer_saida(5),
                                    output(6) => summer_saida(6),
                                    output(7) => summer_saida(7));
                                    
byteless_lbl: bytelesscomparator port map(A(7) => tot_saida(7),
                                          A(6) => tot_saida(6),
                                          A(5) => tot_saida(5),
                                          A(4) => tot_saida(4),
                                          A(3) => tot_saida(3),
                                          A(2) => tot_saida(2),
                                          A(1) => tot_saida(1),
                                          A(0) => tot_saida(0),
                                          B(7) => S(7),
                                          B(6) => S(6),
                                          B(5) => S(5),
                                          B(4) => S(4),
                                          B(3) => S(3),
                                          B(2) => S(2),
                                          B(1) => S(1),
                                          B(0) => S(0),
                                          a_lt_b => me);                                    
                                    
end operationalblock_ckt; 