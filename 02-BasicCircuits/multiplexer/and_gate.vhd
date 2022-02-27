library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and_gate is
	Port ( A : in STD_LOGIC;
			 B : in STD_LOGIC;
			 C : out STD_LOGIC
	);
end and_gate;

architecture gatelevel of and_gate is

begin
	C <= A and B;
end gatelevel;

