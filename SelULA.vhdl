library ieee;
use ieee.std_logic_1164.all;

entity LULA is
	port(
		i  : in   std_logic_vector(2 downto 0);
		p  : out  std_logic_vector(5 downto 0)
        );
end LULA;

architecture comportamento of LULA is

begin
	p(0) <= not i(0) and not i(1) and not i(2);
	p(1) <= i(0) and not i(1) and not i(2);
	p(2) <= not i(0) and i(1) and not i(2);
	p(3) <= i(0) and i(1) and not i(2);
	p(4) <= not i(0) and  not i(1) and  i(2);
	p(5) <= i(0) and not i(1) and i(2);

end architecture comportamento;

