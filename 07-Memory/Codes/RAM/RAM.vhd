----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity RAM is
	generic (
		-- params
		d : integer := 32;
		c : integer := 5;
		w : integer := 5
	);
	Port (
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		wr : in STD_LOGIC;
		rd : in STD_LOGIC;
		addr : in STD_LOGIC_VECTOR(c-1 downto 0);
		data : inout STD_LOGIC_VECTOR(w-1 downto 0)	
	);
end RAM;

architecture Behavioral of RAM is

type m is array (d-1 downto 0) of STD_LOGIC_VECTOR(w-1 downto 0);
signal memory : m;
signal tmp: STD_LOGIC_VECTOR(w-1 downto 0);

begin

	process (clk, rst, wr, rd, addr, data)
	begin
		if (rst = '0') then
		
			for i in 0 to (d-1) loop
				memory(i) <= STD_LOGIC_VECTOR(to_unsigned(i, memory(i)'length));
         end loop;
		
		elsif (rising_edge(clk)) then
		
			if (rd = '1' and wr = '0') then
				data <= memory(to_integer(unsigned(addr)));
			elsif (rd = '0' and wr = '1') then
				memory(to_integer(unsigned(addr))) <= data;
			end if;
		
		end if;
	end process;

end Behavioral;

