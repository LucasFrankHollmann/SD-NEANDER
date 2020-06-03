library ieee;
use ieee.std_logic_1164.all;

entity UC is
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
end UC;
architecture comportamento of UC is

	component contador_0_9 is
		port(
			e   : in    std_logic_vector(3 downto 0);
			clk : in    std_logic;
			cl  : in    std_logic;
			T   : in    std_logic;
			o   : out   std_logic_vector(3 downto 0);
			NtoZ: out   std_logic
		);
	end component;
	
	component UC_decod is
		port(
				ins: in std_logic_vector(7 downto 0);
				
				 
				 inop: out std_logic;
				 ihlt: out std_logic;
				 ilda: out std_logic;
				 ista: out std_logic;
				 iadd: out std_logic;
				 ior: out std_logic;
				 iand: out std_logic;
				 inot: out std_logic;
				 ishl: out std_logic;
				 ijmp: out std_logic;
				 ijn: out std_logic;
				 ijz: out std_logic
		);
	end component;
	
	component UC_blockeio is
		port(
				i0: in std_logic;
				i1: in std_logic;
				i2: in std_logic;
				i3: in std_logic;
				i4: in std_logic;
				i5: in std_logic;
				i6: in std_logic;
				i7: in std_logic;
				i8: in std_logic_vector(2 downto 0);
			
				s_block: in std_logic;
				
				o0  : out  std_logic;
				o1  : out  std_logic;
				o2  : out  std_logic;
				o3  : out  std_logic;
				o4  : out  std_logic;
				o5  : out  std_logic;
				o6  : out  std_logic;
				o7  : out  std_logic;
				o8  : out  std_logic_vector(2 downto 0)
			);
	end component;
	
	signal Cont_UC: std_logic_vector(3 downto 0) := "0000";
	signal sd0: std_logic;
	signal sd1: std_logic;
	signal sd2: std_logic;
	signal sd3: std_logic;
	signal sd4: std_logic;
	signal sd5: std_logic;
	signal sd6: std_logic;
	signal sd7: std_logic;
	signal sd8: std_logic;
	signal sd9: std_logic;
	signal sd10: std_logic;
	signal sd11: std_logic;
	
	--NOP
	signal NOP_INC_PC: std_logic;
	signal NOP_CARGA_PC: std_logic;
	signal NOP_SEL_MUX: std_logic;
	signal NOP_CARGA_REM: std_logic;
	signal NOP_RNOTW: std_logic;
	signal NOP_CARGA_RDM: std_logic;
	signal NOP_CARGA_RI: std_logic;
	signal NOP_CARGA_AC: std_logic;
	signal NOP_SEL_ULA: std_logic_vector(2 downto 0);
	
	--HLT
	signal HLT_INC_PC: std_logic;
	signal HLT_CARGA_PC: std_logic;
	signal HLT_SEL_MUX: std_logic;
	signal HLT_CARGA_REM: std_logic;
	signal HLT_RNOTW: std_logic;
	signal HLT_CARGA_RDM: std_logic;
	signal HLT_CARGA_RI: std_logic;
	signal HLT_CARGA_AC: std_logic;
	signal HLT_SEL_ULA: std_logic_vector(2 downto 0);
	
	--LDA
	signal LDA_INC_PC: std_logic;
	signal LDA_CARGA_PC: std_logic;
	signal LDA_SEL_MUX: std_logic;
	signal LDA_CARGA_REM: std_logic;
	signal LDA_RNOTW: std_logic;
	signal LDA_CARGA_RDM: std_logic;
	signal LDA_CARGA_RI: std_logic;
	signal LDA_CARGA_AC: std_logic;
	signal LDA_SEL_ULA: std_logic_vector(2 downto 0);
	
	--STA
	signal STA_INC_PC: std_logic;
	signal STA_CARGA_PC: std_logic;
	signal STA_SEL_MUX: std_logic;
	signal STA_CARGA_REM: std_logic;
	signal STA_RNOTW: std_logic;
	signal STA_CARGA_RDM: std_logic;
	signal STA_CARGA_RI: std_logic;
	signal STA_CARGA_AC: std_logic;
	signal STA_SEL_ULA: std_logic_vector(2 downto 0);
	
	--ADD
	signal ADD_INC_PC: std_logic;
	signal ADD_CARGA_PC: std_logic;
	signal ADD_SEL_MUX: std_logic;
	signal ADD_CARGA_REM: std_logic;
	signal ADD_RNOTW: std_logic;
	signal ADD_CARGA_RDM: std_logic;
	signal ADD_CARGA_RI: std_logic;
	signal ADD_CARGA_AC: std_logic;
	signal ADD_SEL_ULA: std_logic_vector(2 downto 0);
	
	--OR
	signal OR_INC_PC: std_logic;
	signal OR_CARGA_PC: std_logic;
	signal OR_SEL_MUX: std_logic;
	signal OR_CARGA_REM: std_logic;
	signal OR_RNOTW: std_logic;
	signal OR_CARGA_RDM: std_logic;
	signal OR_CARGA_RI: std_logic;
	signal OR_CARGA_AC: std_logic;
	signal OR_SEL_ULA: std_logic_vector(2 downto 0);
	
	--AND
	signal AND_INC_PC: std_logic;
	signal AND_CARGA_PC: std_logic;
	signal AND_SEL_MUX: std_logic;
	signal AND_CARGA_REM: std_logic;
	signal AND_RNOTW: std_logic;
	signal AND_CARGA_RDM: std_logic;
	signal AND_CARGA_RI: std_logic;
	signal AND_CARGA_AC: std_logic;
	signal AND_SEL_ULA: std_logic_vector(2 downto 0);
	
	--NOT
	signal NOT_INC_PC: std_logic;
	signal NOT_CARGA_PC: std_logic;
	signal NOT_SEL_MUX: std_logic;
	signal NOT_CARGA_REM: std_logic;
	signal NOT_RNOTW: std_logic;
	signal NOT_CARGA_RDM: std_logic;
	signal NOT_CARGA_RI: std_logic;
	signal NOT_CARGA_AC: std_logic;
	signal NOT_SEL_ULA: std_logic_vector(2 downto 0);
	
	--SHL
	signal SHL_INC_PC: std_logic;
	signal SHL_CARGA_PC: std_logic;
	signal SHL_SEL_MUX: std_logic;
	signal SHL_CARGA_REM: std_logic;
	signal SHL_RNOTW: std_logic;
	signal SHL_CARGA_RDM: std_logic;
	signal SHL_CARGA_RI: std_logic;
	signal SHL_CARGA_AC: std_logic;
	signal SHL_SEL_ULA: std_logic_vector(2 downto 0);
	
	--JMP
	
	signal JMP_INC_PC: std_logic;
	signal JMP_CARGA_PC: std_logic;
	signal JMP_SEL_MUX: std_logic;
	signal JMP_CARGA_REM: std_logic;
	signal JMP_RNOTW: std_logic;
	signal JMP_CARGA_RDM: std_logic;
	signal JMP_CARGA_RI: std_logic;
	signal JMP_CARGA_AC: std_logic;
	signal JMP_SEL_ULA: std_logic_vector(2 downto 0);
	
	--JN
	signal JN_INC_PC: std_logic;
	signal JN_CARGA_PC: std_logic;
	signal JN_SEL_MUX: std_logic;
	signal JN_CARGA_REM: std_logic;
	signal JN_RNOTW: std_logic;
	signal JN_CARGA_RDM: std_logic;
	signal JN_CARGA_RI: std_logic;
	signal JN_CARGA_AC: std_logic;
	signal JN_SEL_ULA: std_logic_vector(2 downto 0);
	
	--JZ
	signal JZ_INC_PC: std_logic;
	signal JZ_CARGA_PC: std_logic;
	signal JZ_SEL_MUX: std_logic;
	signal JZ_CARGA_REM: std_logic;
	signal JZ_RNOTW: std_logic;
	signal JZ_CARGA_RDM: std_logic;
	signal JZ_CARGA_RI: std_logic;
	signal JZ_CARGA_AC: std_logic;
	signal JZ_SEL_ULA: std_logic_vector(2 downto 0);
	signal T: std_logic := '1';
	
	signal lixo: std_logic;
	signal cl: std_logic:='0';
	signal scRI: std_logic:='0';
	
