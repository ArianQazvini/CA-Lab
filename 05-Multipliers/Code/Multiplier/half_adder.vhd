----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
	Port (
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		Sum : out STD_LOGIC;
		Cout : out STD_LOGIC
	);
end half_adder;

architecture Gatelevel of half_adder is

begin

	Sum <= A xor B;
	Cout <= A and B;

end Gatelevel;

