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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
entity control_delay_element is
  generic (name: string; delay_value: integer := 0);
  port (
    req   : in Boolean;
    ack   : out Boolean;
    clk   : in  std_logic;
    reset : in  std_logic);

end control_delay_element;

architecture default_arch of control_delay_element is
  
-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- default_arch

  ZeroDelay: if (delay_value <= 0) generate
    ack <= req;
  end generate ZeroDelay;

  UnitDelay: if (delay_value = 1) generate

	process(clk)
        begin
		if(clk'event and clk = '1') then 
			if(reset = '1') then
				ack <= false;
			else	
				ack <= req;
			end if;
		end if;
	end process;

  end generate UnitDelay;


  DelayGTOne: if (delay_value > 1) generate

   ShiftReg: block
	signal sr_state: BooleanArray(0 to delay_value-1);
   begin
 	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				sr_state <= (others => false);
			else
				sr_state(0) <= req;
				for I in 1 to delay_value-1 loop
					sr_state(I) <= sr_state(I-1);
				end loop;
			end if;
		end if;
	end process;
	ack <= sr_state(delay_value-1);
   end block;
  end generate DelayGTOne;

end default_arch;
