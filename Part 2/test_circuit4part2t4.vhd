
library ieee;
use ieee.std_logic_1164.all;

entity test_circuit4part2t4 is
end test_circuit4part2t4;

architecture test of test_circuit4part2t4 is

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

	ABCDE(4) <= '1';
	
process is --almost certain that A/1, if everything is 
			  --the same when i set A = 1 for all cases, this is true!

begin			--testing values truth table style

	ABCDE(3 downto 0) <= "0000";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <=	"0001";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "0010";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "0011";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "0100";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "0101";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "0110";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "0111";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1000";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1001";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1010";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1011";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1100";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1101";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1110";
	
	wait for 20 ns;
	
	ABCDE(3 downto 0) <= "1111";
	
	wait for 20 ns;
--waveform agrees with the suspicion that A/1, this contradicts 
--with the possibility that n1/0 and n3/0 as they are 
--in the same path, the AND and NAND don't invert the value with
--the set values here, which have been proven to be correct
	
wait;
end process;
end test;