--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:27:38 04/04/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab5/lab5/array_tb.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arrayMultiplier
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
 
ENTITY array_tb IS
END array_tb;
 
ARCHITECTURE behavior OF array_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arrayMultiplier
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         p : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arrayMultiplier PORT MAP (
          a => a,
          b => b,
          p => p
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      a <= "0000";
		b <= "1111";
		wait for 50 ns;
      a <= "1000";
		b <= "1000";
		wait for 50 ns;
		a <= "1100";
		b <= "1001";
		wait for 50 ns;
      a <= "0001";
		b <= "0001";
		wait for 50 ns;      
		a <= "0011";
		b <= "1100";
		wait for 50 ns;
		a <= "1111";
		b <= "1111";
		wait for 50 ns;
		a <= "0010";
		b <= "1000";
		wait for 50 ns;
		a <= "0101";
		b <= "1010";
		wait for 50 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
