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
use ahir.Types.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

-- Assumption: guard-interface will not change until
-- sr_in -> sa_out sequence has completed.
--
entity SgiUpdateFsm is
	generic (name: string);
	port (cr_in: in Boolean;
		cr_out: out Boolean;
		ca_in: in Boolean;
		ca_out: out Boolean;
		pop_req: out std_logic;
		pop_ack: in std_logic;
		pop_data: in std_logic_vector(0 downto 0);
		clk, reset: in std_logic);
end entity;

architecture BehaviouralFsm of SgiUpdateFsm is

	type UpdateFsmState is (UpdateFsmRun, UpdateFsmWaitPop, UpdateFsmWaitCain);
	signal update_fsm_state: UpdateFsmState;

	signal ca_out_d, ca_out_u: boolean;

-- see comment above..
--##decl_synopsys_sync_set_reset##
begin

	process(clk, reset, pop_ack, cr_in, ca_in, pop_data, update_fsm_state)
		variable next_update_fsm_state_var: UpdateFsmState;
		variable pop_req_var : std_logic;
		variable cr_out_var, ca_out_d_var, ca_out_u_var: boolean;
	begin
		next_update_fsm_state_var := update_fsm_state;
		pop_req_var := '0';
		cr_out_var := false;
		ca_out_d_var := false;
		ca_out_u_var := false;

		case update_fsm_state is
			when UpdateFsmRun =>
				if(cr_in) then
					pop_req_var := '1';
					if(pop_ack = '1') then
						if(pop_data(0) = '0') then
							ca_out_d_var := true;
						else
							cr_out_var := true;
							next_update_fsm_state_var := UpdateFsmWaitCain;
						end if;
					else
						next_update_fsm_state_var := UpdateFsmWaitPop;
					end if;
				end if;
			when UpdateFsmWaitPop =>
				pop_req_var := '1';
				if(pop_ack = '1') then
					if(pop_data(0) = '0') then
						ca_out_d_var := true;
						next_update_fsm_state_var := UpdateFsmRun;
					else
						cr_out_var := true;
						next_update_fsm_state_var := UpdateFsmWaitCain;
					end if;
				end if;
			when UpdateFsmWaitCain =>
				if(ca_in) then
					ca_out_u_var := true;
					if(cr_in) then 
						pop_req_var := '1';
						if(pop_ack = '1') then
							if(pop_data(0) = '0') then
								ca_out_d_var := true;
								next_update_fsm_state_var := UpdateFsmRun;
							else
								cr_out_var := true;
							end if;
						else
							next_update_fsm_state_var := UpdateFsmWaitPop;
						end if;
					else
						next_update_fsm_state_var := UpdateFsmRun;
					end if;
				end if;
		end case;

		ca_out_u <= ca_out_u_var;
		cr_out   <= cr_out_var;
		pop_req  <= pop_req_var;

		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				ca_out_d <= false;
				update_fsm_state <= UpdateFsmRun;
			else
				ca_out_d <= ca_out_d_var;
				update_fsm_state <= next_update_fsm_state_var;
			end if;
		end if;
	end process;

	ca_out <= ca_out_d or ca_out_u;
end BehaviouralFsm;
	
