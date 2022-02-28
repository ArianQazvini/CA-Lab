----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:58:52 02/28/2022 
-- Design Name: 
-- Module Name:    Comparator4bit - Behavioral 
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

entity Comparator4bit is
	Port(
	a, b: in std_logic_vector(3 downto 0);
	a_GT_b : out  STD_LOGIC;
   a_EQ_b : out  STD_LOGIC;
   a_LT_b : out  STD_LOGIC);
end Comparator4bit;

architecture Behavioral of Comparator4bit is
 component comparator is 
    Port(
    A,B,G,L,E : in std_logic;
	 A_GT_B,A_EQ_B,A_LT_B : out std_logic
	 );
end component comparator;
	signal A_GT_B0, A_EQ_B0, A_LT_B0: std_logic;
	signal A_GT_B1, A_EQ_B1, A_LT_B1: std_logic;
	signal A_GT_B2, A_EQ_B2, A_LT_B2: std_logic;
begin
  Comparator3 : comparator port map (A => a(3) , B => b(3) ,G => A_GT_B2 ,L => A_LT_B2 , E => A_EQ_B2 , A_GT_B => a_GT_b , A_EQ_B => a_EQ_b , A_LT_B => a_LT_b); 
  Comparator2 : comparator port map (A => a(2) , B => b(2) ,G => A_GT_B1 ,L => A_LT_B1 , E => A_EQ_B1 , A_GT_B =>  A_GT_B2 , A_EQ_B => A_EQ_B2 , A_LT_B =>A_LT_B2); 
  Comparator1 : comparator port map (A => a(1) , B => b(1) ,G => A_GT_B0 ,L => A_LT_B0 , E => A_EQ_B0 , A_GT_B => A_GT_B1 , A_EQ_B => A_EQ_B1 , A_LT_B => A_LT_B1); 
  Comparator0 : comparator port map (A => a(0) , B => b(0) ,G => '0' ,L => '0' , E => '1' , A_GT_B => A_GT_B0 , A_EQ_B => A_EQ_B0 , A_LT_B => A_LT_B0); 

end Behavioral;

