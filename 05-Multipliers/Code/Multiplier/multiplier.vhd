----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier is
	Port (
		A : in STD_LOGIC_VECTOR(3 downto 0);
		B : in STD_LOGIC_VECTOR(3 downto 0);
		P : out STD_LOGIC_VECTOR(7 downto 0)
	);
end multiplier;

architecture Gatelevel of multiplier is

	component full_adder is
		Port (
			A    : in STD_LOGIC;
			B    : in STD_LOGIC;
			Cin  : in STD_LOGIC;
			Sum  : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component full_adder;
	
	component half_adder is
		Port (
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			Sum : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component half_adder;
	
	signal and_gate : STD_LOGIC_VECTOR(15 downto 0);
	signal add0, add1: STD_LOGIC_VECTOR(6 downto 0);
	signal add3: STD_LOGIC_VECTOR(2 downto 0);

begin

	and_gate(0) <= A(0) and B(0); 
	and_gate(1) <= A(0) and B(1);
	and_gate(2) <= A(0) and B(2);
	and_gate(3) <= A(0) and B(3);
	
	and_gate(4) <= A(1) and B(0);
	and_gate(5) <= A(1) and B(1);
	and_gate(6) <= A(1) and B(2);
	and_gate(7) <= A(1) and B(3);
	
	and_gate(8) <= A(2) and B(0);
	and_gate(9) <= A(2) and B(1);
	and_gate(10) <= A(2) and B(2);
	and_gate(11) <= A(2) and B(3);
	
	and_gate(12) <= A(3) and B(0);
	and_gate(13) <= A(3) and B(1);
	and_gate(14) <= A(3) and B(2);
	and_gate(15) <= A(3) and B(3);
	
	P(0) <= and_gate(0);
	
	HA0: half_adder port map(A => and_gate(1), B => and_gate(4), Sum => P(1), Cout => add0(0));
	FA0: full_adder port map(A => and_gate(2), B => and_gate(5), Cin => add0(0), Sum => add0(1), Cout => add0(2));
	FA1: full_adder port map(A => and_gate(3), B => and_gate(6), Cin => add0(2), Sum => add0(3), Cout => add0(4));
	HA1: half_adder port map(A => and_gate(7), B => add0(4), Sum => add0(5), Cout => add0(6));
	
	HA2: half_adder port map(A => add0(1), B => and_gate(8), Sum => P(2), Cout => add1(0));
	FA2: full_adder port map(A => and_gate(9), B => add0(3), Cin => add1(0), Sum => add1(1), Cout => add1(2));
	FA3: full_adder port map(A => and_gate(10), B => add0(5), Cin => add1(2), Sum => add1(3), Cout => add1(4));
	FA4: full_adder port map(A => and_gate(11), B => add0(6), Cin => add1(4), Sum => add1(5), Cout => add1(6));
	
	HA3: half_adder port map(A => and_gate(12), B => add1(1), Sum => P(3), Cout => add3(0));
	FA5: full_adder port map(A => and_gate(13), B => add1(3), Cin => add3(0), Sum => P(4), Cout => add3(1));
	FA6: full_adder port map(A => and_gate(14), B => add1(5), Cin => add3(1), Sum => P(5), Cout => add3(2));
	FA7: full_adder port map(A => and_gate(15), B => add3(2), Cin => add1(6), Sum => P(6), Cout => P(7));

end Gatelevel;

