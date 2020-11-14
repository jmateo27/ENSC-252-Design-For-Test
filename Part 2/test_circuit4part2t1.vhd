library ieee;
use ieee.std_logic_1164.all;

entity test_circuit4part2t1 is
end test_circuit4part2t1;

architecture test of test_circuit4part2t1 is

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

	ABCDE(3 downto 0) <= "11-0";
	
process is --hypothesize A/1, in other words, BCDE = "11-0"

begin

	ABCDE(4) <= '1'; --should act correctly
	
	wait for 20 ns;
	
	ABCDE(4) <= '0'; --if A/1 is true, it will copy the above
	
	wait for 20 ns;
																											--waveform suggests A/1
																											--E is not stuck at anything as the test set contradicts it

wait;
end process;
end test;