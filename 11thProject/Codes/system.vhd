-- system
-- To work properly, make sure controllingblock.vhd, operationalblock.vhd
-- files are in the current project.

entity system is
  port(c, clr_aux, clk: in bit;
       S, A: in bit_vector(7 downto 0);
       d: out bit);
end system;

architecture system_ckt of system is

  component controllingblock is
    port(c, tot_lt_s, clk, aux_clr: in bit;
         d, tot_ld, tot_clr: out bit);
  end component; 
  
  component operationalblock is
      port(S,A: in bit_vector(7 downto 0);
           ld, clr, clk: in bit;
           me: out bit);
  end component;
  signal ME,LD,CL, d_aux: bit;
begin
  
  operational_lbl: operationalblock port map(S(7) => S(7),
                                             S(6) => S(6),
                                             S(5) => S(5),
                                             S(4) => S(4),
                                             S(3) => S(3),
                                             S(2) => S(2),
                                             S(1) => S(1),
                                             S(0) => S(0),
                                             A(7) => A(7),
                                             A(6) => A(6),
                                             A(5) => A(5),
                                             A(4) => A(4),
                                             A(3) => A(3),
                                             A(2) => A(2),
                                             A(1) => A(1),
                                             A(0) => A(0),
                                             ld => LD,
                                             clr => CL,
                                             clk => clk,
                                             me => ME);
  controlling_lbl: controllingblock port map(c => c,
                                             tot_lt_s => ME,
                                             clk => clk,
                                             aux_clr => clr_aux,
                                             d => d_aux,
                                             tot_ld => LD,
                                             tot_clr => CL);
 d<=d_aux;                                            

end system_ckt;  
