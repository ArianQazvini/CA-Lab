--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:08 04/18/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab6/Lab6/topModule_tb.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: topModule
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
 
ENTITY topModule_tb IS
END topModule_tb;
 
ARCHITECTURE behavior OF topModule_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT topModule
    PORT(
         para_in : IN  std_logic_vector(3 downto 0);
         lr : IN  std_logic_vector(1 downto 0);
         load : IN  std_logic;
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         number : OUT  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal para_in : std_logic_vector(3 downto 0) := (others => '0');
   signal lr : std_logic_vector(1 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal number : std_logic_vector(3 downto 0);
   signal output : std_logic_vector(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: topModule PORT MAP (
          para_in => para_in,
          lr => lr,
          load => load,
          clk_in => clk_in,
          reset => reset,
          number => number,
          output => output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
