-- Two bit comparator
-- Inputs:
--        A, B: bits to be compared
-- Output:
--        a_lt_b: if 1, A<B
--        a_eq_b: if 1, A=B
--        a_gt_b: if 1, A>B
-- code by mtxslv, based on the circuit:
-- <https://www.electronics-tutorials.ws/combination/comb_8.html>
-- For more information of the project, go to
-- github.com/mtxslv/DigitalCircuits

entity bitcomparator is
	port( A, B: in bit;
		    a_lt_b, a_eq_b, a_gt_b: out bit);
end bitcomparator;

architecture bitcomparator_ckt of bitcomparator is
begin 
  a_lt_b <= NOT(A) AND B;
  a_eq_b <= NOT(A XOR B);
  a_gt_b <= A AND NOT(B);
end bitcomparator_ckt;  