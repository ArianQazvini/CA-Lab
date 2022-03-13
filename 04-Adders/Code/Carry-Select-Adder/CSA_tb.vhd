--------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY CSA_tb IS
END CSA_tb;
 
ARCHITECTURE behavior OF CSA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CSA
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
    );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CSA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;
		Cin <= '0';
		A <= "1011";
		B <= "1001";
 
		wait for 100 ns;
		Cin <= '0';
		A <= "0001";
		B <= "1010";
 
		wait for 100 ns;
		Cin <= '0';
		A <= "0111";
		B <= "1111";

		wait for 100 ns;
		Cin <= '1';
		A <= "0101";
		B <= "1101";
		
      wait;
   end process;

END;
