library ieee;
use ieee.std_logic_1164.all;

entity not8bits is
	port(
		a    : in std_logic_vector(7 downto 0);
		s    : out std_logic_vector(7 downto 0)
	);
end entity;

architecture comp of not8bits is

	component not1bit is
		port(
			a    : in  std_logic;
			not_s: out std_logic
		);
	end component;
	
begin
	
	u_not1bit0 : not1bit
	port map(a(0), s(0));
	u_not1bit1 : not1bit
	port map(a(1), s(1));
	u_not1bit2 : not1bit
	port map(a(2), s(2));
	u_not1bit3 : not1bit
	port map(a(3), s(3));
	u_not1bit4 : not1bit
	port map(a(4), s(4));
	u_not1bit5 : not1bit
	port map(a(5), s(5));
	u_not1bit6 : not1bit
	port map(a(6), s(6));
	u_not1bit7 : not1bit
	port map(a(7), s(7));
	
	
	
	
end architecture;
