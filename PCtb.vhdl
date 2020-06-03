library ieee;
use ieee.std_logic_1164.all;

entity PCtb is
	
end PCtb;

architecture comportamento of PCtb is

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

		signal cl: std_logic;
		signal sclk    : std_logic := '1';
		signal incrementa:     std_logic;
		signal carga :    std_logic;
		signal sRDM2PC :  std_logic_vector(7 downto 0);
		signal sPC2REM  :    std_logic_vector(7 downto 0);
		constant CLK_TIME : time := 20 ns;
		

begin

	shhdgs:PC
	port map(incrementa,carga,sRDM2PC,sclk,cl,sPC2REM);

	clock : process
		begin
			Sclk <= not Sclk;
			wait for CLK_TIME/2;
	end process clock;
	
	proc: process
		begin
				cl <='0';
				wait for 1 ns;
				cl <='1';
				sRDM2PC <= "10101010";
				
				incrementa <= '0';
				carga <= '0';
				wait for CLK_TIME;
				incrementa <= '0';
				carga <= '1';
				wait for CLK_TIME;
				incrementa <= '1';
				carga <= '0';
				wait for CLK_TIME;
				incrementa <= '1';
				carga <= '1';
				wait for CLK_TIME;
				carga <='0';
				wait for CLK_TIME;
				incrementa <= '1';
				carga <= '1';
				wait;
	end process proc;
	
end architecture comportamento;

