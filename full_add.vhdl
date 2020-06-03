library ieee;
use ieee.std_logic_1164.all;

entity full_add is
	port(
		a     : in  std_logic;
		b     : in  std_logic;
		te	  : in  std_logic;
		s	  : out std_logic;
		ts    : out std_logic
	);
end entity;

architecture comp of full_add is
begin
	s <= (a xor b) xor te;
	ts <= (b and te) or (a and te) or (a and b);
end architecture;
