library ieee;
use ieee.std_logic_1164.all;

entity UCtb is
	--empty entity
end UCtb;

architecture comportamento of UCtb is

       component UC is
			port(
			
				in_RI: in std_logic_vector(7 downto 0);
				in_CLK: in std_logic;
				in_CL: in std_logic;
				
				inc_PC: out std_logic;
				carga_PC: out std_logic;
				sel_MUX: out std_logic;
				carga_REM: out std_logic;
				rnotw: out std_logic;
				carga_RDM: out std_logic;
				carga_RI: out std_logic;
				carga_AC: out std_logic;
				sel_ULA: out std_logic_vector(2 downto 0)
		);
	end component;

	signal sin_ri: std_logic_vector(7 downto 0) := "00000000";
	signal sclk: std_logic := '0';
	signal sin_cl: std_logic := '0';
	
	signal sinc_pc: std_logic;
	signal scarga_pc: std_logic;
	signal ssel_mux: std_logic;
	signal scarga_rem: std_logic;
	signal srnotw: std_logic;
	signal scarga_rdm: std_logic;
	signal scarga_ri: std_logic;
	signal scarga_ac: std_logic;
	signal ssel_Ula: std_logic_vector(2 downto 0);
	
begin

	suc: uc
	port map(sin_ri,sclk,sin_cl,sinc_pc,scarga_pc,ssel_mux,scarga_rem,srnotw,scarga_rdm,scarga_ri, scarga_ac, ssel_Ula);
	
	
	proc: process
		begin
			wait for 20 ns;
				sin_cl <= '1';
			wait;
	end process proc;
	
	proce: process
		begin
			wait for 220 ns;
					sin_ri <= "00000001";
			wait;
	end process proce;
	
	
	
	
	
	
	clock : process
		begin
			wait for 10 ns;
			Sclk <= not Sclk;
			
	end process clock;
	
end architecture comportamento;

