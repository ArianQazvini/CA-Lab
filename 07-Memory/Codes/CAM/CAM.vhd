----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CAM is
	generic (
		-- params
		d : integer := 64;
		c : integer := 6;
		w : integer := 6
	);
	Port (
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		wr : in STD_LOGIC;
		rd : in STD_LOGIC;
		data : in STD_LOGIC_VECTOR(w-1 downto 0);
		match : out std_logic
	);
end CAM;

architecture Behavioral of CAM is

type m is array (d-1 downto 0) of STD_LOGIC_VECTOR(w-1 downto 0);
signal memory : m;
constant empty : std_logic_vector(w-1 downto 0) := (others => 'U');


begin

	process (clk, rst, wr, rd, data) begin
	
		if (rst = '0') then
		
			for i in 0 to (d-1) loop
				memory(i) <= empty;
			end loop;
			match <= '0';
			
		elsif (rising_edge(clk)) then
		
			if (rd = '1') then
				match <= '0';
				for i in 0 to (d-1) loop
					if (data = memory(i)) then
						match <= '1';
						exit;
					end if;
				end loop;
				
			elsif (wr = '1') then
				for i in 0 to (d-1) loop
					if (memory(i) = data) then
						exit;
					elsif (memory(i) = empty) then
						memory(i) <= data;
						exit;
					end if;
				end loop;
			end if;
			
		end if;
	end process;
end Behavioral;

