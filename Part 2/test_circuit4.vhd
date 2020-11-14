library ieee;
use ieee.std_logic_1164.all;

entity test_circuit4 is
end test_circuit4;

architecture test of test_circuit4 is

	component circuit4good is
		port (A, B, C, D, E : in std_logic;
				Zgood : out std_logic);
	end component;
	
	component circuit4f is
		port (A, B, C, D, E : in std_logic;
				Z : out std_logic);
	end component;

	signal ABCDE : std_logic_vector(4 downto 0);
	signal Zesig, Zgoodsig : std_logic;
	
begin

	DUT : circuit4f
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zesig);
	
	good : circuit4good
	port map(ABCDE(4), ABCDE(3), ABCDE(2), ABCDE(1), ABCDE(0), Zgoodsig);

process is	--copying test set derived
begin

	ABCDE <= "0-000"; 
	
	wait for 20 ns;
	
	ABCDE <= "0-010";
		
	wait for 20 ns;
	
	ABCDE <= "011-0";
		
	wait for 20 ns;
	
	ABCDE <= "101-0";
		
	wait for 20 ns;
	
	ABCDE <= "1-001";
		
	wait for 20 ns;	
	
	ABCDE <= "111-0";
	
	wait for 20 ns;
	
wait;
end process;
end test;