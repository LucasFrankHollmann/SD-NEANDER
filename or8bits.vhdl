library ieee;
use ieee.std_logic_1164.all;

entity or8bits is
	port(
		a    : in std_logic_vector(7 downto 0);
		b    : in std_logic_vector(7 downto 0);
		s    : out std_logic_vector(7 downto 0)
	);
end entity;

architecture comp of or8bits is

	component or1bit is
		port(
			a    : in  std_logic;
			b    : in  std_logic;
			or_s: out std_logic
		);
	end component;
	
begin
	
	u_or1bit0 : or1bit
	port map(a(0), b(0), s(0));
	u_or1bit1 : or1bit
	port map(a(1), b(1), s(1));
	u_or1bit2 : or1bit
	port map(a(2), b(2), s(2));
	u_or1bit3 : or1bit
	port map(a(3), b(3), s(3));
	u_or1bit4 : or1bit
	port map(a(4), b(4), s(4));
	u_or1bit5 : or1bit
	port map(a(5), b(5), s(5));
	u_or1bit6 : or1bit
	port map(a(6), b(6), s(6));
	u_or1bit7 : or1bit
	port map(a(7), b(7), s(7));
	
	
	
	
end architecture;
