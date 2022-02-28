--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:39:35 02/28/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab2/Lab2/comparator4bit_tb.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator4bit
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
 
ENTITY comparator4bit_tb IS
END comparator4bit_tb;
 
ARCHITECTURE behavior OF comparator4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator4bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         a_GT_b : OUT  std_logic;
         a_EQ_b : OUT  std_logic;
         a_LT_b : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal a_GT_b : std_logic;
   signal a_EQ_b : std_logic;
   signal a_LT_b : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator4bit PORT MAP (
          a => a,
          b => b,
          a_GT_b => a_GT_b,
          a_EQ_b => a_EQ_b,
          a_LT_b => a_LT_b
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      a(3) <= '1';
      a(2) <= '0';
      a(1) <= '0';
      a(0) <= '0';
		-------
      b(3) <= '0';
      b(2) <= '0';
      b(1) <= '0';
      b(0) <= '0';
      wait for 20 ns;
		a(3) <= '0';
      a(2) <= '0';
      a(1) <= '0';
      a(0) <= '0';
		-------
      b(3) <= '1';
      b(2) <= '0';
      b(1) <= '0';
      b(0) <= '0';
      wait for 20 ns;
		a(3) <= '1';
      a(2) <= '0';
      a(1) <= '0';
      a(0) <= '0';
		-------
      b(3) <= '1';
      b(2) <= '0';
      b(1) <= '0';
      b(0) <= '0';
      wait for 20 ns;
		a(3) <= '1';
      a(2) <= '1';
      a(1) <= '0';
      a(0) <= '0';
		-------
      b(3) <= '1';
      b(2) <= '0';
      b(1) <= '1';
      b(0) <= '0';
      wait for 20 ns;
   end process;

END;
