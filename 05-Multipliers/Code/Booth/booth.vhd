----------------------------------------------------------------------------------
-- Company: AUT
-- Engineer: Kimia Montazeri & Arian Ghazvini
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity booth is
	Port (
		I : in STD_LOGIC_VECTOR(3 downto 0); -- zarb shavandeh
		Q : in STD_LOGIC_VECTOR(3 downto 0); -- zarb konandeh
		O : out STD_LOGIC_VECTOR(7 downto 0)
	);
end booth;

architecture Behavioral of booth is

begin

	process(I, Q)
	
		variable reg : STD_LOGIC_VECTOR(8 downto 0);
		variable M, A : STD_LOGIC_VECTOR(3 downto 0);
		variable n : integer; -- equal to number of Q's bits (which is 4)
		
		begin
		
			reg := "000000000";
			M := I;
			reg(4 downto 1) := Q; -- rightmost bits will be Q0 and Q-1
			
			multiplication_loop : for n in 0 to 3 loop
				
				A := reg(8 downto 5);
				
				-- 'Q0,Q-1' == 10 ~> A = A - M
				if (reg(1) = '1' and reg(0) = '0') then
					reg(8 downto 5) := A + not(M) + 1;
					
				-- 'Q0,Q-1' == 10	~> A = A + M
				elsif (reg(1) = '0' and reg(0) = '1') then 
					reg(8 downto 5) := A + M;
				
				end if;
				
				-- one bit shift to the right
				reg(7 downto 0) := reg(8 downto 1);
			
			end loop multiplication_loop;
			
			O(7 downto 0) <= reg(8 downto 1);
	
	end process;

end Behavioral;

