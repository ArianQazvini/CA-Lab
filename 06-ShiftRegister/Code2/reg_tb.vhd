--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:15:34 04/18/2022
-- Design Name:   
-- Module Name:   C:/Users/Arian/Desktop/Lab6/Lab6/reg_tb.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shiftReg
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
 
ENTITY reg_tb IS
END reg_tb;
 
ARCHITECTURE behavior OF reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shiftReg
    PORT(
         para_in : IN  std_logic_vector(3 downto 0);
         lr : IN  std_logic_vector(1 downto 0);
         load : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         reg_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal para_in : std_logic_vector(3 downto 0) := (others => '0');
   signal lr : std_logic_vector(1 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shiftReg PORT MAP (
          para_in => para_in,
          lr => lr,
          load => load,
          clk => clk,
          rst => rst,
          reg_out => reg_out
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
     

      -- insert stimulus here 
		para_in <= "1010";
		lr <= "11";
		load <= '1';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "11";
		load <= '0';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "10";
		load <= '0';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "01";
		load <= '0';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "00";
		load <= '0';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "00";
		load <= '0';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "11";
		load <= '1';
		rst <= '0';
		wait for 60 ns;
		para_in <= "1010";
		lr <= "11";
		load <= '0';
		rst <= '1';
		wait for 60 ns;
      wait;
   end process;

END;
