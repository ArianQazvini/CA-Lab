----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:57 04/18/2022 
-- Design Name: 
-- Module Name:    shiftReg - Behavioral 
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

entity shiftReg is
Port(para_in : IN STD_LOGIC_VECTOR(3 downto 0);
     lr : In STD_LOGIC_VECTOR(1 downto 0);
	  load,clk,rst : IN std_logic;
	  reg_out : OUT STD_LOGIC_VECTOR(3 downto 0)
     );
end shiftReg;

architecture Behavioral of shiftReg is
 signal internal : STD_LOGIC_VECTOR(3 downto 0);
begin
proc : process(clk)
   begin 
	if rising_edge(clk) then 
	  if(rst = '1') then 
	     internal <= "0000";
	  else 
      if(load = '1') then
         internal <= para_in ;
      else
        if(lr="01") then
		      internal(2 downto 0) <= internal(3 downto 1);
				internal(3) <= '0';
        elsif(lr = "10") then
            internal(2 downto 0) <= internal(3 downto 1);
        elsif(lr = "11") then 
            internal(3 downto 1) <= internal(2 downto 0);
            internal(0) <= '0';
        end if ;
      end if;
    end if;
   end if;
  reg_out <= internal;	
end process;	
end Behavioral;

