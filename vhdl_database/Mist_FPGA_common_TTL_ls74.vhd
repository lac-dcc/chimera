--============================================================================
-- 
--  VHDL implementation of the 74LS74 dual D-flip flop
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
/*        _____________
        _|             |_
n_clr1 |_|1          14|_| VCC
        _|             |_                     
d1     |_|2          13|_| n_clr2
        _|             |_
clk1   |_|3          12|_| d2
        _|             |_
n_pre1 |_|4          11|_| clk2
        _|             |_
q1     |_|5          10|_| n_pre2
        _|             |_
n_q1   |_|6           9|_| q2
        _|             |_
GND    |_|7           8|_| n_q2
         |_____________|
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity ls74 is
port
(
	n_pre1, n_pre2			: in std_logic;
	n_clr1, n_clr2			: in std_logic;
	clk1, clk2				: in std_logic;
	d1, d2					: in std_logic;
	q1, n_q1, q2, n_q2	: buffer std_logic
);
end ls74;

architecture arch of ls74 is
begin
	process(clk1, n_pre1, n_clr1) begin
		if(n_pre1 = '0') then
			q1 <= '1';
		elsif(n_clr1 = '0') then
			q1 <= '0';
		elsif(clk1'event and clk1 = '1') then
			q1 <= d1;
		end if;
	end process;	
	process(clk2, n_pre2, n_clr2) begin
		if(n_pre2 = '0') then
			q2 <= '1';
		elsif(n_clr2 = '0') then
			q2 <= '0';
		elsif(clk2'event and clk2 = '1') then
			q2 <= d2;
		end if;
	end process;
	n_q1 <= not q1;
	n_q2 <= not q2;
end arch;