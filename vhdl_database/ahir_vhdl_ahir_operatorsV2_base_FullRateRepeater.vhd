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
-- copyright: Madhav Desai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity FullRateRepeater is
  generic(name : string;  data_width: integer := 32);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity FullRateRepeater;

architecture behave of FullRateRepeater is

-- see comment above..
--##decl_synopsys_sync_set_reset##

       type RepeaterState is (Empty, Full);
       signal repeater_state: RepeaterState;

       signal data_reg: std_logic_vector(data_width-1 downto 0);
begin  -- SimModel

    process(clk, reset, repeater_state, push_req, pop_req, data_in)
	variable nstate: RepeaterState;
	variable push_ack_v, pop_ack_v : std_logic;
	variable load_reg : boolean;
    begin
	
	nstate := repeater_state;
	push_ack_v := '0';
	pop_ack_v  := '0';
	load_reg := false;

	case repeater_state is
		when Empty =>
			push_ack_v := '1';
			if(push_req = '1')  then
				load_reg := true;
				nstate   := Full;
			end if;
		when Full =>
			pop_ack_v := '1';
			if(pop_req = '1') then
				push_ack_v := '1';
				if(push_req = '0') then
					nstate := Empty;
				else
					load_reg := true;
				end if;
			end if;
	end case;

	push_ack <= push_ack_v;
	pop_ack  <= pop_ack_v;
		
	if(clk'event and clk = '1') then
		if(reset = '1') then
			repeater_state <= Empty;
		else
			repeater_state <= nstate;
			if(load_reg) then
				data_reg <= data_in;
			end if;
		end if;
	end if;
    end process;

    data_out <= data_reg;

end behave;
