library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_4to1 is
	Port ( 
		I : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		Z : out std_logic
	);
end mux_4to1;

architecture structure of mux_4to1 is
	component and_gate is
		Port (
			A,B : in STD_LOGIC;
			C: out STD_LOGIC
		);
	end component and_gate;
	
	component or_gate is
		Port (
			A,B : in STD_LOGIC;
			C : out STD_LOGIC
		);
	end component or_gate;
	
	component not_gate is
		Port (
			A : in STD_LOGIC;
			B : out STD_LOGIC
		);
	end component not_gate;
	
	signal not_S0, not_S1, and_A, and_B, and_C, and_D : STD_LOGIC;
	signal and0_S, and1_S, and2_S, and3_S : STD_LOGIC;
	signal or0, or1 : STD_LOGIC;
begin
	not_instance0: not_gate port map (A => S(0), B => not_S0);
	not_instance1: not_gate port map (A => S(1), B => not_S1);
	
	-- I(0) & !S(0) & !S(1)
	and_instance0: and_gate port map (A => not_S0, B => not_S1, C => and0_S);
	and_instance1: and_gate port map (A => I(0), B => and0_S, C => and_A);
	
	-- I(1) & !S(0) & S(1)
	and_instance2: and_gate port map (A => S(0), B => not_S1, C => and1_S);
	and_instance3: and_gate port map (A => and1_S, B => I(1), C => and_B);
	
	-- I(2) & S(0) & !S(1)
	and_instance4: and_gate port map (A => not_S0, B => S(1), C => and2_S);
	and_instance5: and_gate port map (A => I(2), B => and2_S, C => and_C);
	
	-- I(3) & S(0) & S(1)
	and_instance6: and_gate port map (A => S(0), B => S(1), C => and3_S);
	and_instance7: and_gate port map (A => I(3), B => and3_S, C => and_D);
	
	-- and_A or and_B = or0
	or_instance0: or_gate port map (A => and_A, B => and_B, C => or0);
	-- and_C or and_D = or1
	or_instance1: or_gate port map (A => and_C, B => and_D, C => or1);
	-- or_0 or or_1 = Z
	or_instance2: or_gate port map (A => or0, B => or1, C => Z);
	

end structure;

