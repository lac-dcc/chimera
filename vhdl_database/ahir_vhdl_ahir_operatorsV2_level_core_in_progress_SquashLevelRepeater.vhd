------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.BaseComponents.all;

entity SquashLevelRepeater is
    generic(name: string; g_data_width: integer := 32; g_depth : integer := 1);
    port(clk: in std_logic;
       		reset: in std_logic;
		enable: in std_logic;
       		data_in: in std_logic_vector(g_data_width-1 downto 0);
       		data_out: out std_logic_vector(g_data_width-1 downto 0);
       		stall_vector: in std_logic_vector(1 to g_depth));
end entity SquashLevelRepeater;

architecture behave of SquashLevelRepeater is
	type DwordArray is array (natural range <>) of std_logic_vector (g_data_width-1 downto 0);
	signal data_regs: DwordArray(0 to g_depth);
begin  -- SimModel

        assert (g_depth > 0) report "SquashLevelRepeater:" & name & " depth must be > 0" severity error;

	ivalids(0) <= valid_in;
	-- if enable is low, we stuff the data-in else we stuff in the
	-- last data seen..  (repeat it..)
 	nontriv: if (g_depth > 0) generate
        	data_regs(0) <= data_in when (enable = '1') else data_regs(1);
	end generate nontriv;
 	triv: if (g_depth = 0) generate
        	data_regs(0) <= data_in;
	end generate triv;

        data_out   <= data_regs(g_depth);

        genSR: for I in 1 to g_depth generate 
	  process(clk)
	  begin
		if(clk'event and clk = '1') then
			if (stall_vector(I) = '0') then
				data_regs(I)  <= data_regs(I-1);
			end if;
		end if;
   	   end process;
        end generate genSR;

end behave;
