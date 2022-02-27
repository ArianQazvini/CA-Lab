----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: 
-- 
-- Create Date:    11:39:51 02/21/2022 
-- Design Name: 
-- Module Name:    xor_gate - Behavioral 
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

entity xor_gate is

	Port(
 	A, B: in std_logic;
 	C : out std_logic
 	);

end xor_gate;

architecture Behavioral of xor_gate is

begin

 	C <= A xor B;

end Behavioral;

