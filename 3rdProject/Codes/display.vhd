-- converting bcd to hex (display)

entity display_controller is
  port( S: in bit_vector (3 downto 0);
        D: out bit_vector (0 to 6));
end display_controller;


architecture display_controller_ckt of display_controller is
begin 
   D(6) <= S(3) OR (S(1) AND NOT(S(2))) OR (S(1) AND NOT(S(0))) OR (NOT(S(1)) AND S(2));
   D(5) <= (NOT(S(0)) AND NOT(S(1))) OR S(3) OR (NOT(S(1)) AND S(2)) OR (NOT(S(0)) AND NOT(S(3)) AND S(2));
   D(4) <= (NOT(S(1)) AND NOT(S(0)) AND NOT(S(2))) OR (S(1) AND NOT(S(0)) AND NOT(S(3))); 
   D(3) <= S(3) OR (NOT(S(2)) AND NOT(S(0))) OR (S(1) AND S(0) AND NOT(S(2))) OR (S(1) AND NOT(S(0))) OR (NOT(S(1)) AND S(0) AND S(2));
   D(2) <= NOT(S(1)) OR S(0) OR S(2) OR S(3);
   D(1) <= S(3) OR NOT(S(2)) OR (S(1) AND S(0)) OR (NOT(S(1)) AND NOT(S(0)));
   D(0) <= S(1) OR S(3) OR (S(0) AND S(2)) OR (NOT(S(0)) AND NOT(S(2)));
end display_controller_ckt;
