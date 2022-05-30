--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:32:10 05/16/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab8/lab8/divider_tb.vhd
-- Project Name:  lab8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divider
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY divider_tb IS
END divider_tb;
 
ARCHITECTURE behavior OF divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider
    PORT(
         dividend : IN  std_logic_vector(7 downto 0);
         divisor : IN  std_logic_vector(3 downto 0);
         quotient : OUT  std_logic_vector(3 downto 0);
         remainder : OUT  std_logic_vector(3 downto 0);
         overFlow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal dividend : std_logic_vector(7 downto 0) := (others => '0');
   signal divisor : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal quotient : std_logic_vector(3 downto 0);
   signal remainder : std_logic_vector(3 downto 0);
   signal overFlow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider PORT MAP (
          dividend => dividend,
          divisor => divisor,
          quotient => quotient,
          remainder => remainder,
          overFlow => overFlow
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      dividend <= "00100101";
      divisor <= "0100";
		wait for 30 ns;
      dividend <= "00110101";
      divisor <= "0100";
		wait for 30 ns;
		dividend <= "11111111";
      divisor <= "0100";
		wait for 30 ns;
		dividend <= "00011001";
      divisor <= "0101";
		wait for 30 ns;
		dividend <= "00011001";
      divisor <= "0111";
      wait for 30 ns;		


      -- insert stimulus here 

      wait;
   end process;

END;
