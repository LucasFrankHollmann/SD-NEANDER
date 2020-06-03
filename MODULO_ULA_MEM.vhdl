library ieee;
use ieee.std_logic_1164.all;

entity MODULO_ULA_MEM is
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
end MODULO_ULA_MEM;

architecture comportamento of MODULO_ULA_MEM is

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
	
	component PC is
		port(
			incrementaPC   : in    std_logic;
			cargaPC : in    std_logic;
			RDM2PC : in    std_logic_vector(7 downto 0);
			
			PCCLK :  in    std_logic;
			PCCL    :  in    std_logic;
			
			PC2REM  : out   std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux8b is
		port(
			i0  : in   std_logic_vector(7 downto 0);
			i1  : in   std_logic_vector(7 downto 0);
			sel : in   std_logic;
			o   : out  std_logic_vector(7 downto 0)
			);
	end component;
	
	
	component as_ram is
		port(
			addr  : in    std_logic_vector(7 downto 0);
			data  : inout std_logic_vector(7 downto 0);
			rnotw : in    std_logic;
			notcs : in    std_logic
		);
	end component;
	
	
	
	
	--signal ULA2AC: std_logic_vector(7 downto 0);
	signal AC2ULA: std_logic_vector(7 downto 0);
	signal Blocks2cX: std_logic_vector(7 downto 0);
	signal s_RDMout: std_logic_vector(7 downto 0);
	signal MUX2REM: std_logic_vector(7 downto 0);
	signal in_out: std_logic_vector(7 downto 0) ;
	signal REM2RAM: std_logic_vector(7 downto 0);
	signal PC2MUX: std_logic_vector(7 downto 0);
	signal nots: std_logic_vector(7 downto 0);
	signal IR2DECOD: std_logic_vector(7 downto 0);
	signal nbloqueios: std_logic;
	
	
begin
	
	nbloqueios <= not bloqueios;
	YOLO: ULA
	port map(Blocks2cX, AC2ULA, clk, cAC, selULA, FlagsOUT, ULA2AC);
	
	blk0: blockeio
	port map(AC2ULA, nbloqueios, Blocks2cX);
	blk1: blockeio
	port map(Blocks2cX, nbloqueios, in_out);
	blk2: blockeio
	port map(s_RDMout, bloqueios, Blocks2cX);
	
	RDM: registrador
	port map(in_out, clk, '1', cl, cRDM, s_RDMout, nots);
	REN: registrador
	port map(MUX2REM,clk,'1',cl,Crem, REM2RAM, nots);
	AC: registrador
	port map(ULA2AC, clk, '1', cl, cAC, AC2ULA, nots);
	IR: registrador
	port map(blocks2cx,clk,'1',cl,cIR,ir_out,nots);
	
	Memoria: as_ram
	port map(REM2RAM, in_out, srnotw, snotcs);
	
	Multriplex: mux8b
	port map(PC2MUX,blocks2cx, selmux, MUX2REM);
	
	ProgramCounter: PC
	port map(selpc, cpc, blocks2cx, clk, cl, PC2MUX); 
	
	
	
end architecture comportamento;

