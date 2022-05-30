--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY CAM_tb IS
END CAM_tb;
 
ARCHITECTURE behavior OF CAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAM
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         match : OUT  std_logic;
         data : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(5 downto 0);

 	--Outputs
   signal match : std_logic;

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM PORT MAP (
          clk => clk,
          rst => rst,
          wr => wr,
          rd => rd,
          match => match,
          data => data
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
		rst <= '0';
		
      wait for clk_period;
		rst <= '1';
		wr <= '0';
		rd <= '1';
		data <= "000101"; 
		
      wait for clk_period;
		wr <= '1';
		rd <= '0';
		data <= "000000"; 
		-- mem(0): 000000
		
	   wait for clk_period;	
		wr <= '1';
		rd <= '0';
		data <= "001111"; 
		-- mem(1): 001111
		
		wait for clk_period;
		wr <= '0';
		rd <= '1';
		data <= "000101"; 
		-- match: 0

      wait for clk_period;
		wr <= '0';
		rd <= '1';
		data <= "000000"; 
		-- match: 1
		
		wait for clk_period;
		wr <= '0';
		rd <= '1';
		data <= "001111"; 
		-- match: 1
     
      wait;
   end process;

END;
