library ieee;
use ieee.std_logic_1164.all;

entity contador_0_9 is
	port(
		e   : in    std_logic_vector(3 downto 0);
		clk : in    std_logic;
		cl  : in    std_logic;
		T   : in    std_logic;
		o   : out   std_logic_vector(3 downto 0);
		NtoZ: out   std_logic

	);
end contador_0_9;

architecture comportamento of contador_0_9 is

component ffjk is
	    port(
		        J   : in    std_logic;
		        K   : in    std_logic;
				clk : in    std_logic;
				pr  : in    std_logic;
				cl  : in    std_logic;
				Q1  : out   std_logic;
				Q2  : out   std_logic
            );
end component;

	signal J0   : std_logic_vector(3 downto 0);
	signal K0   : std_logic_vector(3 downto 0);
	signal notO : std_logic_vector(3 downto 0);

begin
	
	NtoZ <= (e(3) and (not e(2)) and (not e(1)) and e(0) and T) and cl;
	
	J0(0) <= T and cl;
	K0(0) <= T or (not cl);
	J0(1) <= ((not e(3) and e(0)) and T) and cl;
	K0(1) <= ((((e(3) or e(0)) or (not e(1))) and T)) or (not cl);
	J0(2) <= ((e(1) and e(0)) and T) and cl;
	K0(2) <= ((e(1) and e(0)) and T) or (not cl);
	J0(3) <= (((e(2) and e(1)) and e(0)) and T) and cl;
	K0(3) <= ((e(0)) and T) or (not cl);
	
	
	ffjk0: ffjk
	port map(J0(0), K0(0), clk, '1', cl, o(0), notO(0));
	ffjk1: ffjk
	port map(J0(1), K0(1), clk, '1', cl, o(1), notO(1));
	ffjk2: ffjk
	port map(J0(2), K0(2), clk, '1', cl, o(2), notO(2));
	ffjk3: ffjk
	port map(J0(3), K0(3), clk, '1', cl, o(3), notO(3));

	
	
end architecture comportamento;

