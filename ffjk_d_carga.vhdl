library ieee;
use ieee.std_logic_1164.all;

entity ffjk_d is
	port(
		J   : in    std_logic;
		clk : in    std_logic;
		pr  : in    std_logic;
		cl  : in    std_logic;
        c   : in    std_logic; 
		Q1  : out   std_logic;
		Q2  : out   std_logic
	);
end ffjk_d;

architecture comportamento of ffjk_d is

		signal k  : std_logic;
        signal n11: std_logic;
		signal n12: std_logic;
		signal S  : std_logic;
		signal R  : std_logic;
		signal n21: std_logic;
		signal n22: std_logic;
		signal sQ1: std_logic;
		signal sQ2: std_logic;
		signal jot: std_logic;

        component mux is
	    port(
		        i0  : in   std_logic;
				i1  : in   std_logic;
				sel : in   std_logic;
				o   : out  std_logic
            );
       end component;


begin
	multiplexador: mux
	port map(sQ1, j, c, jot);

	k   <= not jot;
	n11 <= not((jot and clk) and sQ2);
	n12 <= not((k and clk) and sQ1);
	s   <= not((pr and n11) and r);
	r   <= not((cl and n12) and s);
	n21 <= not(s and (not clk));
	n22 <= not(r and (not clk));
	sQ1 <= not((pr and n21) and sQ2);
	sQ2 <= not((cl and n22) and sQ1);
	Q1  <= sQ1;
	Q2  <= sQ2;
end architecture comportamento;

