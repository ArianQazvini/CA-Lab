library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity or_gate is
	Port ( A : in STD_LOGIC;
			 B : in STD_LOGIC;
			 C : out STD_LOGIC
	);
end or_gate;

architecture gatelevel of or_gate is

begin
	C <= A or B;
end gatelevel;

