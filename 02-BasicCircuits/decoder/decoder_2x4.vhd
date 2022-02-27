library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2x4 is
	Port(
		A : in std_logic_vector(1 downto 0);
		Z : out std_logic_vector(3 downto 0)
	);
end decoder_2x4;

architecture gatelevel of decoder_2x4 is

begin
	Z(0) <= (not A(0)) and (not A(1));
	Z(1) <= A(0) and (not A(1));
	Z(2) <= (not A(0)) and A(1);
	Z(3) <= A(0) and A(1);
end gatelevel;

