----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CSA is
	Port (
		A    : in STD_LOGIC_VECTOR (3 downto 0);
		B    : in STD_LOGIC_VECTOR (3 downto 0);
		Cin  : in STD_LOGIC;
		Sum  : out STD_LOGIC_VECTOR (3 downto 0);
		Cout : out STD_LOGIC
	);
end CSA;

architecture Behavioral of CSA is

	component FA is
		Port (
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			Sum : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component FA;
	
	component mux_2x1 is
		 Port (
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			Sel : in STD_LOGIC;
			O : out STD_LOGIC
		 );
	end component mux_2x1;
	
	signal Sum0, Sum1 : STD_LOGIC_VECTOR (3 downto 0);
	signal c0, c1     : STD_LOGIC_VECTOR (3 downto 0);

begin

	-- two ripple carry adders
	FA0 : FA PORT MAP (A => A(0), B => B(0), Cin => '0',   Sum => Sum0(0), Cout => c0(0));
	FA1 : FA PORT MAP (A => A(1), B => B(1), Cin => c0(0), Sum => Sum0(1), Cout => c0(1));
	FA2 : FA PORT MAP (A => A(2), B => B(2), Cin => c0(1), Sum => Sum0(2), Cout => c0(2));
	FA3 : FA PORT MAP (A => A(3), B => B(3), Cin => c0(2), Sum => Sum0(3), Cout => c0(3));
	
	FA4 : FA PORT MAP (A => A(0), B => B(0), Cin => '1',   Sum => Sum1(0), Cout => c1(0));
	FA5 : FA PORT MAP (A => A(1), B => B(1), Cin => c1(0), Sum => Sum1(1), Cout => c1(1));
	FA6 : FA PORT MAP (A => A(2), B => B(2), Cin => c1(1), Sum => Sum1(2), Cout => c1(2));
	FA7 : FA PORT MAP (A => A(3), B => B(3), Cin => c1(2), Sum => Sum1(3), Cout => c1(3));
	
	-- multiplexers for calculating the final summation
	MUX0 : mux_2x1 PORT MAP (A => Sum0(0), B => Sum1(0), Sel => Cin, O => Sum(0));
	MUX1 : mux_2x1 PORT MAP (A => Sum0(1), B => Sum1(1), Sel => Cin, O => Sum(1));
	MUX2 : mux_2x1 PORT MAP (A => Sum0(2), B => Sum1(2), Sel => Cin, O => Sum(2));
	MUX3 : mux_2x1 PORT MAP (A => Sum0(3), B => Sum1(3), Sel => Cin, O => Sum(3));
	
	-- multiplexers for calculating the final carry out
	MUX4 : mux_2x1 PORT MAP (A => c0(3), B => c1(3), Sel => Cin, O => Cout);

end Behavioral;

