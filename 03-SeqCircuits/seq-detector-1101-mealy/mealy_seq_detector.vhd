----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mealy_seq_detector is
	Port (
		input: in STD_LOGIC;
		clk: in STD_LOGIC;
		output: out STD_LOGIC
	);
end mealy_seq_detector;

architecture Behavioral of mealy_seq_detector is
	type state is (s0, s1, s2, s3, s4);
	signal present_state : state := s0;
begin

	detecting_process : process(clk, input)
	begin
		-- default value of output (to avoid undifined value at the first 10ns of simulation)
		output <= '0'; 
		
		if rising_edge(clk) then
			case (present_state) is
				when s0 =>
					if (input = '1') then
						present_state <= s1;
						output <= '0';
					else 
						present_state <= s0;
						output <= '0';
					end if;
			
				when s1 => 
					if (input = '1') then
						present_state <= s2;
						output <= '0';
					else
						present_state <= s0;
						output <= '0';
					end if;
			
				when s2 => 
					if (input = '0') then
						present_state <= s3;
						output <= '0';
					else 
						present_state <= s2;
						output <= '0';
					end if;
				
				when s3 =>
					if (input = '1') then
						present_state <= s4;
						output <= '1';
					else
						present_state <= s0;
						output <= '0';
					end if;
			
				when s4 =>
					if (input = '1') then
						present_state <= s2;
						output <= '0';
					else 
						present_state <= s0;
						output <= '0';
					end if;
		
			end case;
		end if;
	end process;
end Behavioral;

