--------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY booth_tb IS
END booth_tb;
 
ARCHITECTURE behavior OF booth_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT booth
    PORT(
         I : IN  std_logic_vector(3 downto 0);
         Q : IN  std_logic_vector(3 downto 0);
         O : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(3 downto 0) := (others => '0');
   signal Q : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: booth PORT MAP (
          I => I,
          Q => Q,
          O => O
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		I <= "0111";
		Q <= "0100";
	   wait for 100 ns;	
		I <= "0010";
		Q <= "1000";
	   wait for 100 ns;	
		I <= "1011";
		Q <= "0110";
	   wait for 100 ns;	
		I <= "1010";
		Q <= "1011";

      wait;
   end process;

END;
