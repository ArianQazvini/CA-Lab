--------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY mealy_seq_detector_tb IS
END mealy_seq_detector_tb;
 
ARCHITECTURE behavior OF mealy_seq_detector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mealy_seq_detector
    PORT(
         input : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mealy_seq_detector PORT MAP (
          input => input,
          reset => reset,
          clk => clk,
          output => output
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

		wait for 100 ns;
		reset <= '0';
		
		--011011010011011
		reset <= '1';
		input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period*2;
		
		input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period*2;
		
		input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period;
		
		input <= '0';
		wait for clk_period*2;

		input <= '1';
		wait for clk_period*2;
		
		input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period*2;

      wait;
   end process;

END;
