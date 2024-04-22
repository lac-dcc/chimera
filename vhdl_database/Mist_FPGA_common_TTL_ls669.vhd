--============================================================================
-- 
--  VHDL implementation of the 74LS669 synchronous 4-bit up/down counter
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
u_d     |_|1          16|_| VCC
         _|             |_                     
clk     |_|2          15|_| n_rco
         _|             |_
d_in(0) |_|3          14|_| d_out(0)
         _|             |_
d_in(1) |_|4          13|_| d_out(1)
         _|             |_
d_in(2) |_|5          12|_| d_out(2)
         _|             |_
d_in(3) |_|6          11|_| d_out(3)
         _|             |_
n_en_p  |_|7          10|_| n_en_t
         _|             |_
GND     |_|8           9|_| load
          |_____________|
*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ls669 is
port
(
	d_in		: in std_logic_vector(3 downto 0);
	clk		: in std_logic;
	load		: in std_logic;
	n_en_p	: in std_logic;
	n_en_t	: in std_logic;
	u_d		: in std_logic;
	d_out		: out std_logic_vector(3 downto 0);
	n_rco		: out std_logic
);
end ls669;

architecture arch of ls669 is
signal count: std_logic_vector(3 downto 0);
begin
	process(clk) begin
		if(clk'event and clk = '1') then
			if(load = '0') then
				count <= d_in;
			elsif(n_en_p = '0' and n_en_t = '0') then
				if(u_d = '1') then
					count <= count + 1;
				else
					count <= count - 1;
				end if;
			end if;
		end if;
	end process;
	d_out <= count;
	n_rco <= (not n_en_t and u_d and count(0) and count(1) and count(2) and count(3))
			nor (not n_en_t and not u_d and not count(0) and not count(1) and not count(2) and not count(3));
end arch;