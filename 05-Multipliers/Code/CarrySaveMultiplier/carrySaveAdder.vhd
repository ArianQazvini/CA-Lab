----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:01:20 04/04/2022 
-- Design Name: 
-- Module Name:    carrySaveAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity carrySaveAdder is
 Port(a , b : in STD_LOGIC_VECTOR(3 downto 0);
      p : out STD_LOGIC_VECTOR(7 downto 0));
end carrySaveAdder;

architecture Behavioral of carrySaveAdder is

 	component half_adder is 
		Port(
		in1, in2: in std_logic;
		out1, out2 : out std_logic
		); 
	end component half_adder;
	
	component full_adder is 
    	Port(
 	i0, i1, cin: in std_logic;
 	s, cout : out std_logic
 	);
	end component full_adder;
	signal b0a0 , b0a1,b0a2,b0a3:STD_LOGIC;
	signal b1a0 , b1a1,b1a2,b1a3:STD_LOGIC;
	signal b2a0 , b2a1,b2a2,b2a3:STD_LOGIC;
	signal b3a0 , b3a1,b3a2,b3a3:STD_LOGIC;
	signal sum , c : STD_LOGIC_VECTOR(11 downto 0);
begin
   b0a0 <= b(0) and a(0);
   b0a1 <= b(0) and a(1);
   b0a2 <= b(0) and a(2);
   b0a3 <= b(0) and a(3);
	----------------------
   b1a0 <= b(1) and a(0);
   b1a1 <= b(1) and a(1);
   b1a2 <= b(1) and a(2);
   b1a3 <= b(1) and a(3);
	-----------------------
	b2a0 <= b(2) and a(0);
   b2a1 <= b(2) and a(1);
   b2a2 <= b(2) and a(2);
   b2a3 <= b(2) and a(3);
	----------------------
	b3a0 <= b(3) and a(0);
   b3a1 <= b(3) and a(1);
   b3a2 <= b(3) and a(2);
   b3a3 <= b(3) and a(3);
	
	-------------------------------------
	p(0)<= b0a0;
	hf1 : half_adder port map(in1=>b0a1,in2=>b1a0,out1=>p(1) , out2=> c(0));
	hf2 : half_adder port map(in1=>b1a1,in2=>b0a2,out1=>sum(0) , out2=> c(1));
	hf3 : half_adder port map(in1=>b1a2,in2=>b0a3,out1=>sum(1) , out2=> c(2));
	--------------------------------------
	fa1 : full_adder port map(i0=> b2a0 , i1 => c(0), cin => sum(0) , s => sum(2) , cout => c(3));
	fa2 : full_adder port map(i0=> b2a1 , i1 => c(1), cin => sum(1) , s => sum(3) , cout => c(4));
	fa3 : full_adder port map(i0=> b2a2 , i1 => c(2), cin => b1a3 , s => sum(4) , cout => c(5));
	---------------------------
	fa4 : full_adder port map(i0=> b3a0 , i1 => c(3), cin => sum(3) , s => sum(5) , cout => c(6));
	fa5 : full_adder port map(i0=> b3a1 , i1 => c(4), cin => sum(4) , s => sum(6) , cout => c(7));
	fa6 : full_adder port map(i0=> b3a2 , i1 => c(5), cin => b2a3 , s => sum(7) , cout => c(8));
	-------------------------
	hf4 : half_adder port map(in1=>c(6),in2=>sum(6),out1=>p(4) , out2=> c(9));
	fa7 : full_adder port map(i0=> c(9) , i1 => c(7), cin => sum(7) , s => p(5) , cout => c(10));
	fa8 : full_adder port map(i0=> c(10) , i1 => c(8), cin => b3a3 , s => p(6) , cout => p(7));
	p(2) <= sum(2);
	p(3) <= sum(5);

end Behavioral;

