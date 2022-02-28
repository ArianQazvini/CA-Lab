--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:44:05 02/28/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab2/Lab2/comparator_tb.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator
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
 
ENTITY comparator_tb IS
END comparator_tb;
 
ARCHITECTURE behavior OF comparator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 --    A,B,G,L,E : in std_logic;
--	 A_GT_B,A_EQ_B,A_LT_B : out std_logic
    COMPONENT comparator
    PORT(
	    A : IN std_logic;
		 B : IN std_logic; 
		 G : IN std_logic;
		 L : IN std_logic;
		 E : IN std_logic;
		 A_GT_B : OUT  std_logic;
		 A_EQ_B : OUT  std_logic;
		 A_LT_B : OUT  std_logic
        );
    END COMPONENT;
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal G : std_logic := '0';
   signal L : std_logic := '0';
   signal E : std_logic := '0';
	--------------------
	signal A_GT_B : std_logic;
	signal A_EQ_B : std_logic;
	signal A_LT_B : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator PORT MAP (
	     A => A,
	     B => B,
	     G => G,
	     L => L,
	     E => E,
		  A_GT_B => A_GT_B,
		  A_EQ_B => A_EQ_B,
		  A_LT_B => A_LT_B
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
       A <= '0';
       B <= '0';
       G <= '0';
       L <= '0';
       E <= '0';
		 wait for 50 ns;
		 A <= '0';
       B <= '1';
       G <= '0';
       L <= '0';
       E <= '0';
		 wait for 50 ns;
		 A <= '1';
       B <= '0';
       G <= '0';
       L <= '0';
       E <= '0';
		 wait for 50 ns;
		 A <= '1';
       B <= '1';
       G <= '0';
       L <= '0';
       E <= '0';
		 wait for 50 ns;
		 A <= '1';
       B <= '1';
       G <= '0';
       L <= '1';
       E <= '0';
		 wait for 50 ns;
		 A <= '1';
       B <= '1';
       G <= '0';
       L <= '0';
       E <= '1';
		 wait for 50 ns;
      wait;
   end process;

END;
