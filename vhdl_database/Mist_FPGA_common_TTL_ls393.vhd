--============================================================================
-- 
--  VHDL implementation of the 74LS393 dual 4-bit binary counter
--  Copyright (C) 2018, 2019 Ace
--
--  Permission is hereby granted, free of charge, to any person obtaining a
--  copy of this software and associated documentation files (the "Software"),
--  to deal in the Software without restriction, including without limitation
--	 the rights to use, copy, modify, merge, publish, distribute, sublicense,
--	 and/or sell copies of the Software, and to permit persons to whom the 
--	 Software is furnished to do so, subject to the following conditions:
--
--  The above copyright notice and this permission notice shall be included in
--	 all copies or substantial portions of the Software.
--
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--	 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--	 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--	 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--	 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--	 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--	 DEALINGS IN THE SOFTWARE.
--
--============================================================================

--Chip pinout:
/*       _____________
       _|             |_
clk1  |_|1          14|_| VCC
       _|             |_                     
clr1  |_|2          13|_| clk2
       _|             |_
q1(0) |_|3          12|_| clr2
       _|             |_
q1(1) |_|4          11|_| q2(0)
       _|             |_
q1(2) |_|5          10|_| q2(1)
       _|             |_
q1(3) |_|6           9|_| q2(2)
       _|             |_
GND   |_|7           8|_| q2(3)
        |_____________|
*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ls393 is
port
(
	clk1, clk2	: in std_logic;
	clr1, clr2	: in std_logic;
	q1, q2		: out std_logic_vector(3 downto 0)
);
end ls393;

architecture arch of ls393 is
signal count1 : std_logic_vector(3 downto 0);
signal count2 : std_logic_vector(3 downto 0);
begin
	process(clk1, clr1) begin
		if(clr1 = '1') then
			count1 <= "0000";
		elsif(clk1'event and clk1 = '0') then
			count1 <= count1 + 1;
		end if;
	end process;
	process(clk2, clr2) begin
		if(clr2 = '1') then
			count2 <= "0000";
		elsif(clk2'event and clk2 = '0') then
			count2 <= count2 + 1;
		end if;
	end process;
	q1 <= count1;
	q2 <= count2;
end arch;