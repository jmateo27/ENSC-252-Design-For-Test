library ieee;
use ieee.std_logic_1164.all;

entity test_circuit1 is
end test_circuit1;

architecture test of test_circuit1 is

	component circuit1e is
		port (A, B, C, D, E : in std_logic;
				Z : out std_logic);
	end component;
	
	component circuit1good is
	port (A, B, C, D, E : in std_logic;
			Zgood : out std_logic);
	end component;

	signal Zesig, Zgoodsig : std_logic;
	signal ABCDE : std_logic_vector(4 downto 0);
	
begin

	DUT : circuit1e
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zesig);
	
	good : circuit1good
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zgoodsig);

process is --values from the test set derived
begin

	ABCDE <= "00-00";
	
	wait for 20 ns;
	
	ABCDE <= "10100";
		
	wait for 20 ns;
	
	ABCDE <= "10-01";
		
	wait for 20 ns;
	
	ABCDE <= "10-10";
		
	wait for 20 ns;
	
	ABCDE <= "11000";
	
	wait for 20 ns;
	
	ABCDE <= "11100";
	
	wait for 20 ns;
							--waveform has problem at ABCDE = "10100", from elimination, there is a fault at B, but which?
wait;
end process;
end test;