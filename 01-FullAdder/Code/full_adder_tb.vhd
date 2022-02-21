--------------------------------------------------------------------------------
-- Company: AUT
-- Engineer:
--
-- Create Date:   11:49:26 02/21/2022
-- Design Name:   
-- Module Name:   E:/Kimia_ISE_Projects/CA-Lab-01-FullAdder/full_adder_tb.vhd
-- Project Name:  CA-Lab-01-FullAdder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          i0 => i0,
          i1 => i1,
          cin => cin,
          s => s,
          cout => cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

      -- insert stimulus here 
		i0 <= '1';
		i1 <= '0';
		cin <= '0';
		wait for 50 ns;
 
		i0 <= '1';
		i1 <= '1';
		cin <= '0';
		wait for 50 ns;
 
		i0 <= '1';
		i1 <= '1';
		cin <= '1';
		wait for 50 ns;
 
		i0 <= '0';
		i1 <= '1';
		cin <= '0';
		wait for 50 ns;
 
		i0 <= '0';
		i1 <= '1';
		cin <= '1';
		
   end process;

END;
