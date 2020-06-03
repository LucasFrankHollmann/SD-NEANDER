library ieee;
use ieee.std_logic_1164.all;

entity PC is
	port(
		incrementaPC   : in    std_logic;
		cargaPC : in    std_logic;
		RDM2PC : in    std_logic_vector(7 downto 0);
		
		PCCLK :  in    std_logic;
		PCCL    :  in    std_logic;
		
		PC2REM  : out   std_logic_vector(7 downto 0)
	);
end PC;

architecture comportamento of PC is

        component mux8b is
	    port(
		        i0  : in   std_logic_vector(7 downto 0);
				i1  : in   std_logic_vector(7 downto 0);
				sel : in   std_logic;
				o   : out  std_logic_vector(7 downto 0)
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

		 component full_adder is
			port(
				a    : in std_logic_vector(7 downto 0);
				b    : in std_logic_vector(7 downto 0);
				s    : out std_logic_vector(7 downto 0);
				ts   : out std_logic
			);
		end component;

		component blockeio is
			port(
				i  : in   std_logic_vector(7 downto 0);
				s_block: in std_logic;
				o  : out  std_logic_vector(7 downto 0)
				);
		end component;

		signal LIXO: std_logic_vector(7 downto 0);
		signal LIXO1B: std_logic;
		signal PCPP2MUX: std_logic_vector(7 downto 0);
		signal MUX2REGPC: std_logic_vector(7 downto 0);
		signal REGPC2PCPP: std_logic_vector(7 downto 0);
		signal notcargaPC: std_logic;

begin
	
	notcargaPC <= not cargaPC;
	
	PCPP:full_adder
	port map("00000001", REGPC2PCPP, PCPP2MUX, LIXO1B);
	
	Multiplexador: mux8b
	port map(RDM2PC, PCPP2MUX, incrementaPC, MUX2REGPC);
	
	RegPC: registrador
	port map(MUX2REGPC, PCCLK, '1', PCCL, cargaPC, REGPC2PCPP, LIXO);
	
	
	PC2REM <= REGPC2PCPP;
end architecture comportamento;
