----------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
-- 
-- Create Date:    01:14:38 03/14/2022 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
 	Port(
 	i0, i1, cin: in std_logic;
 	s, cout : out std_logic
 	); 
end full_adder;

architecture Behavioral of full_adder is
	component half_adder is 
		Port(
		in1, in2: in std_logic;
		out1, out2 : out std_logic
		); 
	end component half_adder;
	signal internal_signal0, internal_signal1, internal_signal2: std_logic;
begin
   	half_adder_instance0: half_adder port map ( in1 => i0, in2 => i1, out1 => internal_signal0, out2 => internal_signal1);
		half_adder_instance1: half_adder port map ( in1 => internal_signal0, in2 => cin, out1 => s, out2 => internal_signal2);
		cout <= internal_signal1 or internal_signal2 ;

end Behavioral;

