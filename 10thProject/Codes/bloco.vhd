-- functional block (bloco)
-- In order to work properly, make sure the files are in folder: MUX8bits.vhd and ffd.vhd
-- This block connects a MUX8bits to a D flipflop (ffd). It supports the operations (in order of multiplexing - most to least):
--	Keep the binary information (kp)
--	Load binary information (ld)
--	Shift rightward (shr)
--	Shift leftward (shl)
--	Synchronous setting (set) 
--	Synchronous cleasing (clr)
-- Inputs: s(0, 1 and 2), dd(shr), de (shl) and in.
-- Outputs: q
-- wanna know more? Go to github.com/mtxslv/DigitalCircuits


entity bloco is
	port(s: in bit_vector(2 downto 0);
	     dd,de,i, bloco_clk: in bit;
	     q1: out bit);
end bloco;

architecture bloco_ckt of bloco is

	component MUX8bits is
		port(in_vector: in bit_vector(7 downto 0);
		     s: in bit_vector(2 downto 0);
		     out_bit: out bit);
	end component;
	
	component ffd IS 
	  	port(clk, D, P, C: IN BIT;
		                 q: OUT BIT);
	END  component;
	
	signal mux2ffd, q_aux: bit;

begin

    mux: MUX8bits port map(in_vector(7) => q_aux,
			   in_vector(6) => q_aux,
			   in_vector(5) => q_aux,
			   in_vector(4) => i,
			   in_vector(3) => dd,
			   in_vector(2) => de,
			   in_vector(1) => '1',
			   in_vector(0) => '0',
			   s(2) => s(2),
			   s(1) => s(1),
			   s(0) => s(0),
			   out_bit => mux2ffd);
    ffd_lbl: ffd port map(clk => bloco_clk,
			  D => mux2ffd,
			  P => '1',
			  C => '1',
			  q => q_aux);
end bloco_ckt;