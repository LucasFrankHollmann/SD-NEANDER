library ieee;
use ieee.std_logic_1164.all;

entity p_8in is
	port(
		a    : in std_logic_vector(7 downto 0);
		p_8b : out std_logic
	);
end entity;

architecture comp of p_8in is

	component p_xor_2in is
		port(
			a    : in  std_logic;
			b    : in  std_logic;
			sxor : out std_logic
		);
	end component;
	
	
	signal s0, s1, s2, s3, s01, s23 : std_logic;
begin
	
	u_x0 : p_xor_2in
	port map(a(0), a(1), s0);
	u_x1 : p_xor_2in
	port map(a(2), a(3), s1);
	u_x2 : p_xor_2in
	port map(a(4), a(5), s2);
	u_x3 : p_xor_2in
	port map(a(6), a(7), s3);
	
	u_x4 : p_xor_2in
	port map(s0, s1, s01);
	u_x5 : p_xor_2in
	port map(s2, s3, s23);
	
	u_x6 : p_xor_2in
	port map(s01, s23, p_8b);
	
end architecture;
