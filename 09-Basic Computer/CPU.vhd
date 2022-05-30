----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:19 06/17/2021 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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
use ieee.numeric_std.all;

--CPU module that contains CU(Control Unit)& ALU
ENTITY CPU IS
	port(
	   --rising edge CLK
		clk : in std_logic;
		rst : in std_logic;
		--Acc reg
		R_ACC : out std_logic_vector(7 downto 0);
		--IR reg
		R_IR : out std_logic_vector(7 downto 0);
		--MDR reg
		R_MDR : out std_logic_vector(7 downto 0);
		--MAR reg
		R_MAR : out std_logic_vector(4 downto 0);
		--PC reg
		R_PC : out std_logic_vector(4 downto 0);  
		--Carry Out OF ALU
		caryy_f : out std_logic;
		STATE : out std_logic_vector(3 downto 0);
		Data_out : out std_logic_vector(7 downto 0)		
	);
end CPU;

architecture Behavioral of CPU is
	
	--component of RAM
	component RAM is
		port(
		   w : in std_logic;--write
		   r : in std_logic;--read
			rst : in std_logic;
			clk : in std_logic;--clk is rising edge
			addr : in std_logic_vector(4 downto 0);--address array
			data_in : in std_logic_vector(7 downto 0);  --data array
			data_out : out std_logic_vector(7 downto 0));
	end component;

						--signals--
	signal PreState : std_logic_vector(3 downto 0);
	signal MAR : std_logic_vector(4 downto 0);
	signal Write_in: std_logic;
   signal Read_in: std_logic;	
	signal Datain : std_logic_vector(7 downto 0);
	signal Dataout : std_logic_vector(7 downto 0);
	
	begin		
		
	--start the processing that related to
   --	von newman algorithm
							                      									
		process(clk, rst)
			variable tmp : std_logic_vector(8 downto 0);
			--for program counter we assign it unsigned because it counts and 
			--the number cant be negative
			variable PC : unsigned(4 downto 0);--PROGRAM COUNTER
			variable ACC : std_logic_vector(7 downto 0);--ACCUMULATOR
			variable MDR : std_logic_vector(7 downto 0);
			variable IR : std_logic_vector(7 downto 0);--INSTRUCTION REGISTER
			variable Carry_flag : std_logic;	--for opcode 101 that can
														--make the carry out
														
	
		--if rst is zero intialize whole of registers zero
		begin
			if(rst = '0') --asycronized
    			then
				   PreState <= "0000";  	--first state
				   PC := (others => '0');
			   	MAR <= (others => '0'); 
					MDR := (others => '0');
					ACC := (others => '0');
					IR := (others => '0'); 
					Carry_flag := '0'; 
					Write_in <= '0'; 
					Read_in <= '0'; 				
				
				
			elsif rising_edge(clk) 
			then		  
				 case PreState is
				 --first state
					when "0000" =>
						MAR <= std_logic_vector(PC);
						PreState <= "0001"; --next state

					when "0001" =>
						--6th step of von newman algrithm
						PC := PC + 1;
					   IR := Dataout; 
						PreState <= "0010";--next state

					when "0010" =>	
						case IR(7 downto 5) is	
						--we intialize MAR related to its opcode 
						--intialize them wuth its address
							 -- LD A
							when "000" =>
								MAR <= IR(4 downto 0);
							 -- ST A
							when "001" =>
								MAR <= IR(4 downto 0);
							-- JP ADDR
							when "010" =>
								MAR <= IR(4 downto 0); 
							-- JPC ADDR
							when "011" =>
								MAR <= IR(4 downto 0); 
							-- AND A
							when "100" =>
								MAR <= IR(4 downto 0); 
							-- ADD A
							when "101" =>
								MAR <= IR(4 downto 0); 
							when "110" =>--implicit 
								MAR <= MAR;	
							when "111" =>
								MAR <= MAR;--implicit
							--OTHERS
							when others => 
								MAR <= IR(4 downto 0);
						end case;
						PreState <= "0011";--next state
						
						
					
					--START INTIALIZING--
					when "0011" => 
					
						case IR(7 downto 5) is --OPCODE
						
						--ACC <- ADDR
							when "000" =>  
									Read_in <= '1'; --READ	
									Write_in <= '0';
									PreState <= "1000";--next state
									
									
						 --ADDR <- ACC		
							when "001" => 
									Datain <= ACC;
								   Read_in <= '0'; --WRITE	
									Write_in <= '1'; 
									PreState <= "1001";--next state
									
									
						--JUMP TO ADDR		
							when "010" => 
									Read_in <= '1';--READ	
									Write_in <= '0';
									PreState <= "1010";
									
						 --JUMP TO ADDR IF Carry_flag=1	
							when "011" =>
									Read_in <= '1';--READ	
									Write_in <= '0';
									PreState <= "1011";--next state
								

						 -- ACC <- ACC & ADDR
							when "100" =>
									Read_in <= '1';--READ	
									Write_in <= '0';
									PreState <= "1100";--next state
									
									
						-- ACC <- ACC + ADDR		
							when "101" =>
									Read_in <= '1'; --READ	
									Write_in<='0';
									PreState <= "1101";--next state
									
									
						-- ACC<- NOT ACC
							when "110" =>
									Read_in <= '1'; --READ	
									Write_in<= '0';
									PreState <= "1110";--next state
				      
						--ACC <- ACC >> 1
							when "111" =>
									Read_in <= '1'; --READ	
									Write_in<= '0';
									PreState <= "1111";--next state

						--OTHER  STATES
							when others =>
									Read_in <= '1';--READ	
									Write_in<='0';
									PreState <= "0000"; --next state
						end case; -- END OF CU 
					
					
				--INSTRUCTION EXECUTE 4th level of von newman algorithm
				
				--ACC <- ADDR
					when "1000" => 
						ACC := Dataout; --ACC <- ADDR
						MDR := Dataout;
						PreState <= "0000";--next state
						
				--ADDR <- ACC
					when "1001" =>
						Read_in <= '1'; --READ	
						Write_in<='0';
						PreState <= "0000";--next state

				--JMP TO ADDR
					when "1010" => 
						PC := unsigned(MAR); --JMP
						PreState <= "0000";--next state
						
				--JUMP TO ADDR IF Carry_flag = 1	
					when "1011" =>
						if(Carry_flag = '1') --Carry_flag = 1 JMP
    						then
							  PC := unsigned(MAR);
						end if;
						 PreState <= "0000";--next state
						
				--ACC <- ACC AND ADDR
					when "1100" =>
						MDR := Dataout;
						ACC := ACC AND Dataout;
						PreState <= "0000";--next state
					
		      --ACC <- ACC + ADDR
					when "1101" => 
						MDR := Dataout;
						--Make Them UNSIGNED--
						tmp(8 downto 0) := std_logic_vector(to_unsigned(to_integer(unsigned(Dataout))+
																		to_integer(unsigned(ACC)),9));
						--SELECT 9BIT BECAUSE THE SIGNIFICIANT BIT IS CARRY
						ACC := tmp(7 downto 0); 		
						Carry_flag := tmp(8); --temp(8) is carry!
						 PreState <= "0000";--next state

             --ACC <- not ACC
					when "1110" =>	
						ACC := NOT ACC;
						PreState <= "0000";--next state
					
					
				 --ACC <- ACC >> 1
					when "1111" =>
						ACC(7 downto 0) := '0'& ACC(7 downto 1);
						PreState <= "0000"; --next state
				
				 --OTHERS
					when others => 
					    PreState <= "0000";	
				end case;	
			end if;
			
			
			
						--outputs--
			R_MAR <= MAR;
			R_PC <= std_logic_vector(PC);  
			R_ACC <= ACC;
			R_IR <= IR;
			R_MDR <= MDR;
			caryy_f <= Carry_flag;
			STATE <= PreState;
			Data_out  <= Dataout;
			
			
		end process;
		
		--port map the ram module
		Random_Access_Memory : RAM PORT MAP(w => Write_in,r => Read_in,rst => rst ,
														clk => clk,addr => MAR , data_in => Datain,
														data_out => Dataout);
		
end Behavioral;