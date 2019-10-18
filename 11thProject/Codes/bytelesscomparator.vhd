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
  
  signal aux: bit_vector(7 downto 0);
  
begin
  
  lbl_0: bitcomparator port map(A => A(0),
                                B => B(0),
                                a_lt_b => aux(0),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_1:  bitcomparator port map(A => A(1),
                                B => B(1),
                                a_lt_b => aux(1),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_2:  bitcomparator port map(A => A(2),
                                B => B(2),
                                a_lt_b => aux(2),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_3:  bitcomparator port map(A => A(3),
                                B => B(3),
                                a_lt_b => aux(3),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_4:  bitcomparator port map(A => A(4),
                                B => B(4),
                                a_lt_b => aux(4),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_5:  bitcomparator port map(A => A(5),
                                B => B(5),
                                a_lt_b => aux(5),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_6:  bitcomparator port map(A => A(6),
                                B => B(6),
                                a_lt_b => aux(6),
                                a_eq_b => open,
                                a_gt_b => open); 
  lbl_7:bitcomparator port map(A => A(7),
                                B => B(7),
                                a_lt_b => aux(7),
                                a_eq_b => open,
                                a_gt_b => open); 
                                
  a_lt_b <= aux(0) AND aux(1) AND aux(2) AND aux(3) AND aux(4) AND aux(5) AND aux(6)AND aux(7);  
  
end bytelesscomparator_ckt;                                