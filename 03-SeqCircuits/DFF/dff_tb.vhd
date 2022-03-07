--------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
--
-- Create Date:   00:18:23 03/07/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab3/Lab3/dff_tb.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dff
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
 
ENTITY dff_tb IS
END dff_tb;
 
ARCHITECTURE behavior OF dff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff
    PORT(
	   input : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		output : out std_logic
        );
    END COMPONENT;
    
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
    signal input : std_logic := '0';	 
    signal reset : std_logic := '0';	 
    signal clk : std_logic := '0';
    signal output : std_logic;
    constant clk_period : time := 30 ns;	 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff PORT MAP (
	 input => input,
    reset => reset,
    clk => clk,
    output => output	 
        );

   -- Clock process definitions
   clock_process :process
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
      wait for 300 ns;	

      wait for clk_period*10;

       reset <= '0';
		 input <= '0';
		 wait for 60 ns ;
		 reset <= '0';
		 input <= '1';
		 wait for 60 ns ;
       reset <= '1';
		 input <= '0';
		 wait for 60 ns ;
		 reset <= '1';
		 input <= '1';
		 wait for 60 ns ;
      wait;
   end process;

END;
