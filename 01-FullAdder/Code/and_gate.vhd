----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: 
-- 
-- Create Date:    11:36:35 02/21/2022 
-- Design Name: 
-- Module Name:    and_gate - Behavioral 
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

entity and_gate is

	Port(
 	A, B: in std_logic;
 	C : out std_logic
 	);

end and_gate;

architecture Behavioral of and_gate is

begin

 	C <= A and B;

end Behavioral;

