----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FA is
	Port (
		A    : in STD_LOGIC;
		B    : in STD_LOGIC;
		Cin  : in STD_LOGIC;
		Sum  : out STD_LOGIC;
		Cout : out STD_LOGIC
	);
end FA;

architecture Gatelevel of FA is
	
	component HA is 
		Port (
			A    : in STD_LOGIC;
			B    : in STD_LOGIC;
			Sum  : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component HA;
	
	signal c0, c1, c2 : STD_LOGIC;
	
begin

	HA0 : HA PORT MAP (A => A, B => B, Sum => c0, Cout => c1);
	HA1 : HA PORT MAP (A => c0, B => Cin, Sum => Sum, Cout => c2);
	Cout <= c1 or c2;

end Gatelevel;

