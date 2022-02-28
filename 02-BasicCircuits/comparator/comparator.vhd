----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:49:34 02/27/2022 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

entity comparator is
Port(
    A,B,G,L,E : in std_logic;
	 A_GT_B,A_EQ_B,A_LT_B : out std_logic
	 );
end comparator;

architecture Behavioral of comparator is
 Signal sig1,sig2,sig3,sig4,sig5,sig6,sig7 : std_logic ;
begin
  sig1 <= not A ;
  sig2 <= not B ;
  sig3 <= A xnor B ;
  sig4 <= sig3 and L;
  sig5 <= sig1 and B;
  sig6 <= sig3 and G;
  sig7 <= A and sig2;
  A_EQ_B <= E and sig3;
  A_LT_B <= sig4 or sig5;
  A_GT_B <= sig6 or sig7;
  ---------------------
 
end Behavioral;

