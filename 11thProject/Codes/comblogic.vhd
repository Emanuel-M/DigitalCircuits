-- Combinational Logic


entity comblogic is
 port(c,tot_lt_s, s1, s0: in bit;
      d, tot_ld, tot_clr, n1,n0: out bit);
end comblogic;

architecture comblogic_ckt of comblogic is
begin
  n1 <= (NOT(s1) AND NOT(tot_lt_s) AND s0) OR (NOT(s1) AND c AND s0);
  n0 <= (NOT(s1) AND NOT(c)) OR ( NOT(s0));
  
  d <= s1 AND s0;
  tot_ld <= s1 AND NOT(s0);
  tot_clr  <= NOT(s1) AND NOT(s0); 


end comblogic_ckt;