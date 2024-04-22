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
library ahir;
use ahir.Utilities.all;
use ahir.SubPrograms.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity BranchBase is
  generic (name: string; condition_width: integer := 1; bypass_flag: boolean := false);
  port (condition: in std_logic_vector(condition_width-1 downto 0);
        clk,reset: in std_logic;
        req: in Boolean;
        ack0: out Boolean;
        ack1: out Boolean);
end entity;


architecture Behave of BranchBase is

-- see comment above..
--##decl_synopsys_sync_set_reset##

begin

 noBypass: if not bypass_flag generate
  process(clk)
    variable c_reduce : std_logic;
  begin
    if(clk'event and clk = '1') then
      if(reset = '1') then
        ack0 <= false;
        ack1 <= false;
      elsif req then

	assert(not is_X(condition)) report 
		"branch condition is X" severity error;

        c_reduce := OrReduce(condition);
	
        if(c_reduce = '1') then
          ack1 <= true;
          ack0 <= false;
        else
          ack0 <= true;
          ack1 <= false;
        end if;
      else
        ack0 <= false;
        ack1 <= false;
      end if;
    end if;
  end process;
 end generate noBypass;

 yesBypass: if bypass_flag generate

    process(condition, req)
	variable c_reduce: std_logic;
    begin
        c_reduce := OrReduce(condition);
	if(req) then
		ack0 <= (c_reduce = '0');
		ack1 <= (c_reduce = '1');
	else
		ack0 <= false;
		ack1 <= false;
	end if;
    end process;
 end generate yesBypass;

end Behave;

