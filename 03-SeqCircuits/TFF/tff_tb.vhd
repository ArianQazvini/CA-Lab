--------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini 
--
-- Create Date:   01:39:41 03/07/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab3/Lab3/tff_tb.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tff
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
 
ENTITY tff_tb IS
END tff_tb;
 
ARCHITECTURE behavior OF tff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tff
    PORT(
         T : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tff PORT MAP (
          T => T,
          reset => reset,
          clk => clk,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
      reset <= '0';
		T <= '0';
		wait for 60 ns;
		reset <= '0';
		T <= '1';
		wait for 60 ns;
		reset <= '1';
		T <= '1';
		wait for 60 ns;
		reset <= '1';
		T <= '0';
		wait for 60 ns;
		reset <= '1';
		T <= '1';
		wait for 60 ns;
      wait;
   end process;

END;
