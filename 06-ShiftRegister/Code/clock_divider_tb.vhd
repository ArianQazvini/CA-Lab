--------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
--
-- Create Date:   20:07:11 04/09/2022
-- Design Name:   
-- Module Name:   E:/Kimia_ISE_Projects/CA-Lab-06-ShiftRegister/ShiftRegister/clock_divider_tb.vhd
-- Project Name:  ShiftRegister
-- Target Device:  
-- Tool versions:  
-- Description:   
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY clock_divider_tb IS
END clock_divider_tb;
 
ARCHITECTURE behavior OF clock_divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_divider
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 34 ms; -- 1 / (58 / 2) = 0.017s * 2 -> 34ms
   --constant clk_out_period : time := 17 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_divider PORT MAP (
          clk_in => clk_in,
          reset => reset,
          clk_out => clk_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 


END;
