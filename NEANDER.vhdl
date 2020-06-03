library ieee;
use ieee.std_logic_1164.all;

entity MODULO_ULA_MEM_TB is
end MODULO_ULA_MEM_TB;

architecture comportamento of MODULO_ULA_MEM_TB is
	
	component UC is
			port(
			
				in_RI: in std_logic_vector(7 downto 0);
				in_CLK: in std_logic;
				in_CL: in std_logic;
				in_Flags: in std_logic_vector(1 downto 0);
				
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

	component MODULO_ULA_MEM is
			port(
				cAC: in std_logic;
				selULA: in std_logic_vector(2 downto 0);
				clk: in std_logic;
				bloqueios: in std_logic;
				cRDM: in std_logic;
				cREM: in std_logic;
				cl : in std_logic;
				srnotw: in std_logic;
				snotcs: in std_logic;
				selmux: in std_logic;
				selPC: in std_logic;
				cPC: in std_logic;
				cIR: in std_logic;
				
				ULA2AC: inout std_logic_vector(7 downto 0);
				ir_out: out std_logic_vector(7 downto 0);
				FlagsOUT: out std_logic_vector(1 downto 0)
			);
	end component;

	constant CLK_TIME : time := 20 ns;
	signal scAC:             std_logic;
	signal sselULA:        std_logic_vector(2 downto 0);
	signal sclk:               std_logic:= '1';
	signal sbloqueios:     std_logic;
	signal scRDM:         std_logic;
	signal scREM:         std_logic;
	signal scl :               std_logic:='0';
	signal ssrnotw:        std_logic;
	signal ssnotcs:         std_logic;
	signal sselmux:        std_logic;
	signal sselPC:          std_logic;
	signal scPC:             std_logic;
	signal scIR:              std_logic;
	signal snotcs:           std_logic;
	
	signal in_Ir: std_logic_vector(7 downto 0) := "00000000";
	signal in_ri: std_logic_vector(7 downto 0) := "00000000";
	signal sULA2AC:     std_logic_vector(7 downto 0) := "10101010";
	signal sdecod_out:   std_logic_vector(11 downto 0);
	signal sFlagsOUT:   std_logic_vector(1 downto 0);
	
	
begin

	
	
	UnidadeControle: uc
	port map(in_ri,sclk, scl, sFlagsOUT, sselPC, scPC, sselmux, scREM, ssrnotw, scRDM, scIR, scAC, sselULA);

	sbloqueios <= ssrnotw;

	MODULULAMEM: MODULO_ULA_MEM
	port map(scAC,sselULA,sclk,sbloqueios,scRDM,scREM,scl,ssrnotw,snotcs,sselmux,sselPC,scPC,scIR, sULA2AC,in_ri,sFlagsOUT);

	cl: process
		begin
			snotcs <= '1';
			wait for 1 ns;

			wait for 19 ns;
			scl <= '1';
			snotcs <='0';
			wait for 200 ns;
			in_ir <= "00000010";
			wait for 200 ns;
			in_ir <= "00000100";
			wait for 200 ns;
			in_ir <= "00000101";
			wait for 200 ns;
			in_ir <= "00000110";
			wait for 200 ns;
			in_ir <= "00000111";
			wait for 200 ns;
			in_ir <= "00001000";
			wait for 200 ns;
			in_ir <= "00001001";
			wait for 200 ns;
			in_ir <= "00000010";
			wait for 200 ns;
			in_ir <= "00001010";
			wait for 200 ns;
			in_ir <= "00001011";
			wait for 200 ns;
			in_ir <= "00000001";
			
			wait;
	end process cl;

	clock : process
		begin
			Sclk <= not Sclk;
			wait for CLK_TIME/2;
	end process clock;

end architecture comportamento;

