library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port(
		i0  : in   std_logic;
        i1  : in   std_logic;
        sel : in   std_logic;
		o   : out  std_logic 
        );
end mux;

architecture comportamento of mux is

begin
	o <= (sel and i1) or ((not sel) and i0);

end architecture comportamento;

