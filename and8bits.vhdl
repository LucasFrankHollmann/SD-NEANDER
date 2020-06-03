library ieee;
use ieee.std_logic_1164.all;

entity and8bits is
	port(
		a    : in std_logic_vector(7 downto 0);
		b    : in std_logic_vector(7 downto 0);
		s    : out std_logic_vector(7 downto 0)
	);
end entity;

architecture comp of and8bits is

	component and1bit is
		port(
			a    : in  std_logic;
			b    : in  std_logic;
			and_s: out std_logic
		);
	end component;
	
begin
	
	u_and1bit0 : and1bit
	port map(a(0), b(0), s(0));
	u_and1bit1 : and1bit
	port map(a(1), b(1), s(1));
	u_and1bit2 : and1bit
	port map(a(2), b(2), s(2));
	u_and1bit3 : and1bit
	port map(a(3), b(3), s(3));
	u_and1bit4 : and1bit
	port map(a(4), b(4), s(4));
	u_and1bit5 : and1bit
	port map(a(5), b(5), s(5));
	u_and1bit6 : and1bit
	port map(a(6), b(6), s(6));
	u_and1bit7 : and1bit
	port map(a(7), b(7), s(7));
	
	
	
	
end architecture;
