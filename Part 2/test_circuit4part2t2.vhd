library ieee;
use ieee.std_logic_1164.all;

entity test_circuit4part2t2 is
end test_circuit4part2t2;

architecture test of test_circuit4part2t2 is

	component circuit4f is
		port (A, B, C,D, E : in std_logic;
				Z : out std_logic);
	end component;
	
	component circuit4good is
	port (A, B, C, D, E : in std_logic;
			Zgood : out std_logic);
	end component;

	signal Zesig, Zgoodsig : std_logic;
	signal ABCDE : std_logic_vector(4 downto 0);

begin

	DUT : circuit4f
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zesig);
	
	good : circuit4good
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zgoodsig);

	ABCDE(4) <= '0'; -- A = 0
	ABCDE(2) <= '0'; -- C = 0
	ABCDE(0) <= '0'; -- E = 0
	
process is --hypothesize D/0, in other words, ABCE = "0-00"

begin		  --testing values truthtable style

	ABCDE(3) <= '0'; 
	ABCDE(1) <= '0';
	
	wait for 20 ns;
	
	ABCDE(3) <= '0';
	ABCDE(1) <= '1';
	
	wait for 20 ns;

	ABCDE(3) <= '1';
	ABCDE(1) <= '0';
	
	wait for 20 ns;
	
	ABCDE(3) <= '1';
	ABCDE(1) <= '1';
	
	wait for 20 ns;
							--waveform only had problem at initial problem from test set

wait;
end process;
end test;
