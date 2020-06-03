library ieee;
use ieee.std_logic_1164.all;

entity UC_blockeio is
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
end UC_blockeio;

architecture comportamento of UC_blockeio is

begin
	o0 <= i0 when s_block = '1' else ('Z');
	o1 <= i1 when s_block = '1' else ('Z');
	o2 <= i2 when s_block = '1' else ('Z');
	o3 <= i3 when s_block = '1' else ('Z');
	o4 <= i4 when s_block = '1' else ('Z');
	o5 <= i5 when s_block = '1' else ('Z');
	o6 <= i6 when s_block = '1' else ('Z');
	o7 <= i7 when s_block = '1' else ('Z');
	o8 <= i8 when s_block = '1' else (others => 'Z');

end architecture comportamento;

