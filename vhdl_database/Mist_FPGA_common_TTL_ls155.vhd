--============================================================================
-- 
--  VHDL implementation of the 74LS155 dual 2-to-4 address decoder
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
/*         _____________
         _|             |_
n_ea(0) |_|1          16|_| VCC
         _|             |_                     
n_ea(1) |_|2          15|_| n_eb(0)
         _|             |_
a1      |_|3          14|_| n_eb(1)
         _|             |_
o0(3)   |_|4          13|_| a0
         _|             |_
o0(2)   |_|5          12|_| o1(3)
         _|             |_
o0(1)   |_|6          11|_| o1(2)
         _|             |_
o0(0)   |_|7          10|_| o1(1)
         _|             |_
GND     |_|8           9|_| o1(0)
          |_____________|
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity ls155 is
port
(
	a0, a1	: in std_logic;
	n_ea		: in std_logic_vector(1 downto 0);	--n_ea(0) active high, n_ea(1) active low
	n_eb		: in std_logic_vector(1 downto 0);
	o0			: out std_logic_vector(3 downto 0);
	o1			: out std_logic_vector(3 downto 0)
);
end ls155;

architecture arch of ls155 is
begin
	o0 <= "1110" when (n_ea(0) and not n_ea(1) and not a0 and not a1)
		else "1101" when (n_ea(0) and not n_ea(1) and a0 and not a1)
		else "1011" when (n_ea(0) and not n_ea(1) and not a0 and a1)
		else "0111" when (n_ea(0) and not n_ea(1) and a0 and a1)
		else "1111";
	o1 <= "1110" when (not n_eb(0) and not n_eb(1) and not a0 and not a1)
		else "1101" when (not n_eb(0) and not n_eb(1) and a0 and not a1)
		else "1011" when (not n_eb(0) and not n_eb(1) and not a0 and a1)
		else "0111" when (not n_eb(0) and not n_eb(1) and a0 and a1)
		else "1111";
end arch;