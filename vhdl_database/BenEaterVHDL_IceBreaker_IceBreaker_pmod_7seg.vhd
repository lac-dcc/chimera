--
-- Based on Ben Eater's build of the SAP breadboard computer and his excellent videos.
-- https://eater.net/
--
-- Copyright (c) 2017 Ken Jordan
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY PMOD_7Seg IS
	PORT(
		clk_i		: IN	STD_LOGIC;
		number_i	: IN	STD_LOGIC_VECTOR(7 downto 0);		-- 8-bit number to display in hex on 7-segments
		
		ledA_o		: OUT	STD_LOGIC;
		ledB_o		: OUT	STD_LOGIC;
		ledC_o		: OUT	STD_LOGIC;
		ledD_o		: OUT	STD_LOGIC;
		ledE_o		: OUT	STD_LOGIC;
		ledF_o		: OUT	STD_LOGIC;
		ledG_o		: OUT	STD_LOGIC;
		ledCA_o		: OUT	STD_LOGIC
	);
END PMOD_7Seg;

ARCHITECTURE RTL of PMOD_7Seg is

	SIGNAL	digit		: STD_LOGIC;							-- bit to indicate which LED to activtate (0=seg1, 1=seg2)
	SIGNAL	segments	: STD_LOGIC_VECTOR(6 downto 0);			-- 7-segment segments (a, b, c, d, e, f, g)
	SIGNAL	counter		: UNSIGNED(7 downto 0);					-- enough to slow down 12Mhz clock (~21 usec)

BEGIN
	ledA_o	<= NOT segments(6);
	ledB_o	<= NOT segments(5);
	ledC_o	<= NOT segments(4);
	ledD_o	<= NOT segments(3);
	ledE_o	<= NOT segments(2);
	ledF_o	<= NOT segments(1);
	ledG_o	<= NOT segments(0);
	ledCA_o	<= NOT digit;

	count_proc: process(clk_i)
		variable nib: STD_LOGIC_VECTOR(3 downto 0);
	begin
		if rising_edge(clk_i) then
			counter <= counter + 1;
			if counter = 0 then
				digit <= NOT digit;
			end if;
			
			if (digit = '0') then
				nib := number_i(3 downto 0);
			else	
				nib := number_i(7 downto 4);
			end if;
			case nib is
				when "0000" =>	segments <= "1111110";	-- 0
				when "0001" =>	segments <= "0110000";	-- 1
				when "0010" =>	segments <= "1101101";	-- 2
				when "0011" =>	segments <= "1111001";	-- 3
				when "0100" =>	segments <= "0110011";	-- 4
				when "0101" =>	segments <= "1011011";	-- 5
				when "0110" =>	segments <= "1011111";	-- 6
				when "0111" =>	segments <= "1110000";	-- 7
				when "1000" =>	segments <= "1111111";	-- 8
				when "1001" =>	segments <= "1111011";	-- 9
				when "1010" =>	segments <= "1110111";	-- A
				when "1011" =>	segments <= "0011111";	-- b
				when "1100" =>	segments <= "1001110";	-- C
				when "1101" =>	segments <= "0111101";	-- d
				when "1110" =>	segments <= "1001111";	-- E
				when "1111" =>	segments <= "1000111";	-- F
				when others =>	segments <= "0000000";	-- others blank
			end case;
		end if;
		if counter < 2 then								-- blank a bit before digit transition to avoid ghosting
			segments <= (others => '0');
		end if;			
	end process;

END ARCHITECTURE RTL;