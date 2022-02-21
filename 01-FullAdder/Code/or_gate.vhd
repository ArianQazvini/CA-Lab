----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: 
-- 
-- Create Date:    11:38:18 02/21/2022 
-- Design Name: 
-- Module Name:    or_gate - Behavioral 
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

entity or_gate is

	Port(
 	A, B: in std_logic;
 	C : out std_logic
 	);

end or_gate;

architecture Behavioral of or_gate is

begin

 	C <= A or B;

end Behavioral;

