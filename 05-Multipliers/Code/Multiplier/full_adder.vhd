----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
	Port (
		A    : in STD_LOGIC;
		B    : in STD_LOGIC;
		Cin  : in STD_LOGIC;
		Sum  : out STD_LOGIC;
		Cout : out STD_LOGIC
	);
end full_adder;

architecture Gatelevel of full_adder is
	
	component half_adder is 
		Port (
			A    : in STD_LOGIC;
			B    : in STD_LOGIC;
			Sum  : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component half_adder;
	
	signal c0, c1, c2 : STD_LOGIC;
	
begin

	half_adder0 : half_adder PORT MAP (A => A, B => B, Sum => c0, Cout => c1);
	half_adder1 : half_adder PORT MAP (A => c0, B => Cin, Sum => Sum, Cout => c2);
	Cout <= c1 or c2;

end Gatelevel;

