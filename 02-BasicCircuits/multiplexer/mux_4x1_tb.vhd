-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY mux_4x1_tb IS
  END mux_4x1_tb;

  ARCHITECTURE behavior OF mux_4x1_tb IS 

  -- Component Declaration
          COMPONENT mux_4to1
          PORT(
				I : in std_logic_vector(3 downto 0);
				S : in std_logic_vector(1 downto 0);
				Z : out std_logic
          );
          END COMPONENT;

  -- Inputs
          SIGNAL I :  std_logic_vector(3 downto 0) := "1010";
			 SIGNAL S :  std_logic_vector(1 downto 0) := "10";
			 
  -- Outputs 
			 SIGNAL Z :  std_logic;
          

  BEGIN

  -- Component Instantiation
          uut: mux_4to1 PORT MAP(
                  I => I,
                  S => S,
						Z => Z
          );


  --  Test Bench Statements
     tb: process
     BEGIN
	  
		   -- hold reset state for 100 ns.
			wait for 100 ns; 
		  
			I <= "1010";
			S <= "11";
			wait for 100 ns;
			S <= "00";
			wait for 100 ns;
			S <= "01";
		
			wait for 100 ns;
			
			I <= "0001";
			S <= "00";
			wait for 100 ns;
			S <= "11";
			wait for 100 ns;
			S <= "10";
			wait for 100 ns;
			S <= "01";

        
     END PROCESS tb;
  --  End Test Bench 

  END;
