library ieee;
use ieee.std_logic_1164.all;

entity test_circuit1part2t1 is
end test_circuit1part2t1;

architecture test of test_circuit1part2t1 is

	component circuit1e is
		port (A, B, C, D, E : in std_logic;
				Z : out std_logic);
	end component;
	
	component circuit1good is
	port (A, B, C, D, E : in std_logic;
			Zgood : out std_logic);
	end component;

	signal Zesig, Zgoodsig, same : std_logic;
	signal ABCDE : std_logic_vector(4 downto 0);

begin

	DUT : circuit1e
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zesig);
	
	good : circuit1good
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zgoodsig);
	
	ABCDE(3) <= '0';	-- B = 0
	
process is --hypothesize that B/1
begin

	ABCDE(4) <= '0';
	ABCDE(2 downto 0) <= "000";
	
	wait for 20 ns;
	
	ABCDE(4) <= '0';
	ABCDE(2 downto 0) <= "001";
	
	wait for 20 ns;

	ABCDE(4) <= '0';
	ABCDE(2 downto 0) <= "010";
	
	wait for 20 ns;
	
	ABCDE(4) <= '0';
	ABCDE(2 downto 0) <= "011";
	
	wait for 20 ns;
	
	ABCDE(4) <= '1';
	ABCDE(2 downto 0) <= "100";
	
	wait for 20 ns;
	
	ABCDE(4) <= '1';
	ABCDE(2 downto 0) <= "101";
	
	wait for 20 ns;
	
	ABCDE(4) <= '1';
	ABCDE(2 downto 0) <= "110";
	
	wait for 20 ns;
	
	ABCDE(4) <= '1';
	ABCDE(2 downto 0) <= "111";
	
	wait for 20 ns;
	
	ABCDE(4) <= '1';
	ABCDE(2 downto 0) <= "000";
	
	wait for 20 ns;

	ABCDE(4) <= '1';
	ABCDE(2 downto 0) <= "001";
	
	wait for 20 ns;
																--problem again at "10100"
																--C must be messing with B, comparing it to "10000" which outputs 0 in the good version
																--only way for the AND gate to output 1 is if C = B = '1'
																--therefore check if there is bridge fault between C and B, which is dominant? let's check
wait;
end process;
end test;