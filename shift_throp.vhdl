library ieee;
use ieee.std_logic_1164.all;

entity shift_throp is
	port(
		e   : in    std_logic_vector(7 downto 0);
		o   : out   std_logic_vector(7 downto 0)
	);
end shift_throp;

architecture comportamento of shift_throp is

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
	signal scl     : std_logic; 
	signal notO  :  std_logic_vector(7 downto 0);
begin
	
	o(0) <= '0';
	o(1) <= e(0);
	o(2) <= e(1);
	o(3) <= e(2);
	o(4) <= e(3);
	o(5) <= e(4);
	o(6) <= e(5);
	o(7) <= e(6);
	
end architecture comportamento;

