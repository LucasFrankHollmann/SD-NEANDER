library ieee;
use ieee.std_logic_1164.all;

entity LEIA_A_BULA is
		-- Entidade Vazia
end LEIA_A_BULA;

architecture comportamento of LEIA_A_BULA is

	component ULA is
	    port(
		        cx : in   std_logic_vector(7 downto 0);
				cy : in   std_logic_vector(7 downto 0);	
				clk: in std_logic;
				cAC: in std_logic;
				selULA: in std_logic_vector(2 downto 0);
				
				fnz: out std_logic_vector(1 downto 0);
				s : out   std_logic_vector(7 downto 0)
            );
	end component;
	
	constant CLK_TIME : time := 20 ns;
	signal Sclk       : std_logic := '1';
	signal scx: std_logic_vector(7 downto 0);
	signal scy: std_logic_vector(7 downto 0);
	signal sLULA: std_logic_vector(2 downto 0);
	signal sfnz: std_logic_vector(1 downto 0);
	signal ss: std_logic_vector(7 downto 0);
	
begin
	
	scx <= "00000101";
	scy <= "00000011";
	sLULA <= "101";
	
	readthebula: ULA
	port map(scx, scy, sclk, '1', sLULA, sfnz, ss);
	
	clock : process
		begin
			Sclk <= not Sclk;
			wait for CLK_TIME/2;

		end process clock;
	
end architecture comportamento;

