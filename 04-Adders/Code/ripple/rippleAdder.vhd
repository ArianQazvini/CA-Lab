----------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
-- 
-- Create Date:    01:21:52 03/14/2022 
-- Design Name: 
-- Module Name:    rippleAdder - Behavioral 
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

entity rippleAdder is
   Port ( in1 : in  STD_LOGIC_VECTOR(3 downto 0);
           in2 : in  STD_LOGIC_VECTOR(3 downto 0);
           sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
end rippleAdder;

architecture Behavioral of rippleAdder is
 component full_adder is 
    	Port(
 	i0, i1, cin: in std_logic;
 	s, cout : out std_logic
 	);
	end component full_adder;
	signal internal :  std_logic_vector(2 downto 0);

begin
   fA0 : full_adder port map(i0 => in1(0),i1=>in2(0) , cin => '0' , s => sum(0) , cout => internal(0));
   fA1 : full_adder port map(i0 => in1(1),i1=>in2(1) , cin => internal(0) , s => sum(1) , cout => internal(1));
   fA2 : full_adder port map(i0 => in1(2),i1=>in2(2) , cin => internal(1) , s => sum(2) , cout => internal(2));
   fA3 : full_adder port map(i0 => in1(3),i1=>in2(3) , cin => internal(2) , s => sum(3) , cout => Cout);

end Behavioral;

