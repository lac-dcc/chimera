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

--
-- stall_in is used to stall the stages in a shift-register pipeline.
-- A stage is stalled only if its successor is non-empty and has stalled.
--
entity ValidPropagator is
    generic(name: string; g_depth : integer := 1);
    port(clk: in std_logic;
       		reset: in std_logic;
       		stall_in: in std_logic;
       		valid_in: in std_logic;
       		valid_out : out std_logic;
       		stall_vector: out std_logic_vector(1 to  g_depth));
end entity ValidPropagator;

architecture behave of ValidPropagator is
	-- output of th kth stage is valid... 0 is the
	-- input.
	signal ivalids: std_logic_vector(0 to g_depth);

	-- kth stage has stalled.
	signal stalls:  std_logic_vector(1 to (g_depth+1));
begin  -- SimModel

        assert (g_depth > 0) report "ValidPropagator:" & name & " depth must be > 0" severity error;

	ivalids(0) <= valid_in;
	valid_out  <= ivalids(g_depth);

	stalls(g_depth+1) <=  stall_in;
	stall_vector <= stalls(1 to g_depth);

        genSR: for I in 1 to g_depth generate 
	  stalls(I) <= (ivalids(I) and stalls(I+1));

	  process(clk, reset)
	  begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				ivalids(I) <= '0';
			elsif (stalls(I) = '0') then
				ivalids(I) <= ivalids(I-1);
			end if;
		end if;
   	   end process;
        end generate genSR;

end behave;
