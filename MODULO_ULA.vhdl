library ieee;
use ieee.std_logic_1164.all;

entity MODULO_ULA is
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
end MODULO_ULA;

architecture comportamento of MODULO_ULA is

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
	
	component registrador is
		port(
			e   : in    std_logic_vector(7 downto 0);
			clk : in    std_logic;
			pr  : in    std_logic;
			cl  : in    std_logic;
			c   : in    std_logic;
			o   : out   std_logic_vector(7 downto 0);
			notO: out   std_logic_vector(7 downto 0)
		);
	end component;
	
	component blockeio is
		port(
			i  : in   std_logic_vector(7 downto 0);
			s_block: in std_logic;
			o  : out  std_logic_vector(7 downto 0)
			);
	end component;
	
	signal ULA2AC: std_logic_vector(7 downto 0);
	signal AC2ULA: std_logic_vector(7 downto 0);
	signal Blocks2cX: std_logic_vector(7 downto 0);
	signal s_RDMout: std_logic_vector(7 downto 0);
	signal nots: std_logic_vector(7 downto 0);
	signal nbloqueios: std_logic;
	
	
begin
	
	nbloqueios <= not bloqueios;
	YOLO: ULA
	port map(Blocks2cX, AC2ULA, clk, cAC, selULA, FlagsOUT, ULA2AC);
	
	AC: registrador
	port map(ULA2AC, clk, '1', cl, cAC, AC2ULA, nots);
	
	blk0: blockeio
	port map(AC2ULA, nbloqueios, Blocks2cX);
	blk1: blockeio
	port map(Blocks2cX, nbloqueios, in_out);
	blk2: blockeio
	port map(s_RDMout, bloqueios, Blocks2cX);
	
	RDM: registrador
	port map(in_out, clk, '1', cl, cRDM, s_RDMout, nots);
	
	
	
end architecture comportamento;

