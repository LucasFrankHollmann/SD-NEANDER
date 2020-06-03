library ieee;
use ieee.std_logic_1164.all;

entity ULA is
	port(
	  
		cx : in   std_logic_vector(7 downto 0);	
		cy : in   std_logic_vector(7 downto 0);	
		clk: in std_logic;
		cAC: in std_logic;
		selULA: in std_logic_vector(2 downto 0);
		
		fnz: out std_logic_vector(1 downto 0);
		s : out   std_logic_vector(7 downto 0)
		
        );
end ULA;

architecture comportamento of ULA is

	component and8bits is
	    port(
		        a    : in std_logic_vector(7 downto 0);
				b    : in std_logic_vector(7 downto 0);
				s    : out std_logic_vector(7 downto 0)
            );
	end component;
	
	component not8bits is
	    port(
		       a    : in std_logic_vector(7 downto 0);
			   s    : out std_logic_vector(7 downto 0)
            );
	end component;
	
	component or8bits is
	    port(
		        a    : in std_logic_vector(7 downto 0);
				b    : in std_logic_vector(7 downto 0);
				s    : out std_logic_vector(7 downto 0)
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

	component shift_throp is
	    port(
		        e   : in    std_logic_vector(7 downto 0);
				o  : out   std_logic_vector(7 downto 0)
            );
	end component;
	
	component blockeio is
	    port(
		        i  : in   std_logic_vector(7 downto 0);
				s_block: in std_logic;
				o  : out  std_logic_vector(7 downto 0)
            );
	end component;
	
	component registrador2b is
	    port(
		        e   : in    std_logic_vector(1 downto 0);
				clk : in    std_logic;
				pr  : in    std_logic;
				cl  : in    std_logic;
				c   : in    std_logic;
				o   : out   std_logic_vector(1 downto 0);
				notO: out   std_logic_vector(1 downto 0)
            );
	end component;
	
	component LULA is
	    port(
		        i  : in   std_logic_vector(2 downto 0);
				p  : out  std_logic_vector(5 downto 0)
            );
	end component;
	
	component CCNZ is
	    port(
		        i  : in   std_logic_vector(7 downto 0);	
				o  : out  std_logic_vector(1 downto 0)
            );
	end component;
	
	signal p: std_logic_vector(5 downto 0);
	signal overfoda_se: std_logic;
	signal add_s: std_logic_vector(7 downto 0);
	signal and_s: std_logic_vector(7 downto 0);
	signal or_s: std_logic_vector(7 downto 0);
	signal shl_s: std_logic_vector(7 downto 0);
	signal yesnt_s: std_logic_vector(7 downto 0);
	signal snz: std_logic_vector(1 downto 0);
	signal notnz: std_logic_vector(1 downto 0);
	signal ss: std_logic_vector(7 downto 0);
	signal scl: std_logic;
	
begin
	lulindo: LULA
	port map(selULA, p);
	
	add: full_adder
	port map(cx, cy, add_s, overfoda_se);
	
	and1: and8bits
	port map(cx, cy, and_s);
	
	or1: or8bits
	port map(cx, cy, or_s);
	
	yesnt: not8bits
	port map(cy, yesnt_s);
	
	shoft: shift_throp
	port map(cy, shl_s);
	
	block_lda: blockeio
	port map(cx, p(0), ss);

	block_add: blockeio
	port map(add_s, p(1), ss);
	
	block_or: blockeio
	port map(or_s, p(2), ss);
	
	block_and: blockeio
	port map(and_s, p(3), ss);
	
	block_not: blockeio
	port map(yesnt_s, p(4), ss);
		
	block_shl: blockeio
	port map(shl_s, p(5), ss);
	
	s <= ss;
	
	bind: CCNZ
	port map(ss, snz);
	
	flagnz: registrador2b
	port map(snz, clk, '1', scl, cAC, fnz, notnz);
	
	resetareg: process 
		begin
			scl <= '0';
			wait for 1 ns;
			scl <= '1';	
			wait;
	end process resetareg;
	
end architecture comportamento;

