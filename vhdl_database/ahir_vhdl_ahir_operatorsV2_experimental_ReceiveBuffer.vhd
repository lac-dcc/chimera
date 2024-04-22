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
-- TODO: add bypass path to the receive buffer.
--       this will reduce buffering requirements
--       by a factor of two (for full pipelining).
--
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity ReceiveBuffer  is
  generic (name: string; buffer_size: integer ; data_width : integer ; full_rate: boolean);
  port ( write_req: in boolean;
         write_ack: out boolean;
         write_data: in std_logic_vector(data_width-1 downto 0);
         read_req: in std_logic;
         read_ack: out std_logic;
         read_data: out std_logic_vector(data_width-1 downto 0);
         clk : in std_logic;
         reset: in std_logic);
end ReceiveBuffer;

architecture default_arch of ReceiveBuffer is

  signal push_req, push_ack, pop_req, pop_ack: std_logic_vector(0 downto 0);
  signal pipe_data_in:  std_logic_vector(data_width-1 downto 0);

  constant use_full_rate_repeater : boolean := (full_rate and (buffer_size = 1));

  type RxBufFsmState is (idle, busy);
  signal fsm_state : RxBufFsmState;

-- see comment above..
--##decl_synopsys_sync_set_reset##



begin  -- default_arch

  -- the output pipe.
  notFRR: if not use_full_rate_repeater generate
    bufPipe : PipeBase 
    generic map (
      name =>  name & "-bufPipe",
      num_reads  => 1,
      num_writes => 1,
      data_width => data_width,
      lifo_mode  => false,
      shift_register_mode => false,
      depth      => buffer_size,
      full_rate  => full_rate)
    port map (
        read_req   => pop_req,
        read_ack   => pop_ack,
        read_data  => read_data,
        write_req  => push_req,
        write_ack  => push_ack,
        write_data => write_data,
        clk        => clk,
        reset      => reset);
  end generate notFRR;

  FRR: if use_full_rate_repeater generate
    bufRptr: FullRateRepeater
    generic map (
      name =>  name & "-frrptr",
      data_width => data_width)
    port map ( clk => clk,reset => reset,
		data_in => write_data,
		data_out => read_data,
		push_req => push_req(0),
		pop_req => pop_req(0),
		push_ack => push_ack(0),
		pop_ack => pop_ack(0));
  end generate FRR;

  read_ack <= pop_ack(0);
  pop_req(0) <= read_req;

  -- FSM
  process(clk,reset, fsm_state, write_req, push_ack)
	variable nstate : RxBufFsmState;
	variable pushreqv: std_logic;
	variable decr: boolean;
	variable wackv : boolean;
  begin
	wackv := false;
	pushreqv := '0'; 

	nstate := fsm_state;
	case fsm_state is
		when idle => 
			if(write_req) then
				pushreqv := '1';
				if(push_ack(0) = '1') then 
					wackv := true;
				else
					nstate := busy;	
				end if;
			end if;
		when busy => 
			pushreqv := '1';
			if (push_ack(0) = '1') then
				nstate := idle;
				wackv := true;
			end if;
	end case;

	push_req(0) <= pushreqv;
	write_ack <= wackv;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			fsm_state <= idle;
		else
			fsm_state <= nstate;
		end if;
	end if;
		
  end process;
end default_arch;
