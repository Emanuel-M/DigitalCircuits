--inversor module
-- for more information, please access github.com/mtxslv/DigitalCircuits

entity inversor is
  port( original_vector: in bit_vector(6 downto 0);
        inverted_vector: out bit_vector(6 downto 0));
end inversor;

architecture inversor_ckt of inversor is

begin
  inverted_vector(0) <= NOT(original_vector(0));
  inverted_vector(1) <= NOT(original_vector(1));
  inverted_vector(2) <= NOT(original_vector(2));
  inverted_vector(3) <= NOT(original_vector(3));
  inverted_vector(4) <= NOT(original_vector(4));
  inverted_vector(5) <= NOT(original_vector(5));
  inverted_vector(6) <= NOT(original_vector(6));
end inversor_ckt;