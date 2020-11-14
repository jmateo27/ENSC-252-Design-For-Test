library ieee;
use ieee.std_logic_1164.all;

entity test_circuit1part2t3 is
end test_circuit1part2t3;

architecture test of test_circuit1part2t3 is

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
	
process is --hypothesize that there is a bridge fault between C and B, C is the dominant driver
			  --if i set C = B for every case and all is true, this is the fault!

begin	--setting values truthtable style

	ABCDE(3 downto 2) <= "00"; -- C = B = 0
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "00";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "01";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "10";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "11";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "00";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "01";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "10";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "00";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "11";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "11"; -- C = B = 1
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "00";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "01";
	
	wait for 20 ns;
	
	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "10";
	
	wait for 20 ns;

	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '0';
	ABCDE(1 downto 0) <= "11";
	
	wait for 20 ns;

	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "00";
	
	wait for 20 ns;

	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "01";
	
	wait for 20 ns;

	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "10";
	
	wait for 20 ns;

	ABCDE(3 downto 2) <= "11";
	ABCDE(4) <= '1';
	ABCDE(1 downto 0) <= "11";
	
	wait for 20 ns;

wait;
end process;
end test;