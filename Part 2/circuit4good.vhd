library ieee;
use ieee.std_logic_1164.all;

entity circuit4good is
	port (A, B, C, D, E : in std_logic;
			Zgood : out std_logic);
end circuit4good;

architecture behaviour of circuit4good is

begin

	Zgood <= ((not (A and B)) and (C or D)) xor E;

end behaviour;

