library ieee;
use ieee.std_logic_1164.all;

entity mux8b is
	port(
		i0  : in   std_logic_vector(7 downto 0);
        i1  : in   std_logic_vector(7 downto 0);
        sel : in   std_logic;
		o   : out  std_logic_vector(7 downto 0)
        );
end mux8b;

architecture comportamento of mux8b is

begin
	o(0) <= (sel and i1(0)) or ((not sel) and i0(0));
	o(1) <= (sel and i1(1)) or ((not sel) and i0(1));
	o(2) <= (sel and i1(2)) or ((not sel) and i0(2));
	o(3) <= (sel and i1(3)) or ((not sel) and i0(3));
	o(4) <= (sel and i1(4)) or ((not sel) and i0(4));
	o(5) <= (sel and i1(5)) or ((not sel) and i0(5));
	o(6) <= (sel and i1(6)) or ((not sel) and i0(6));
	o(7) <= (sel and i1(7)) or ((not sel) and i0(7));

end architecture comportamento;

