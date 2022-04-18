----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- We use a counter to divide our clock for simulating delay
entity clock_divider is
	Port (
		clk_in  : in STD_LOGIC;
		reset   : in STD_LOGIC;
		clk_out : out STD_LOGIC
	);
end clock_divider;

architecture Behavioral of clock_divider is

	signal count : integer := 1;
	signal temp  : STD_LOGIC := '1';

begin

	process (clk_in, reset)
	begin
		
		if (reset = '1') then
			count <= 1;
			temp  <= '0';
		elsif (clk_in'event and clk_in = '1') then
			count <= count + 1;
			if (count = 29) then -- 58 / 2 = 29
				temp  <= not temp;
				count <= 1;
			end if;
		end if;
		clk_out <= temp;
		
	end process;

end Behavioral;

