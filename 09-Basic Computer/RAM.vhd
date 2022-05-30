----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:05 06/17/2021 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity RAM is
port(
 --write
	w : in std_logic;
 --read
	r : in std_logic;
 --reset
   rst : in std_logic;
 --rising edge clk
	clk: in std_logic;
 --address
	addr : in std_logic_vector(4 downto 0);
 --datain
	data_in : in std_logic_vector(7 downto 0);
 --data out
	data_out : out std_logic_vector(7 downto 0)
	);
	
end RAM;



architecture RAM_arch of RAM is

type mem_type is array (31 downto 0) of std_logic_vector(7 downto 0);
signal RandomAccessMemBlock : mem_type := ( 
											"10111111" ,"00101110" ,"01001001" ,"01111100", 
											"10001001" ,"10101010" ,"11001001" ,"11101000",
											"11000111" ,"10100110" ,"10000101" ,"01100100",
											"01000011" ,"00110010" ,"00001001" ,"11100000",
											"00011101" ,"00111010" ,"01010101" ,"01111100",
											"10001011" ,"10111010" ,"11011001" ,"11111010",
											"11010111" ,"10111110" ,"10010101" ,"01110100",
											"01010011" ,"00110000" ,"00010101" ,"11110010" 
											);

begin
		
	process (clk)
		begin
			if rst = '0' then
			  data_out<="00000000";
			  
				for i in 0 to 31 loop
					RandomAccessMemBlock(i) <= RandomAccessMemBlock(i) + conv_std_logic_vector(i,8);
				end loop;
				
			elsif rising_edge(clk) 
			  then
				if (w = '1') and (r = '0') --write
				 then
					RandomAccessMemBlock(conv_integer(addr)) <= data_in;
					
				elsif (w = '0') and (r = '1') --read
				  then
					data_out <= RandomAccessMemBlock(conv_integer(addr));
				
				end if;
			end if;
		end process;

end RAM_arch;