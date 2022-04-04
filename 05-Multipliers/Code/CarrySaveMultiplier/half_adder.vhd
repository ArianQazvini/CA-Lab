----------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
-- 
-- Create Date:    01:12:18 03/14/2022 
-- Design Name: 
-- Module Name:    half_adder - Behavioral 
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

entity half_adder is
 	Port(
 	in1, in2: in std_logic;
 	out1, out2 : out std_logic
 	);
end half_adder;

architecture Behavioral of half_adder is

begin
    out1 <= in1 xor in2 ;
	 out2 <= in1 and in2;
   
end Behavioral;

