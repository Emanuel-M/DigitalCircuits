-- Byte Less Comparator
-- To work properly, be sure 2bitcomparator.vhd file is in the current project folder.
-- Inputs:
--        A, B: bytes to be compared
-- Output:
--        a_lt_b: if 1, A<B
-- For more information of the project, go to
-- github.com/mtxslv/DigitalCircuits

entity bytelesscomparator is
  port( A , B: in bit_vector(7 downto 0);
        a_lt_b: out bit);
end bytelesscomparator;

architecture bytelesscomparator_ckt of bytelesscomparator is

  component bitcomparator is
	    port( A, B: in bit;
		        a_lt_b, a_eq_b, a_gt_b: out bit);
  end component;       
  
  signal a_gt_b_aux, a_lt_b_aux, a_eq_b_aux: bit_vector(7 downto 0);
  signal aux: bit_vector(6 downto 0);
  
begin
  
  lbl_0: bitcomparator port map(A => A(0),
                                B => B(0),
                                a_lt_b => a_lt_b_aux(0),
                                a_eq_b => a_eq_b_aux(0),
                                a_gt_b => a_gt_b_aux(0)); 
  lbl_1:  bitcomparator port map(A => A(1),
                                B => B(1),
                                a_lt_b => a_lt_b_aux(1),
                                a_eq_b => a_eq_b_aux(1),
                                a_gt_b => a_gt_b_aux(1)); 
  lbl_2:  bitcomparator port map(A => A(2),
                                B => B(2),
                                a_lt_b => a_lt_b_aux(2),
                                a_eq_b => a_eq_b_aux(2),
                                a_gt_b => a_gt_b_aux(2)); 
  lbl_3:  bitcomparator port map(A => A(3),
                                B => B(3),
                                a_lt_b => a_lt_b_aux(3),
                                a_eq_b => a_eq_b_aux(3),
                                a_gt_b => a_gt_b_aux(3)); 
  lbl_4:  bitcomparator port map(A => A(4),
                                B => B(4),
                                a_lt_b => a_lt_b_aux(4),
                                a_eq_b => a_eq_b_aux(4),
                                a_gt_b => a_gt_b_aux(4)); 
  lbl_5:  bitcomparator port map(A => A(5),
                                B => B(5),
                                a_lt_b => a_lt_b_aux(5),
                                a_eq_b => a_eq_b_aux(5),
                                a_gt_b => a_gt_b_aux(5)); 
  lbl_6:  bitcomparator port map(A => A(6),
                                B => B(6),
                                a_lt_b => a_lt_b_aux(6),
                                a_eq_b => a_eq_b_aux(6),
                                a_gt_b => a_gt_b_aux(6)); 
  lbl_7:bitcomparator port map(A => A(7),
                                B => B(7),
                                a_lt_b => a_lt_b_aux(7),
                                a_eq_b => a_eq_b_aux(7),
                                a_gt_b => a_gt_b_aux(7)); 
                                
  aux(6) <= a_eq_b_aux(7) AND a_lt_b_aux(6);  
  aux(5) <= a_eq_b_aux(7) AND a_eq_b_aux(6) AND a_lt_b_aux(5);
  aux(4) <= a_eq_b_aux(7) AND a_eq_b_aux(6) AND a_eq_b_aux(5) AND a_lt_b_aux(4);
  aux(3) <= a_eq_b_aux(7) AND a_eq_b_aux(6) AND a_eq_b_aux(5) AND a_eq_b_aux(4) AND a_lt_b_aux(3) ; 
  aux(2) <= a_eq_b_aux(7) AND a_eq_b_aux(6) AND a_eq_b_aux(5) AND a_eq_b_aux(4) AND a_eq_b_aux(3) AND a_lt_b_aux(2);
  aux(1) <= a_eq_b_aux(7) AND a_eq_b_aux(6) AND a_eq_b_aux(5) AND a_eq_b_aux(4) AND a_eq_b_aux(3) AND a_eq_b_aux(3) AND a_lt_b_aux(1);
  aux(0) <= a_eq_b_aux(7) AND a_eq_b_aux(6) AND a_eq_b_aux(5) AND a_eq_b_aux(4) AND a_eq_b_aux(3) AND a_eq_b_aux(3) AND a_eq_b_aux(1) AND a_lt_b_aux(0); 
  
  a_lt_b <= a_lt_b_aux(7) OR aux(6) OR aux(5) OR aux(4) OR aux(3) OR aux(2) OR aux(1) OR aux(0) ;                       
  
end bytelesscomparator_ckt;                                
