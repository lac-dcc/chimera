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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

-- Assumption: guard-interface will not change until
-- sr_in -> sa_out sequence has completed.
--
entity SgiSampleFsm is
	generic (name: string);
	port (sr_in: in Boolean;
		sr_in_q: out Boolean;
		push_req: out std_logic;
		push_ack: in std_logic;
		clk, reset: in std_logic);
end entity;

architecture BehaviouralFsm of SgiSampleFsm is
	type SrInState is (Idle, WaitOnPushAck);
	signal sr_in_state: SrInState;

	signal sr_in_q_sig: Boolean;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin

	sr_in_q <= sr_in_q_sig;

	process(sr_in_state, sr_in, push_ack, clk, reset)
		variable next_sr_in_state: SrInState;
		variable sr_in_q_var: Boolean;
		variable push_req_var: std_logic;
	begin
		sr_in_q_var := false;
		next_sr_in_state := sr_in_state;
		push_req_var := '0';

		case sr_in_state is
			when Idle =>
				if (sr_in) then
					push_req_var := '1';
					if(push_ack = '1') then
						sr_in_q_var := true;
					else
						next_sr_in_state := WaitOnPushAck;
					end if;
				end if;
			when WaitOnPushAck =>
				push_req_var := '1';
				if(push_ack = '1') then
					sr_in_q_var := true;
					next_sr_in_state := Idle;
				end if;
		end case;

		push_req <= push_req_var;
		sr_in_q_sig  <= sr_in_q_var;

		if (clk'event and clk = '1') then
			if(reset = '1') then
				sr_in_state <= Idle;
			else
				sr_in_state <= next_sr_in_state;
			end if;
		end if;
	end process;
end BehaviouralFsm;
	
