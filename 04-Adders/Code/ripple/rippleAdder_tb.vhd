--------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
--
-- Create Date:   08:35:29 03/14/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab4/Lab4/rippleAdder_tb.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rippleAdder
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
 
ENTITY rippleAdder_tb IS
END rippleAdder_tb;
 
ARCHITECTURE behavior OF rippleAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rippleAdder
    PORT(
         in1 : IN  std_logic_vector(3 downto 0);
         in2 : IN  std_logic_vector(3 downto 0);
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(3 downto 0) := (others => '0');
   signal in2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rippleAdder PORT MAP (
          in1 => in1,
          in2 => in2,
          sum => sum,
          Cout => Cout
        );

   -- Clock process definitions
 --  <clock>_process :process
  -- begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		in1<= "0000";
		in2<= "1111";
		wait for 50 ns;
		in1<= "1010";
		in2<= "1110";
		wait for 50 ns;
		in1<= "1000";
		in2<= "0011";
		wait for 50 ns;
		in1<= "0110";
		in2<= "0001";
		wait for 50 ns;
		in1<= "0000";
		in2<= "0000";
		wait for 50 ns;
		in1<= "0001";
		in2<= "0001";
		wait for 50 ns;
		in1<= "0011";
		in2<= "0011";
		wait for 50 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
