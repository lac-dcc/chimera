-------------------------------------------------------------------------------
-- Copyright (c) 2005 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 1.0
--  \   \        Filename: prbsgen_ser.vhd
--  /   /        Date Last Modified:  May 1 2007
-- /___/   /\    Date Created: May 1 2007
-- \   \  /  \
--  \___\/\___\
-- 
--Device: Virtex-5
--Purpose: Mask encoder for the barrel shifter.
--Reference:
--    
--Revision History:
--    Rev 1.0 - First created, Giovanni Guasti and Paolo Novellini, May 1 2007.
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- to Elisa
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY maskencoder IS
    Port ( 
	    	CLK			: in	STD_LOGIC;
	    	RST			: in	STD_LOGIC;
			SHIFT		: in	STD_LOGIC_VECTOR(4 downto 0);
			MASK		: out	STD_LOGIC_VECTOR(19 downto 0)
		);
END maskencoder;

ARCHITECTURE behavior OF maskencoder IS 

SIGNAL maskdec          : STD_LOGIC_VECTOR(9 downto 0);

BEGIN

	PROCESS (CLK,RST)
	begin
		if RST='0' then
			maskdec 	<= (others=>'0');
		elsif rising_edge(CLK) then
			case SHIFT IS 
				when "00000" => 		
			    	MASK 		<= "00000000001111111111";--0
		   		when "00001" =>
		   			MASK 		<= "00000000011111111110"; 		
				when "00010" =>
					MASK 		<= "00000000111111111100"; 		
				when "00011" =>     
					MASK 		<= "00000001111111111000"; 		
				when "00100" =>     
					MASK 		<= "00000011111111110000"; 		
				when "00101" =>     
					MASK		<= "00000111111111100000"; 		
				when "00110" =>     
					MASK 		<= "00001111111111000000"; 		
				when "00111" =>     
					MASK 		<= "00011111111110000000"; 		
				when "01000" =>     
					MASK 		<= "00111111111100000000"; 		
				when "01001" =>     
					MASK 		<= "01111111111000000000"; 		
				when "01010" =>     
					MASK 		<= "11111111110000000000";--10 		
				when "01011" =>     
					MASK 		<= "11111111100000000001"; 		
				when "01100" =>     
					MASK 		<= "11111111000000000011"; 		
				when "01101" =>     
					MASK 		<= "11111110000000000111"; 		
				when "01110" =>     
					MASK 		<= "11111100000000001111"; 		
				when "01111" =>     
					MASK 		<= "11111000000000011111"; 		
				when "10000" =>     
					MASK 		<= "11110000000000111111"; 		
				when "10001" =>     
					MASK 		<= "11100000000001111111"; 		
				when "10010" =>     
					MASK 		<= "11000000000011111111"; 		
				when "10011" =>     
					MASK 		<= "10000000000111111111"; 		
				when others => null; 
			end case;
		end if;
	end process;

END;