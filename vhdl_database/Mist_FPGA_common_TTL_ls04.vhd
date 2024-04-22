--============================================================================
-- 
--  VHDL implementation of the 74LS04 hex inverter
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
/*     _____________
     _|             |_
a1  |_|1          14|_| VCC
     _|             |_                     
y1  |_|2          13|_| a6
     _|             |_
a2  |_|3          12|_| y6
     _|             |_
y2  |_|4          11|_| a5
     _|             |_
a3  |_|5          10|_| y5
     _|             |_
y3  |_|6           9|_| a4
     _|             |_
GND |_|7           8|_| y4
      |_____________|
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity ls04 is
port
(
	a1, a2, a3, a4, a5, a6	: in std_logic;
	y1, y2, y3, y4, y5, y6	: out std_logic
);
end ls04;

architecture arch of ls04 is
begin
	y1 <= not a1;
	y2 <= not a2;
	y3 <= not a3;
	y4 <= not a4;
	y5 <= not a5;
	y6 <= not a6;
end arch;