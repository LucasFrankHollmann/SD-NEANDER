library ieee;
use ieee.std_logic_1164.all;

entity not1bit is
	port(
		a   	  : in  std_logic;
		not_s	  : out std_logic
	);
end entity;

architecture comp of not1bit is
begin
	not_s <= not a;
end architecture;
