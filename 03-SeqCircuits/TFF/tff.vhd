----------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
-- 
-- Create Date:    00:52:24 03/07/2022 
-- Design Name: 
-- Module Name:    tff - Behavioral 
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

entity tff is
 port(
     T : in std_logic;
	  reset : in std_logic;
	  clk : in std_logic;
	  Q : out std_logic
	  );
end tff;

architecture Behavioral of tff is
signal temp : std_logic;
begin
    proc : process(clk ,reset)
	  begin
	   if(reset = '0') then temp <= '0'; 
		elsif(rising_edge(clk) and T ='1') then temp <= not temp;
      end if;
	end process;
   Q <= temp;
end Behavioral;

