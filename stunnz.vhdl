library ieee;
use ieee.std_logic_1164.all;

entity CCNZ is
	port(
		i  : in   std_logic_vector(7 downto 0);	
		o  : out  std_logic_vector(1 downto 0)
        );
end CCNZ;

architecture comportamento of CCNZ is

begin
	o(1) <= i(7);
	o(0) <= not (i(0) or i(1) or i(2) or i(3) or i(4) or i(5) or i(6) or i(7));
end architecture comportamento;

