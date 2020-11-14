library ieee;
use ieee.std_logic_1164.all;

entity test_circuit4part2t3 is
end test_circuit4part2t3;

architecture test of test_circuit4part2t3 is

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

	ABCDE(4) <= '1'; -- A = 1
	ABCDE(2) <= '1'; -- C = 1
	ABCDE(0) <= '0'; -- E = 0
	
process is --hypothesize that B/0, in other words ACDE = "11-0"

begin		--test values truth table style

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
								--waveform had no problem, seconds the suspicion that A/1, as A is 1 the whole time here
								--also disproves n2/0 because when E = 0, z = 1 at times still, xor properties
wait;
end process;
end test;
