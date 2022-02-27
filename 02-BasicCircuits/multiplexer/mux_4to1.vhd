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
	signal not_S0, not_S1, and_A, and_B, and_C, and_D : STD_LOGIC;
	signal and0_S, and1_S, and2_S, and3_S : STD_LOGIC;
	signal or0, or1 : STD_LOGIC;
begin
	not_S0 <= not S(0);
	not_S1 <= not S(1);
	
	-- I(0) & !S(0) & !S(1)
	and0_S <= not_S0 and not_S1;
	and_A <= I(0) and and0_S;
	
	-- I(1) & !S(0) & S(1)
	and1_S <= S(0) and not_S1;
	and_B <= and1_S and I(1);
	
	-- I(2) & S(0) & !S(1)
	and2_S <= not_S0 and S(1);
	and_C <= I(2) and and2_S;
	
	-- I(3) & S(0) & S(1)
	and3_S <= S(0) and S(1);
	and_D <= I(3) and and3_S;
	
	-- and_A or and_B = or0
	or0 <= and_A or and_B;

	-- and_C or and_D = or1
	or1 <= and_C or and_D;

	-- or_0 or or_1 = Z
	Z <= or0 or or1;

end structure;

