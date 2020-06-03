library ieee;
use ieee.std_logic_1164.all;

entity blockeio is
	port(
		i  : in   std_logic_vector(7 downto 0);
		s_block: in std_logic;
		o  : out  std_logic_vector(7 downto 0)
        );
end blockeio;

architecture comportamento of blockeio is

begin
	o <= i when s_block = '1' else (others => 'Z');

end architecture comportamento;

