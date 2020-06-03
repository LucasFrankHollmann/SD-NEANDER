library ieee;
use ieee.std_logic_1164.all;

entity registrador2b is
	port(
		e   : in    std_logic_vector(1 downto 0);
		clk : in    std_logic;
		pr  : in    std_logic;
		cl  : in    std_logic;
		c   : in    std_logic;
		o   : out   std_logic_vector(1 downto 0);
		notO: out   std_logic_vector(1 downto 0)
	);
end registrador2b;

architecture comportamento of registrador2b is

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
	
end architecture comportamento;

