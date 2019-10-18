-- operational block (bloco)
-- to work properly, make sure ffd.vhd and MUX2bits.vhd file ares in the current project folder
-- the code receives four inputs: bloco_ld, load and clear. The last one is the block clock, to keep flipflop running
-- it outputs just one thing: D
-- for more info, please go to github.com/mtxslv/DigitalCircuits
-- code by mtxslv

entity bloco is 
  port(bloco_ld, load, clear,bloco_clk: in bit;
       q_bloco: out bit);
end bloco;

architecture bloco_ckt of bloco is
      
	component MUX2bits is
    port( inputA,inputB,Control: in bit;
          output: out bit);
  end component;
	
	component ffd IS 
	  	port(clk, D, P, C: IN BIT;
		                 q: OUT BIT);
	END  component;
	
	signal mux2ffd, q_aux, not_clear: bit;

begin
  
not_clear <= NOT(clear);

mux: MUX2bits port map(inputA => load,
                       inputB => q_aux,
                       Control => bloco_ld,
                       output => mux2ffd); 
ffd_lbl: ffd port map(clk => bloco_clk,
			                D => mux2ffd,
                 			  P => '1',
                	 		  C => not_clear,
			                q => q_aux);     
q_bloco <= q_aux;
end bloco_ckt;                               