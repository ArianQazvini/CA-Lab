----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2x1 is
	Port (
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		sel : in STD_LOGIC;
		O : out STD_LOGIC
	);
end mux_2x1;

architecture Behavioral of mux_2x1 is

begin

	process (A, B, sel)
		begin 
			if sel = '0' then
				O <= A;
			else 
				O <= B;
			end if;
	end process;

end Behavioral;

