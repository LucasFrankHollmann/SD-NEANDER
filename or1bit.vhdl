library ieee;
use ieee.std_logic_1164.all;

entity or1bit is
	port(
		a   	  : in  std_logic;
		b   	  : in  std_logic;
		or_s	  : out std_logic
	);
end entity;

architecture comp of or1bit is
begin
	or_s <= a or b;
end architecture;
