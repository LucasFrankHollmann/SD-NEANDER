library ieee;
use ieee.std_logic_1164.all;

entity MODULULA is
		-- Entidade Vazia
end MODULULA;

architecture comportamento of MODULULA is

	component MODULO_ULA is
			port(
				cAC: in std_logic;
				selULA: in std_logic_vector(2 downto 0);
				clk: in std_logic;
				bloqueios: in std_logic;
				cRDM: in std_logic;
				cl : in std_logic;
				
				in_out: inout std_logic_vector(7 downto 0);
				FlagsOUT: out std_logic_vector(1 downto 0)
			);
	end component;
	
	constant CLK_TIME : time := 20 ns;
	signal Sclk       : std_logic := '1';
	signal scx: std_logic_vector(7 downto 0);
	signal scy: std_logic_vector(7 downto 0);
	signal sLULA: std_logic_vector(2 downto 0);
	signal sfnz: std_logic_vector(1 downto 0);
	signal ss: std_logic_vector(7 downto 0);
	signal verdm: std_logic_vector(7 downto 0);
	signal sd: std_logic_vector(7 downto 0);
	signal bloqueios: std_logic;
	signal scl: std_logic;
	signal cAC: std_logic;
	
begin
	
	moduloula: MODULO_ULA
	port map(cAC, sLULA, sclk, bloqueios, '1', scl, verdm, sfnz);
	
	proc: process
		begin
		scl <= '0';
		cAC <= '1';
		wait for 1 ns;
		sLULA <= "000";
		bloqueios <= '1';
		scl <= '1';
		verdm <= "00000000";
		wait for CLK_TIME;
		sLULA <= "000";
		bloqueios <= '1';
		scl <= '1';
		verdm <= "00000111";
		wait for CLK_TIME;
		sLULA <= "000";
		bloqueios <= '1';
		scl <= '1';
		verdm <= "00000011";
		wait for CLK_TIME;
		sLULA <= "001";
		bloqueios <= '1';
		scl <= '1';
		verdm <= "00000010";
		wait for CLK_TIME;
		sLULA <= "011";
		bloqueios <= '1';
		scl <= '1';
		verdm <= "10000011";
		wait for CLK_TIME;
		sLULA <= "000";
		wait for CLK_TIME;
		cAC <= '0';
		wait;
	end process proc;
	
	
	clock : process
		begin
			Sclk <= not Sclk;
			wait for CLK_TIME/2;

		end process clock;
	
end architecture comportamento;

