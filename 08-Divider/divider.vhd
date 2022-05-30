----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:39 05/16/2022 
-- Design Name: 
-- Module Name:    divider - Behavioral 
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
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    Port (dividend : IN  std_logic_vector(7 downto 0);
         divisor : IN  std_logic_vector(3 downto 0);
         quotient : OUT  std_logic_vector(3 downto 0);
         remainder : OUT  std_logic_vector(3 downto 0);
         overFlow : OUT  std_logic
        );
end divider;


architecture Behavioral of divider is
--signal internal : STD_LOGIC_VECTOR(3 downto 0);
	-- signal E : STD_LOGIC;
	-- signal B : STD_LOGIC_VECTOR(3 downto 0);
	-- signal R : STD_LOGIC_VECTOR(3 downto 0);
	-- signal A : STD_LOGIC_VECTOR(3 downto 0); 
begin
   process(dividend, divisor) is
	 variable E : STD_LOGIC;
	 variable B : STD_LOGIC_VECTOR(3 downto 0);
	 variable R : STD_LOGIC_VECTOR(3 downto 0);
	 variable A : STD_LOGIC_VECTOR(3 downto 0); 
	------------------
 begin	
   A := dividend(3 downto 0);	
   R := dividend(7 downto 4);	
   B := divisor; 
   -----------------
   if(B = "0000") then 
	  overFlow <= '1';
	  remainder <= "0000";
	  quotient <= "0000";
	elsif(R >= B) then 
	  overFlow <= '1';
	  remainder <= "0000";
	  quotient <= "0000";
	else
     overFlow <= '0';
     for counter in 0 to 3 loop
        E := R(3);
      --  internal(3 downto 1 ) <= internal(2 downto 0);
        --internal(0) <= A(3);
		  R(3 downto 1 ) := R(2 downto 0); -- shift left
        R(0) := A(3);
		  A(3 downto 1) := A(2 downto 0);
		  A(0) := '0';
		  if(R>=B) then
		     R := R + (not B ) + "0001";
           A(0) := '1';
		  else 
           A(0) := '0';
        end if;
	 end loop;
    remainder <= R;
    quotient <= A;
  end if ;
 end process;
 --remainder <= internal;
 
		  
	  
     	


end Behavioral;

