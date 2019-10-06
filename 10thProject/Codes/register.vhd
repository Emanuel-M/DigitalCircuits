-- 6 function register
-- This register must has 6 functions, in priority order (most to least):
--	Keep the binary information (kp)
--	Load binary information (ld)
--	Shift rightward (shr)
--	Shift leftward (shl)
--	Synchronous setting (set) 
--	Synchronous cleasing (clr)
-- In order to work properly, make sure the file are in folder: bloco.vhd
-- wanna know more? Go to github.com/mtxslv/DigitalCircuits
	
entity register_custom is
	port(I: in bit_vector(3 downto 0);
	     kp, ld, shr, shl, set, clr, shr_in, shl_in, clk: in bit;
	     saida: out bit_vector(3 downto 0));
end register_custom;

architecture register_custom_ckt of register_custom is 

	signal saida_aux: bit_vector(3 downto 0);
	signal shift_aux: bit_vector(2 downto 0);

	component bloco is
		port(s: in bit_vector(2 downto 0);
		     dd,de,i, bloco_clk: in bit;
		     q_bloco: out bit);
	end component;

BEGIN

shift_aux(2) <=( ld AND NOT(kp) )OR kp; 
shift_aux(1) <=( NOT(kp) AND NOT(ld) AND NOT(shr) AND shl )OR( NOT(kp) AND NOT(ld) AND shr); 
shift_aux(0) <= ( NOT(kp) AND NOT(ld) AND NOT(shr) AND NOT(shl) AND set )OR( NOT(kp) AND NOT(ld) AND shr) OR kp; 


bloco0: bloco port map (dd => shl_in,
			de => saida_aux(1),
			i => I(0),
			bloco_clk => clk,
			s(2) => shift_aux(2),
			s(1) => shift_aux(1),
			s(0) => shift_aux(0),
			q_bloco => saida_aux(0));

bloco1: bloco port map (dd => saida_aux(0),
			de => saida_aux(2),
			i => I(1),
			bloco_clk => clk,
			s(2) => shift_aux(2),
			s(1) => shift_aux(1),
			s(0) => shift_aux(0),
			q_bloco => saida_aux(1));

bloco2: bloco port map (dd => saida_aux(1),
			de => saida_aux(3),
			i => I(2),
			bloco_clk => clk,
			s(2) => shift_aux(2),
			s(1) => shift_aux(1),
			s(0) => shift_aux(0),
			q_bloco => saida_aux(2));

bloco3: bloco port map (dd => saida_aux(2),
			de => shr_in,
			i => I(3),
			bloco_clk => clk,
			s(2) => shift_aux(2),
			s(1) => shift_aux(1),
			s(0) => shift_aux(0),
			q_bloco => saida_aux(3));

saida(3) <= saida_aux(3);
saida(2) <= saida_aux(2);
saida(1) <= saida_aux(1);
saida(0) <= saida_aux(0);

end register_custom_ckt ;
