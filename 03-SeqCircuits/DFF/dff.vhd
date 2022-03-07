----------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
-- 
-- Create Date:    00:07:25 03/07/2022 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dff is
 port(
     input : in std_logic;
	  reset : in std_logic;
	  clk : in std_logic;
	  output : out std_logic
	  );
end dff;

architecture Behavioral of dff is

begin
   proc : process(clk ,reset)
	  begin
	   if(reset = '0') then output <= '0'; 
		elsif(rising_edge(clk)) then output <= input;
      end if;
	end process;	
end Behavioral;

