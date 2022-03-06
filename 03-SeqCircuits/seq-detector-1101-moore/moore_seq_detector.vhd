----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity moore_seq_detector is
	Port (
		input : in STD_LOGIC;
		clk : in STD_LOGIC;
		output : out STD_LOGIC
	);
end moore_seq_detector;

architecture Behavioral of moore_seq_detector is
	type state is (s0, s1, s2, s3, s4);
	signal present_state : state := s0;
	signal next_state : state := s0;
begin

	clock_process : process (clk)
	begin
		if(Clk'event and Clk = '1') then
			present_state <= next_state;
		end if;
	end process;

	detecting_process : process(input, present_state)
	begin
		case present_state is
		
			when s0 =>
				if (input = '0') then
					next_state <= s0;
				else 
					next_state <= s1;
				end if;
				
			when s1 =>
				if (input = '0') then
					next_state <= s0;
				else 
					next_state <= s2;
				end if;
				
			when s2 =>
				if (input = '0') then
					next_state <= s3;
				else 
					next_state <= s2;
				end if;
				
			when s3 =>
				if (input = '0') then
					next_state <= s0;
				else 
					next_state <= s4;
				end if;
				
			when s4 =>
				if (input = '0') then
					next_state <= s0;
				else 
					next_state <= s2;
				end if;
				
		end case; 
	end process;
	
	output <= '1' when present_state = s4 else '0';

end Behavioral;

