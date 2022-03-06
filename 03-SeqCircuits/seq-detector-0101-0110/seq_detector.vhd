----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity seq_detector is
	Port (
		input : in STD_LOGIC;
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		output : out STD_LOGIC
	);
end seq_detector;

architecture Behavioral of seq_detector is
	type state is (s0, s1, s2, s3, s4, s5, s6);
	signal present_state, next_state : state := s0;
	
begin

	clock_process : process (clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				present_state <= s0;
			else
				present_state <= next_state;
			end if;
		end if;
	end process;
	
	detecting_process : process (input, present_state)
	begin
		case present_state is
		
			when s0 =>
				if (input = '0') then
					next_state <= s1;
				else
					next_state <= s0;
				end if;
				
				
			when s1 =>
				if (input = '0') then
					next_state <= s1;
				else
					next_state <= s2;
				end if;
				
			when s2 =>
				if (input = '0') then
					next_state <= s3;
				else
					next_state <= s4;
				end if;
				
			when s3 =>
				if (input = '0') then
					next_state <= s1;
				else
					next_state <= s5;
				end if;
				
			when s4 =>
				if (input = '0') then
					next_state <= s6;
				else
					next_state <= s0;
				end if;
				
			when s5 =>
				if (input = '0') then
					next_state <= s3;
				else
					next_state <= s4;
				end if;
				
			when s6 =>
				if (input = '0') then
					next_state <= s1;
				else
					next_state <= s2;
				end if;
		
		end case;
	end process;
	
	output <= '1' when (present_state = s5 or present_state = s6) else '0';

end Behavioral;

