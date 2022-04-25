----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:21:05 04/18/2022 
-- Design Name: 
-- Module Name:    topModule - Behavioral 
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

entity topModule is
    Port ( 
           para_in : in  STD_LOGIC_VECTOR (3 downto 0);
           lr: in  STD_LOGIC_VECTOR (1 downto 0);
           load : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	        number : out std_logic_vector(3 downto 0);		  
           output : out std_logic_vector(6 downto 0) 
         );
end topModule;

architecture Behavioral of topModule is


component shiftReg is
Port(para_in : IN STD_LOGIC_VECTOR(3 downto 0);
     lr : In STD_LOGIC_VECTOR(1 downto 0);
	  load,clk,rst : IN std_logic;
	  reg_out : OUT STD_LOGIC_VECTOR(3 downto 0)
     );
end component ;

component clock_divider is 
 	  	Port (
		clk_in  : in STD_LOGIC;
		reset   : in STD_LOGIC;
		clk_out : out STD_LOGIC
	);
end component ;

component seven_segment is 
		Port (
			bcd_number : in STD_LOGIC_VECTOR(3 downto 0);
			number : out STD_LOGIC_VECTOR(3 downto 0);
			O : out STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

	

signal clk_out : STD_LOGIC;
signal reg_out : STD_LOGIC_VECTOR(3 downto 0);

begin

	clk_divider : clock_divider port map (clk_in => clk_in ,reset => '0', clk_out => clk_out);
	shift_reg : shiftReg port map (para_in => para_in, lr => lr, load => load , rst => reset, clk => clk_out, reg_out => reg_out);
	seven_seg : seven_segment port map (bcd_number => reg_out ,number => number, O => output);

end Behavioral;

