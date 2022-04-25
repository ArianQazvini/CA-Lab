--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:16:52 04/18/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab6/Lab6/seven_segment_tb.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seven_segment
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

 
ENTITY seven_segment_tb IS
END seven_segment_tb;
 
ARCHITECTURE behavior OF seven_segment_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seven_segment
    PORT(
         bcd_number : IN  std_logic_vector(3 downto 0);
         number : OUT  std_logic_vector(3 downto 0);
         O : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal bcd_number : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal number : std_logic_vector(3 downto 0);
   signal O : std_logic_vector(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seven_segment PORT MAP (
          bcd_number => bcd_number,
          number => number,
          O => O
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 30 ns;	

      -- insert stimulus here 
		bcd_number <= "0000";
		wait for 30 ns;
		
		bcd_number <= "1100";
		wait for 30 ns;
		
		bcd_number <= "1010";
		wait for 30 ns;

      wait;
   end process;

END;
