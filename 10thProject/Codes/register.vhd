-- 6 function register
-- This register must has 6 functions, in priority order (most to least):
--	Keep the binary information (kp)
--	Load binary information (ld)
--	Shift rightward (shr)
--	Shift leftward (shl)
--	Synchronous setting (set) 
--	Synchronous cleasing (clr)
-- In order to work properly, make sure the files are in folder: MUX8bits.vhd and ffd.vhd
-- wanna know more? Go to github.com/mtxslv/DigitalCircuits
	
entity register_custom is
	port(I: in bit_vector(3 downto 0);
	     kp, ld, shr, shl, set, clr: in bit;
	     S: out bit_vector(3 downto 0));
end register_custom;

architecture register_custom_ckt of register_custom is 
begin
end register_custom_ckt ;