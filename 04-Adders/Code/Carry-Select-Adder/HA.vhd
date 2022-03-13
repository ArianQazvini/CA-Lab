----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HA is
	Port (
		A    : in STD_LOGIC;
		B    : in STD_LOGIC;
		Sum  : out STD_LOGIC;
		Cout : out STD_LOGIC
	);
end HA;

architecture Gatelevel of HA is

begin
	
	Sum  <= A xor B;
	Cout <= A and B;

end Gatelevel;

