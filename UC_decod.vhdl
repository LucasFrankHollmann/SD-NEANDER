library ieee;
use ieee.std_logic_1164.all;

entity UC_decod is
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
end UC_decod;
architecture comportamento of UC_decod is
begin
	
	inop <= (not ins(4)) and (not ins(5)) and (not ins(6)) and (not ins(7));
	ihlt <= (ins(4)) and (ins(5)) and (ins(6)) and (ins(7));
	ilda <= (not ins(4)) and (ins(5)) and (not ins(6)) and (not ins(7));
	ista <= (ins(4)) and (not ins(5)) and (not ins(6)) and (not ins(7));
	iadd <= (ins(4)) and (ins(5)) and (not ins(6)) and (not ins(7));
	ior <= (not ins(4)) and (not ins(5)) and (ins(6)) and (not ins(7));
	iand <= (ins(4)) and (not ins(5)) and (ins(6)) and (not ins(7));
	inot <= (not ins(4)) and (ins(5)) and (ins(6)) and (not ins(7));
	ishl <= (ins(4)) and (ins(5)) and (ins(6)) and (not ins(7));
	ijmp <= (not ins(4)) and (not ins(5)) and (not ins(6)) and (ins(7));
	ijn <= (ins(4)) and (not ins(5)) and (not ins(6)) and (ins(7));
	ijz <= (not ins(4)) and (ins(5)) and (not ins(6)) and (ins(7));
	
end architecture comportamento;

