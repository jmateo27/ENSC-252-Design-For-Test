library ieee;
use ieee.std_logic_1164.all;

entity circuit1good is
	port (A, B, C, D, E : in std_logic;
			Zgood : out std_logic);
end circuit1good;

architecture behaviour of circuit1good is

begin

	Zgood <= (not A or (B and C)) or (D or E); --logic from circuit given

end behaviour;