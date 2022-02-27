LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY decoder_2x4_tb IS
END decoder_2x4_tb;
 
ARCHITECTURE behavior OF decoder_2x4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_2x4
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         Z : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(1 downto 0) := "11";

 	--Outputs
   signal Z : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_2x4 PORT MAP (
          A => A,
          Z => Z
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
	
      wait for 100 ns;	
		A <= "10";
		wait for 100 ns;
		A <= "01";
		wait for 100 ns;
		A <= "00";

   end process;

END;