begin


	contadorUC: contador_0_9
	port map(cont_UC, in_clk, cl, T, cont_UC, lixo);
	
	NOP_INC_PC <= '1';
	NOP_CARGA_PC <= (cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	NOP_SEL_MUX <= '0';
	NOP_CARGA_REM <= (not cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	NOP_RNOTW <= '1';
	NOP_CARGA_RDM <= (cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	NOP_CARGA_RI <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	NOP_CARGA_AC <= '0';
	NOP_SEL_ULA <= "000";
	
	HLT_INC_PC <= '1';
	HLT_CARGA_PC <= (cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	HLT_SEL_MUX <= '0';
	HLT_CARGA_REM <= (not cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	HLT_RNOTW <= '1';
	HLT_CARGA_RDM <= (cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	HLT_CARGA_RI <= '0';
	HLT_CARGA_AC <= '0';
	HLT_SEL_ULA <= "000";
	T <= not(((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3))) and sd1);
	
	LDA_INC_PC <= '1';
	LDA_CARGA_PC <= (not cont_UC(0)) and (cont_UC(2)) and (not cont_UC(3));
	LDA_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	LDA_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	LDA_RNOTW <= '1';
	LDA_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	LDA_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	LDA_CARGA_AC <= (not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	LDA_SEL_ULA <= "000";
	
	STA_INC_PC <= '1';
	STA_CARGA_PC <= (not cont_UC(0)) and (cont_UC(2)) and (not cont_UC(3));
	STA_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	STA_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	STA_RNOTW <= not ((not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	STA_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(2)) and (not cont_UC(3)));
	STA_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	STA_CARGA_AC <= '0';
	STA_SEL_ULA <= "000";
	
	ADD_INC_PC <= '1';
	ADD_CARGA_PC <= (not cont_UC(0)) and (cont_UC(2)) and (not cont_UC(3));
	ADD_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	ADD_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	ADD_RNOTW <= '1';
	ADD_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	ADD_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	ADD_CARGA_AC <= (not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	ADD_SEL_ULA <= "001";
	
	OR_INC_PC <= '1';
	OR_CARGA_PC <= (not cont_UC(0)) and (cont_UC(2)) and (not cont_UC(3));
	OR_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	OR_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	OR_RNOTW <= '1';
	OR_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	OR_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	OR_CARGA_AC <= (not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	OR_SEL_ULA <= "010";
	
	AND_INC_PC <= '1';
	AND_CARGA_PC <= (not cont_UC(0)) and (cont_UC(2)) and (not cont_UC(3));
	AND_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	AND_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	AND_RNOTW <= '1';
	AND_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	AND_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	AND_CARGA_AC <= (not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	AND_SEL_ULA <= "011";
	
	NOT_INC_PC <= '1';
	NOT_CARGA_PC <= (not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	NOT_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	NOT_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	NOT_RNOTW <= '1';
	NOT_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	NOT_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	NOT_CARGA_AC <= (not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	NOT_SEL_ULA <= "100";
	
	SHL_INC_PC <= '1';
	SHL_CARGA_PC <= (not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	SHL_SEL_MUX <= (not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3));
	SHL_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	SHL_RNOTW <= '1';
	SHL_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	SHL_CARGA_RI <= (cont_UC(0)) and (cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	SHL_CARGA_AC <= (not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	SHL_SEL_ULA <= "101";
	
	JMP_INC_PC <= not ((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JMP_CARGA_PC <= ((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3))) or ((not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	JMP_SEL_MUX <= '0';
	JMP_CARGA_REM <= ((not cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3))) or ((cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JMP_RNOTW <= '1';
	JMP_CARGA_RDM <= ((cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(3))) or ((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JMP_CARGA_RI <= (not cont_UC(0)) and ( cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	JMP_CARGA_AC <= '0';
	JMP_SEL_ULA <= "000";
	
	JN_INC_PC <= not (((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3))) and in_Flags(1));
	JN_CARGA_PC <= (((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)))) or ((not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	JN_SEL_MUX <= '0';
	JN_CARGA_REM <= (((not cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)))) or ((cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JN_RNOTW <= '1';
	JN_CARGA_RDM <= (((cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(3)))) or ((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JN_CARGA_RI <= (not cont_UC(0)) and ( cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	JN_CARGA_AC <= '0';
	JN_SEL_ULA <= "000";
	
	JZ_INC_PC <= not (((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3))) and in_Flags(0));
	JZ_CARGA_PC <= (((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)))) or ((not cont_UC(0)) and (not cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3)));
	JZ_SEL_MUX <= '0';
	JZ_CARGA_REM <= (((not cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)))) or ((cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JZ_RNOTW <= '1';
	JZ_CARGA_RDM <= (((cont_UC(0)) and (not cont_UC(1)) and (not cont_UC(3)))) or ((not cont_UC(0)) and (cont_UC(1)) and (not cont_UC(2)) and (not cont_UC(3)));
	JZ_CARGA_RI <= (not cont_UC(0)) and ( cont_UC(1)) and (cont_UC(2)) and (not cont_UC(3));
	JZ_CARGA_AC <= '0';
	JZ_SEL_ULA <= "000";
	
	carga_ri <= scRI;
	proc: process
		begin
			wait for 20 ns;
			cl <= (not scri);
	end process proc;
	
	decodificador: UC_decod
	port map(in_RI,sd0,sd1,sd2,sd3,sd4,sd5,sd6,sd7,sd8,sd9,sd10,sd11);
	
	NOP_BLK: UC_blockeio
	port map(NOP_INC_PC,NOP_CARGA_PC,NOP_SEL_MUX,NOP_CARGA_REM,NOP_RNOTW,NOP_CARGA_RDM,NOP_CARGA_RI,NOP_CARGA_AC,NOP_SEL_ULA,sd0,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	HLT_BLK: UC_blockeio
	port map(HLT_INC_PC,HLT_CARGA_PC,HLT_SEL_MUX,HLT_CARGA_REM,HLT_RNOTW,HLT_CARGA_RDM,HLT_CARGA_RI,HLT_CARGA_AC,HLT_SEL_ULA,sd1,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	LDA_BLK: UC_blockeio
	port map(LDA_INC_PC,LDA_CARGA_PC,LDA_SEL_MUX,LDA_CARGA_REM,LDA_RNOTW,LDA_CARGA_RDM,LDA_CARGA_RI,LDA_CARGA_AC,LDA_SEL_ULA,sd2,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	STA_BLK: UC_blockeio
	port map(STA_INC_PC,STA_CARGA_PC,STA_SEL_MUX,STA_CARGA_REM,STA_RNOTW,STA_CARGA_RDM,STA_CARGA_RI,STA_CARGA_AC,STA_SEL_ULA,sd3,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	ADD_BLK: UC_blockeio
	port map(ADD_INC_PC,ADD_CARGA_PC,ADD_SEL_MUX,ADD_CARGA_REM,ADD_RNOTW,ADD_CARGA_RDM,ADD_CARGA_RI,ADD_CARGA_AC,ADD_SEL_ULA,sd4,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	OR_BLK: UC_blockeio
	port map(OR_INC_PC,OR_CARGA_PC,OR_SEL_MUX,OR_CARGA_REM,OR_RNOTW,OR_CARGA_RDM,OR_CARGA_RI,OR_CARGA_AC,OR_SEL_ULA,sd5,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	AND_BLK: UC_blockeio
	port map(AND_INC_PC,AND_CARGA_PC,AND_SEL_MUX,AND_CARGA_REM,AND_RNOTW,AND_CARGA_RDM,AND_CARGA_RI,AND_CARGA_AC,AND_SEL_ULA,sd6,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	NOT_BLK: UC_blockeio
	port map(NOT_INC_PC,NOT_CARGA_PC,NOT_SEL_MUX,NOT_CARGA_REM,NOT_RNOTW,NOT_CARGA_RDM,NOT_CARGA_RI,NOT_CARGA_AC,NOT_SEL_ULA,sd7,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	SHL_BLK: UC_blockeio
	port map(SHL_INC_PC,SHL_CARGA_PC,SHL_SEL_MUX,SHL_CARGA_REM,SHL_RNOTW,SHL_CARGA_RDM,SHL_CARGA_RI,SHL_CARGA_AC,SHL_SEL_ULA,sd8,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	JMP_BLK: UC_blockeio
	port map(JMP_INC_PC,JMP_CARGA_PC,JMP_SEL_MUX,JMP_CARGA_REM,JMP_RNOTW,JMP_CARGA_RDM,JMP_CARGA_RI,JMP_CARGA_AC,JMP_SEL_ULA,sd9,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	JN_BLK: UC_blockeio
	port map(JN_INC_PC,JN_CARGA_PC,JN_SEL_MUX,JN_CARGA_REM,JN_RNOTW,JN_CARGA_RDM,JN_CARGA_RI,JN_CARGA_AC,JN_SEL_ULA,sd10,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
	JZ_BLK: UC_blockeio
	port map(JZ_INC_PC,JZ_CARGA_PC,JZ_SEL_MUX,JZ_CARGA_REM,JZ_RNOTW,JZ_CARGA_RDM,JZ_CARGA_RI,JZ_CARGA_AC,JZ_SEL_ULA,sd11,inc_PC,carga_PC,sel_mux,carga_rem,rnotw,carga_rdm,scRI,carga_ac,sel_ula);
	
end architecture comportamento;

