----------------------------------------------------------------------------------
-- Company: AUT
-- Engineers: Kimia Montazeri & Arian Qazvini
-- 
-- Create Date:    01:54:59 03/07/2022 
-- Design Name: 
-- Module Name:    rippleCounter - Behavioral 
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

entity rippleCounter is
 port(
     clk : in std_logic;
	  reset : in std_logic;
	  output : out std_logic_vector(3 downto 0)
	 ); 
end rippleCounter;

architecture Behavioral of rippleCounter is
  component tff
     port(
        T : in std_logic;
        reset : in std_logic;
        clk : in std_logic;
        Q : out std_logic
		 );
	end component;
   signal sig1 : std_logic_vector(3 downto 0) := "0000";	
   signal sig2 : std_logic; 
   signal sig3 : std_logic;	
begin
     output <= sig1;
	  sig2 <= (not (sig1(3) and sig1(2) and sig1(1) and (not sig1(0))) and reset); 

	  ------
	  t0 : tff port map(T =>'1', reset => sig3 , clk => clk , Q => sig1(0));
	  t1 : tff port map(T =>'1', reset => sig3 , clk => not sig1(0) , Q => sig1(1));
	  t2 : tff port map(T =>'1', reset => sig3 , clk => not sig1(1) , Q => sig1(2));
	  t3 : tff port map(T =>'1', reset => sig3 , clk => not sig1(2) , Q => sig1(3));
	  proc : process(sig2)
    begin 
      if(sig2 = '0') then
		   sig3 <= '0';
     else 
        sig3 <='1';  
      end if;
    end process;
end Behavioral;

