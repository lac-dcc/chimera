--Authors: Pietro Bassi, Marco Torsello

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity sqrt is 
port 
	(
		CLOCK 			: in std_logic;	
		CLEAR 			: in std_logic;	
		DATA_IN 			: in std_logic_vector (15 downto 0);
		DATA_OUT 		: out std_logic_vector (7 downto 0)
	);
end entity;

architecture RTL of sqrt is 
	signal partDone  	: std_logic := '0';
	signal partCount 	: integer := 7; 
	signal result 		: std_logic_vector(9 downto 0) :=  "0000000000"; 
	signal partialQ 	: std_logic_vector(11 downto 0) := "000000000000";

begin   
	partDone_1: process(CLOCK,CLEAR,DATA_IN,partDone)  
	begin
		if(rising_edge(CLOCK) and CLEAR='0')then
		--square root abacus algorithm (C. Woo)
			if(partDone='0')then
				if(partCount>=0)then
					partialQ(1 downto 0)  <= DATA_IN((partCount*2)+ 1 downto partCount*2);
					partDone <= '1';    
				else
					DATA_OUT <= result(7 downto 0);  
				end if;    
				partCount <= partCount - 1;
			elsif(partDone='1')then
				if((result(7 downto 0) & "01") <= partialQ)then
					result   <= result(8 downto 0) & '1';
					partialQ(9 downto 2) <= partialQ(7 downto 0) - (result(1 downto 0)&"01");    
				else 
					result   <= result(8 downto 0) & '0';
					partialQ(9 downto 2) <= partialQ(7 downto 0);                     
				end if;   
				partDone  <= '0';
			end if;
		end if;
		
		if(rising_edge(CLOCK) and CLEAR='1')then
			partCount <= 7;
			partDone <= '0';
			result <= "0000000000";
			partialQ <= "000000000000";
		end if;
end process;   
end architecture;
