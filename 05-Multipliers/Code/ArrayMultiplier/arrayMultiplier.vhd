----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:36:21 04/03/2022 
-- Design Name: 
-- Module Name:    arrayMultiplier - Behavioral 
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

entity arrayMultiplier is
 Port(a , b : in STD_LOGIC_VECTOR(3 downto 0);
      p : out STD_LOGIC_VECTOR(7 downto 0));
end arrayMultiplier;
architecture Behavioral of arrayMultiplier is
 component rippleAdder is
      Port ( in1 : in  STD_LOGIC_VECTOR(3 downto 0);
           in2 : in  STD_LOGIC_VECTOR(3 downto 0);
			  CIN : in std_logic;
           sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
 end component rippleAdder;
  signal b0And , b1And,b2And,b3And : STD_LOGIC_VECTOR(3 downto 0); 
  signal adderRes0 , adderRes1,adderRes2 : STD_LOGIC_VECTOR(3 downto 0);
  signal adderCout0,adderCout1,adderCout2 : STD_LOGIC;
  signal temp1 , temp2 : STD_LOGIC_VECTOR(3 downto 0);
  
begin
 p(0) <= b(0) and a(0) ;
 b0And(0) <= b(0) and a(1);
 b0And(1) <= b(0) and a(2);
 b0And(2) <= b(0) and a(3);
 b0And(3) <= '0';
 ----------------------------
 b1And(0) <= b(1) and a(0) ;
 b1And(1) <= b(1) and a(1) ;
 b1And(2) <= b(1) and a(2) ;
 b1And(3) <= b(1) and a(3) ;
-------------------------------
 b2And(0) <= b(2) and a(0) ;
 b2And(1) <= b(2) and a(1) ;
 b2And(2) <= b(2) and a(2) ;
 b2And(3) <= b(2) and a(3) ;
 -------------------------------
 b3And(0) <= b(3) and a(0) ;
 b3And(1) <= b(3) and a(1) ;
 b3And(2) <= b(3) and a(2) ;
 b3And(3) <= b(3) and a(3) ;
 --------------------------------
 ripple0 : rippleAdder port map(in1 => b1And , in2 => b0And , CIN=> '0' ,sum => adderRes0,Cout => adderCout0);
 
 temp1(3) <= adderCout0;
 temp1(2 downto 0) <= adderRes0(3 downto 1 );
 
 ripple1 : rippleAdder port map(in1 => b2And , in2 => temp1 , CIN=> '0' ,sum => adderRes1,Cout => adderCout1);
 
 temp2(3) <= adderCout1;
 temp2(2 downto 0) <= adderRes1(3 downto 1 );
 
 ripple2 : rippleAdder port map(in1 => b3And , in2 => temp2 , CIN=> '0' ,sum => adderRes2,Cout => p(7));
 
 p(3) <= adderRes2(0);
 p(4) <= adderRes2(1);
 p(5) <= adderRes2(2);
 p(6) <= adderRes2(3);
 p(2) <= adderRes1(0);
 p(1) <= adderRes0(0);

end Behavioral;

