--============================================================================
-- 
--  VHDL implementation of the 74LS244 octal line driver with tristate outputs
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
n_g1  |_|1          20|_| VCC
       _|             |_                     
a1(0) |_|2          19|_| n_g2
       _|             |_
y2(3) |_|3          18|_| y1(0)
       _|             |_
a1(1) |_|4          17|_| a2(3)
       _|             |_
y2(2) |_|5          16|_| y1(1)
       _|             |_
a1(2) |_|6          15|_| a2(2)
       _|             |_
y2(1) |_|7          14|_| y1(2)
       _|             |_
a1(3) |_|8          13|_| a2(1)
       _|             |_
y2(0) |_|9          12|_| y1(3)
       _|             |_
GND   |_|10         11|_| a2(0)
        |_____________|
*/

library ieee;
use ieee.std_logic_1164.all; 

entity ls244 is 
port
(
	n_g1, n_g2	: in std_logic;
	a1				: in std_logic_vector(3 downto 0);
	a2				: in std_logic_vector(3 downto 0);
	y1				: out std_logic_vector(3 downto 0);
	y2				: out std_logic_vector(3 downto 0)
);
end ls244;

architecture arch of ls244 is 
begin
	y1 <= a1 when not n_g1
		else (others => 'Z');
	y2 <= a2 when not n_g2
		else (others => 'Z');
end arch;