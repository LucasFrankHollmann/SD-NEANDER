library ieee;
use ieee.std_logic_1164.all;

entity registrador is
	port(
		e   : in    std_logic_vector(7 downto 0);
		clk : in    std_logic;
		pr  : in    std_logic;
		cl  : in    std_logic;
		c   : in    std_logic;
		o   : out   std_logic_vector(7 downto 0);
		notO: out   std_logic_vector(7 downto 0)
	);
end registrador;

architecture comportamento of registrador is

component ffjk_d is
	    port(
		        J   : in    std_logic;
				clk : in    std_logic;
				pr  : in    std_logic;
				cl  : in    std_logic;
				c   : in    std_logic; 
				Q1  : out   std_logic;
				Q2  : out   std_logic
            );
end component;

begin
	
	ffjk0: ffjk_d
	port map(e(0), clk, pr, cl, c, o(0), notO(0));
	ffjk1: ffjk_d
	port map(e(1), clk, pr, cl, c, o(1), notO(1));
	ffjk2: ffjk_d
	port map(e(2), clk, pr, cl, c, o(2), notO(2));
	ffjk3: ffjk_d
	port map(e(3), clk, pr, cl, c, o(3), notO(3));
	ffjk4: ffjk_d
	port map(e(4), clk, pr, cl, c, o(4), notO(4));
	ffjk5: ffjk_d
	port map(e(5), clk, pr, cl, c, o(5), notO(5));
	ffjk6: ffjk_d
	port map(e(6), clk, pr, cl, c, o(6), notO(6));
	ffjk7: ffjk_d
	port map(e(7), clk, pr, cl, c, o(7), notO(7));
	
end architecture comportamento;

