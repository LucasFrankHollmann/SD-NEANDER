library ieee;
use ieee.std_logic_1164.all;

entity p_xor_2in is
	port(
		a    : in  std_logic;
		b    : in  std_logic;
		sxor : out std_logic
	);
end entity;

architecture comp of p_xor_2in is
begin
	sxor <= a xor b;
end architecture;
