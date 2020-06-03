library ieee;
use ieee.std_logic_1164.all;

entity Decod is
	port(
			OPCODE: in std_logic_vector(7 downto 0);
			
			s0: out std_logic;
			s1: out std_logic;
			s2: out std_logic;
			s3: out std_logic;
			s4: out std_logic;
			s5: out std_logic;
			s6: out std_logic;
			s7: out std_logic;
			s8: out std_logic;
			s9: out std_logic;
			s10: out std_logic;
			s11: out std_logic
        );
end Decod;

architecture comportamento of Decod is

begin
	
	s0 <= not OPCODE(7) and not OPCODE(6) and not OPCODE(5) and not OPCODE(4);
	s1 <= not OPCODE(7) and not OPCODE(6) and not OPCODE(5) and OPCODE(4);
	s2 <= not OPCODE(7) and not OPCODE(6) and OPCODE(5) and not OPCODE(4);
	s3 <= not OPCODE(7) and not OPCODE(6) and OPCODE(5) and OPCODE(4);
	s4 <= not OPCODE(7) and OPCODE(6) and not OPCODE(5) and not OPCODE(4);
	s5 <= not OPCODE(7) and OPCODE(6) and not OPCODE(5) and OPCODE(4);
	s6 <= not OPCODE(7) and OPCODE(6) and OPCODE(5) and not OPCODE(4);
	s7 <= OPCODE(7) and not OPCODE(6) and not OPCODE(5) and not OPCODE(4);
	s8 <= OPCODE(7) and not OPCODE(6) and not OPCODE(5) and OPCODE(4);
	s9 <= OPCODE(7) and not OPCODE(6) and OPCODE(5) and not OPCODE(4);
	s10 <= OPCODE(7) and OPCODE(6) and OPCODE(5) and OPCODE(4);
	s11 <= not OPCODE(7) and OPCODE(6) and OPCODE(5) and OPCODE(4);
	
	
	
end architecture comportamento;

