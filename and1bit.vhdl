library ieee;
use ieee.std_logic_1164.all;

entity and1bit is
	port(
		a     : in  std_logic;
		b     : in  std_logic;
		and_s	  : out std_logic
	);
end entity;

architecture comp of and1bit is
begin
	and_s <= a and b;
end architecture;
