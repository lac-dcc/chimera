--============================================================================
-- 
--  VHDL implementation of the 74LS161 synchonous presettable 4-bit counter
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
n_clr  |_|1          16|_| VCC
        _|             |_                     
clk    |_|2          15|_| rco
        _|             |_
din(0) |_|3          14|_| q(0)
        _|             |_
din(1) |_|4          13|_| q(1)
        _|             |_
din(2) |_|5          12|_| q(2)
        _|             |_
din(3) |_|6          11|_| q(3)
        _|             |_
enp    |_|7          10|_| ent
        _|             |_
GND    |_|8           9|_| n_load
         |_____________|
*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ls161 is
port
(
	n_clr		: in std_logic;
	clk		: in std_logic;
	din		: in std_logic_vector(3 downto 0);
	enp, ent	: in std_logic;
	n_load	: in std_logic;
	q			: out std_logic_vector(3 downto 0);
	rco		: out std_logic
);
end ls161;

architecture arch of ls161 is
signal data : std_logic_vector(3 downto 0) := "0000";
begin
	process(clk, n_clr, enp, ent, data) begin
		if(n_clr = '0') then
			data <= "0000";
		elsif(clk'event and clk = '1') then
			if(n_load = '0') then
				data <= din;
			elsif(enp = '1' and ent = '1') then
				data <= data + '1';
			end if;
		end if;
	end process;
	q <= data;
	rco <= data(0) and data(1) and data(2) and data(3) and ent;
end arch;