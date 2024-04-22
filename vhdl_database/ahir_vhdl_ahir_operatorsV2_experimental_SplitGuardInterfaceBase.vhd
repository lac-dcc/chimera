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
use ahir.GlobalConstants.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##


-- a guard-interface to conform with the split protocol.
-- With this interface, the guard at the time of initiation
-- of the operation will be remembered (using a queue) 
-- and the remembered value will be used to generate the
-- completion protocol.
-- 
-- The benefit is that the guard-expression can be reevaluated
-- as soon as the operation starts (instead of waiting
-- for the operation to finish...).  This helps pipelining.
--
-- Assumptions
--   1. sr_in -> sr_in without intervening sa_out is not possible.
--   2. cr_in -> cr_in without intervening ca_out is not possible.
--
entity SplitGuardInterfaceBase is
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


architecture Behave of SplitGuardInterfaceBase is
  signal push, push_ack, pop, pop_ack: std_logic;
  signal qdata_in, qdata : std_logic_vector(0 downto 0);

  type RhsState is (r_Idle, r_Wait_On_Ack_In, r_Wait_On_Queue);
  signal rhs_state: RhsState;

  -- for debug purposes only
  signal s_counter, c_counter: integer;

  -- number of stages!  This will cause
  -- the minimum latency of sr -> ca to
  -- increase to this number...  Be careful..
  constant g_queue_number_of_stages : integer := Ceil(buffering, max_single_bit_queue_depth_per_stage);

  -- constant g_queue_number_of_stages : integer := 1;
 
  signal sr_in_q : Boolean;
  signal guard_interface_sustained, guard_interface_registered: std_logic;

-- see comment above..
--##decl_synopsys_sync_set_reset##

begin
	qdata_in(0) <= guard_interface;

	qI: ShiftRegisterSingleBitQueue  -- bypass to maintain delays
		generic map(name => name & "-qI", 
					queue_depth => buffering, 
					number_of_stages => g_queue_number_of_stages,
					bypass_flag => true
			   )
		port map(clk => clk, reset => reset,
				data_in => qdata_in,
				push_req => push,
				push_ack => push_ack,
				data_out => qdata,
				pop_req => pop,
				pop_ack => pop_ack);

	-----------------------------------------------------------------------------------------------
	-- sample side logic.
	-----------------------------------------------------------------------------------------------
	sampleFsm: SgiSampleFsm
			generic map (name => name & "-sample-fsm")
			port map (clk => clk, reset => reset,
					sr_in => sr_in, sr_in_q => sr_in_q,
					push_req => push, push_ack => push_ack);


	-- Race condition in PHI statements can be an issue!
	process(clk, reset, guard_interface, sr_in)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				guard_interface_registered <= '0';
			elsif(sr_in) then
				guard_interface_registered <= guard_interface;
			end if;
		end if;
	end process;
	guard_interface_sustained <= guard_interface when sr_in else guard_interface_registered;

	-- sr_out
	sr_out <= sr_in_q when (guard_interface_sustained = '1') else false;
	
	-- sa_out
	sa_out <= sr_in_q when (guard_interface_sustained = '0') else sa_in;

	-----------------------------------------------------------------------------------------------
	-- update side logic.
	-----------------------------------------------------------------------------------------------
	updateFsm: SgiUpdateFsm
			generic map 
				 (name => name & "-update-fsm")
			port map (clk => clk,
					reset => reset,
					cr_in => cr_in,
					cr_out => cr_out,
					ca_in => ca_in,
					ca_out => ca_out,
					pop_req => pop,
					pop_ack => pop_ack,
					pop_data => qdata);

end Behave;
