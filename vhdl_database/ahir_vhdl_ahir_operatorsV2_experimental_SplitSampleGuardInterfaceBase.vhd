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
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

-- A half guard interface which forwards only
-- the sample.  (used on output ports).
--  Madhav P. Desai.
entity SplitSampleGuardInterfaceBase is
	generic (name: string; buffering:integer);
	port (sr_in: in Boolean;
	      sa_out: out Boolean;
	      sr_out: out Boolean;
	      sa_in: in Boolean;
	      cr_in: in Boolean;
	      ca_out: out Boolean;
	      cr_out: out Boolean;
	      ca_in: in Boolean;
	      guard_interface: in std_logic;
	      clk: in std_logic;
	      reset: in std_logic);
end entity;


architecture Behave of SplitSampleGuardInterfaceBase is
	Type FsmState is (Idle, Busy);
	signal fsm_state: FsmState;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin

	-- cr/ca interface is a dummy... no need to forward to the
	-- operator which does not care anyway.
	cr_out <= false;
	process(clk,reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				ca_out <= false;
			else
				ca_out <= cr_in;
			end if;
		end if;
	end process;


	-- sample guard FSM.
	process(clk, guard_interface, fsm_state, sr_in, sa_in)
		variable next_state : FsmState;
		variable sr_out_var, sa_out_var: Boolean;
	begin
		next_state := fsm_state;
		sr_out_var := false;
		sa_out_var := false;
		case fsm_state is
			when Idle =>
				if(sr_in) then
					if(guard_interface  = '1') then
						sr_out_var := true;
						if(sa_in) then
							sa_out_var := true;
						else
							next_state := Busy;
						end if;
					else
						-- give ack, since guard is 0.
						sa_out_var := true;	
					end if;
				end if;
			when Busy => 
				if(sa_in) then
					next_state := Idle;
					sa_out_var := true;
				end if;
		end case;
		
		sr_out <= sr_out_var;
		sa_out <= sa_out_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= Idle;
			else 
				fsm_state <= next_state;
			end if;
		end if;
	end process;	
	
end Behave;
