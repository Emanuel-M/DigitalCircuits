-- bin to bcd converter

entity converter is
   port( SW : in bit_vector(7 downto 0);
         bcd: out bit_vector(11 downto 0) );
end converter;

architecture converter_ckt of converter is
  component module_entity is
    port(A: in bit_vector(3 downto 0);
         S: out bit_vector(3 downto 0));   
  end component;
  
  signal sgn1, sgn2, sgn3, sgn4, sgn5, sgn6, sgn7: bit_vector(3 downto 0);
  
begin 
  lbl_1: module_entity port map( A(3) => '0', A(2) => SW(7), A(1) => SW(6), A(0) => SW(5),
                               S(3) => sgn1(3), S(2) => sgn1(2), S(1) => sgn1(1), S(0) => sgn1(0));
  lbl_2: module_entity port map( A(3) => sgn1(2), A(2) => sgn1(1), A(1) => sgn1(0), A(0) => SW(4),
                               S(3) => sgn2(3), S(2) => sgn2(2), S(1) => sgn2(1), S(0) => sgn2(0));
  lbl_3: module_entity port map( A(3) => sgn2(2), A(2) => sgn2(1), A(1) => sgn2(0), A(0) => SW(3),
                               S(3) => sgn3(3), S(2) => sgn3(2), S(1) => sgn3(1), S(0) => sgn3(0));
  lbl_4: module_entity port map( A(3) => '0',A(2) => sgn1(3), A(1)=> sgn2(3), A(0) => sgn3(3),
                                 S(3) => sgn4(3), S(2) => sgn4(2), S(1) => sgn4(1), S(0) => sgn4(0));
  lbl_5: module_entity port map( A(3) =>  sgn3(2),A(2) => sgn3(1), A(1)=> sgn3(0) ,A(0) => SW(2),
                                 S(3) => sgn5(3), S(2) => sgn5(2), S(1) => sgn5(1), S(0) => sgn5(0));      
  lbl_6: module_entity port map( A(3) => sgn4(2), A(2) => sgn4(1), A(1) => sgn4(0), A(0) => sgn5(3),
                                 S(3) => sgn6(3), S(2) => sgn6(2), S(1) => sgn6(1), S(0) => sgn6(0));      
  lbl_7: module_entity port map( A(3) => sgn5(2), A(2) => sgn5(1), A(1) => sgn5(0), A(0) => SW(1),
                                 S(3) => sgn7(3), S(2) => sgn7(2), S(1) => sgn7(1), S(0) => sgn7(0));    
  
  bcd(11) <= '0';
  bcd(10) <= '0';
  bcd(9) <= sgn4(3);
  bcd(8) <= sgn6(3);
  bcd(7) <= sgn6(2);
  bcd(6) <= sgn6(1);
  bcd(5) <= sgn6(0);
  bcd(4) <= sgn7(3);
  bcd(3) <= sgn7(2);
  bcd(2) <= sgn7(1);
  bcd(1) <= sgn7(0);
  bcd(0) <= SW(0);
end converter_ckt;  