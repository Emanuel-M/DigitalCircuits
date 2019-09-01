-- final system
-- code based on the 3rd project system (bin-bcd converter)
-- for more info, go to github.com/mtxslv/DigitalCircuits

entity system is
  port( input_vector : in bit_vector(6 downto 0);
        HEX0: out bit_vector(3 downto 0);
        HEX1: out bit_vector(3 downto 0);
        HEX2: out bit_vector(3 downto 0));
end system;

architecture system_architecture of system is
  component absComponent is
 	port( input_number: in bit_vector(6 downto 0);
		absolute_value: out bit_vector(6 downto 0));
  end component;
  
  component converter is
    port( SW : in bit_vector(7 downto 0);
           bcd: out bit_vector(11 downto 0) );
  end component;
  
  signal aux_vector: bit_vector(0 to 11);
  signal mediatory_vector: bit_vector(6 downto 0);

begin
  u0: absComponent port map(input_number(6) => input_vector(6),
			    input_number(5) => input_vector(5),
			    input_number(4) => input_vector(4),
			    input_number(3) => input_vector(3),
			    input_number(2) => input_vector(2),
			    input_number(1) => input_vector(1),
			    input_number(0) => input_vector(0),
			    absolute_value(6) => mediatory_vector(6),
			    absolute_value(5) => mediatory_vector(5),
			    absolute_value(4) => mediatory_vector(4),
			    absolute_value(3) => mediatory_vector(3),
			    absolute_value(2) => mediatory_vector(2),
			    absolute_value(1) => mediatory_vector(1),
			    absolute_value(0) => mediatory_vector(0));
  u1: converter port map(SW(0) => mediatory_vector(0),
                         SW(1) => mediatory_vector(1),
                         SW(2) => mediatory_vector(2),
                         SW(3) => mediatory_vector(3),
                         SW(4) => mediatory_vector(4),
                         SW(5) => mediatory_vector(5),
                         SW(6) => mediatory_vector(6),
                         SW(7) => '0',
			 bcd(11) => aux_vector(0),
                         bcd(10) => aux_vector(1),
                         bcd(9) => aux_vector(2),
                         bcd(8) => aux_vector(3),
                         bcd(7) => aux_vector(4),
                         bcd(6) => aux_vector(5),
                         bcd(5) => aux_vector(6),
                         bcd(4) => aux_vector(7),
                         bcd(3) => aux_vector(8),
                         bcd(2) => aux_vector(9),
                         bcd(1) => aux_vector(10),
                         bcd(0) => aux_vector(11));
                      
  HEX2(3) <= aux_vector(0);
  HEX2(2) <= aux_vector(1);
  HEX2(1) <= aux_vector(2);
  HEX2(0) <= aux_vector(3);
  
  HEX1(3) <= aux_vector(4);
  HEX1(2) <= aux_vector(5);
  HEX1(1) <= aux_vector(6);
  HEX1(0) <= aux_vector(7);
  
  HEX0(3) <= aux_vector(8);
  HEX0(2) <= aux_vector(9);
  HEX0(1) <= aux_vector(10);
  HEX0(0) <= aux_vector(11);
                                 
end system_architecture;    