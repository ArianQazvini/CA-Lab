--------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY CLA_tb IS
END CLA_tb;
 
ARCHITECTURE behavior OF CLA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLA
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          sum => sum,
          Cout => Cout
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		A <= "1000";
		B <= "0010";
		Cin <= '0';
		wait for 100 ns;

		A <= "0001";
		B <= "1000";
		Cin <= '0';
		wait for 100 ns;

		A <= "0100";
		B <= "0101";
		Cin <= '1';
		wait for 100 ns;

		A <= "1111";
		B <= "1110";
		Cin <= '0';
		wait for 100 ns;
    
		A <= "1010";
		B <= "1010";
		Cin <= '1';
		wait for 100 ns;
		
   end process;

END;
