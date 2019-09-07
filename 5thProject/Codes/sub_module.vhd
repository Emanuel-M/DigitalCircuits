--sub_module

entity module_entity is
  port(A: in bit_vector(3 downto 0);
    S: out bit_vector(3 downto 0));
    
end module_entity;

architecture module_ckt of module_entity is
  begin
  S(3) <= A(3) OR (A(2) AND A(1)) OR (A(2) AND A(0));    
  S(2) <= (A(0) AND A(3)) OR (A(2) AND NOT(A(1)) AND NOT(A(0)));
  S(1) <= (A(1) AND A(0)) OR (A(1) AND NOT(A(2))) OR (A(3) AND NOT(A(0)));
  S(0) <= (NOT(A(0)) AND A(3)) OR (A(1) AND A(2) AND NOT(A(0))) OR (A(0) AND NOT(A(2)) AND NOT(A(3)));
end module_ckt;  