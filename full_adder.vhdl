library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		a    : in std_logic_vector(7 downto 0);
		b    : in std_logic_vector(7 downto 0);
		s    : out std_logic_vector(7 downto 0);
		ts   : out std_logic
	);
end entity;

architecture comp of full_adder is

	component full_add is
		port(
			a    : in  std_logic;
			b    : in  std_logic;
			te   : in  std_logic;
			s    : out std_logic;
			ts   : out std_logic
		);
	end component;
	
	

	signal ts0, ts1, ts2, ts3, ts4, ts5, ts6 : std_logic;
begin
	
	u_full_add0 : full_add
	port map(a(0), b(0), '0', s(0), ts0);
	u_full_add1 : full_add
	port map(a(1), b(1), ts0, s(1), ts1);
	u_full_add2 : full_add
	port map(a(2), b(2), ts1, s(2), ts2);
	u_full_add3 : full_add
	port map(a(3), b(3), ts2, s(3), ts3);
	u_full_add4 : full_add
	port map(a(4), b(4), ts3, s(4), ts4);
	u_full_add5 : full_add
	port map(a(5), b(5), ts4, s(5), ts5);
	u_full_add6 : full_add
	port map(a(6), b(6), ts5, s(6), ts6);
	u_full_add7 : full_add
	port map(a(7), b(7), ts6, s(7), ts);
	
	
	
	
end architecture;
