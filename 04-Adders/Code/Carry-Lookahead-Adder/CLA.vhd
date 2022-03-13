----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CLA is
	Port (
		A    : in STD_LOGIC_VECTOR(3 downto 0);
		B    : in STD_LOGIC_VECTOR(3 downto 0);
		Cin  : in STD_LOGIC;
		sum  : out STD_LOGIC_VECTOR(3 downto 0);
		Cout : out STD_LOGIC
	);
end CLA;

architecture Behavioral of CLA is

	signal g0, g1, g2, g3, p0, p1, p2, p3 : STD_LOGIC;
	signal c0, c1, c2, c3 : STD_LOGIC;
	
begin

	g0 <= A(0) and B(0);
	g1 <= A(1) and B(1);
	g2 <= A(2) and B(2);
	g3 <= A(3) and B(3);
	
	p0 <= A(0) or B(0);
	p1 <= A(1) or B(1);
	p2 <= A(2) or B(2);
	p3 <= A(3) or B(3);
	
	-- c0 = g0 + p0Cin
	c0 <= g0 or (Cin and p0);
	
	-- c1 = g1 + p1g0 + p1p0Cin
	c1 <= g1 or (p1 and g0) or (p1 and p0 and Cin);
	
	-- c2 = g2 + p2g1 + p2p1g0 + p2p1p0Cin
	c2 <= g2 or (p2 and g1) or (p2 and p1 and g0) or (p2 and p1 and p0 and Cin);
	
	-- c3 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0Cin
	c3 <= g3 or (p3 and g2) or (p3 and p2 and g1) or (p3 and p2 and p1 and g0) or (p3 and p2 and p1 and p0 and Cin);
	
	-- sum
	sum(0) <= A(0) xor B(0) xor Cin;
	sum(1) <= A(1) xor B(1) xor c0;
	sum(2) <= A(2) xor B(2) xor c1;
	sum(3) <= A(3) xor B(3) xor c2;
	
	-- Cout = c3
	Cout <= c3;

end Behavioral;

