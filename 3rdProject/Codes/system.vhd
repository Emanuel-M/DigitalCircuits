-- final system

entity system is
  port( input_vector : in bit_vector(7 downto 0);
        output_vector: out bit_vector(0 to 11));
end system;

architecture system_architecture of system is
  component display_controller is
    port( S: in bit_vector (3 downto 0);
          D: out bit_vector (0 to 6));
  end component;
  
  component converter is
    port( SW : in bit_vector(7 downto 0);
           bcd: out bit_vector(11 downto 0) );
  end component;
  
  signal aux_vector: bit_vector(0 to 11);
  
begin
  
  u1: converter port map(SW(0) => input_vector(0),
                         SW(1) => input_vector(1),
                         SW(2) => input_vector(2),
                         SW(3) => input_vector(3),
                         SW(4) => input_vector(4),
                         SW(5) => input_vector(5),
                         SW(6) => input_vector(6),
                         SW(7) => input_vector(7),
                         bcd(11) => aux_vector(11),
                         bcd(10) => aux_vector(10),
                         bcd(9) => aux_vector(9),
                         bcd(8) => aux_vector(8),
                         bcd(7) => aux_vector(7),
                         bcd(6) => aux_vector(6),
                         bcd(5) => aux_vector(5),
                         bcd(4) => aux_vector(4),
                         bcd(3) => aux_vector(3),
                         bcd(2) => aux_vector(2),
                         bcd(1) => aux_vector(1),
                         bcd(0) => aux_vector(0));
                         
  hex_2: display_controller port map( S(3) => aux_vector(11),
                                      S(2) => aux_vector(10),
                                      S(1) => aux_vector(9),
                                      S(0) => aux_vector(8));
                                      
  hex_1: display_controller port map( S(3) => aux_vector(7),
                                      S(2) => aux_vector(6),
                                      S(1) => aux_vector(5),
                                      S(0) => aux_vector(4));
                                      
  hex_0: display_controller port map( S(3) => aux_vector(3),
                                      S(2) => aux_vector(2),
                                      S(1) => aux_vector(1),
                                      S(0) => aux_vector(0));
                                      
end system_architecture;     
