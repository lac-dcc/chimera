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
use ahir.Types.all;
use ahir.Components.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

--  input port specialized for P2P ports.
entity InputPort_P2P is
  generic (name : string;
	   data_width: integer;
	   queue_depth: integer;
	   bypass_flag: boolean := false;
	   barrier_flag: boolean := false;
	   nonblocking_read_flag: boolean);
  port (
    -- pulse interface with the data-path
    sample_req        : in  Boolean; -- sacrificial.
    sample_ack        : out Boolean; -- sacrificial.
    update_req        : in  Boolean;
    update_ack        : out Boolean;
    data              : out std_logic_vector(data_width-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;


architecture Base of InputPort_P2P is
  signal noblock_update_req, noblock_update_ack: boolean;
  signal noblock_data : std_logic_vector(data_width-1 downto 0);
  type SampleFsmState is (IDLE, WAITING);
  signal fsm_state: SampleFsmState;
  signal has_data: std_logic;

  constant use_unload_register :boolean := (queue_depth = 1) or bypass_flag;

begin

    noBarrier: if (not barrier_flag) or nonblocking_read_flag generate
	sample_ack <= sample_req;
    end generate noBarrier; 

    withBarrier: if (barrier_flag and (not nonblocking_read_flag)) generate
     -- sample ack when there is something at the 
     -- input of the port.  This is useful in 
     -- setting up barriers.
       process(clk, reset, fsm_state, sample_req, oack)
       	variable next_fsm_state: SampleFsmState;
       begin
	next_fsm_state := fsm_state;
	sample_ack <= false;
	case fsm_state is
		when IDLE => 
			if ((oack = '1') or (has_data = '1')) then
				sample_ack <= sample_req;
			elsif sample_req then
				next_fsm_state := WAITING;
			end if;
		when WAITING => 
			if (has_data = '1') or (oack = '1') then
				sample_ack <= true;
				next_fsm_state := IDLE;
			end if;
	end case;
	if(clk'event and clk = '1') then
		if(reset = '1') then
			fsm_state <= IDLE;
		else
			fsm_state <= next_fsm_state;
		end if;
	end if;
       end process;
     end generate withBarrier;
	
     ub: UnloadBuffer
	generic map (name => name & "-ub", 
				data_width => data_width,
				   buffer_size => queue_depth, 
					bypass_flag => bypass_flag,  
						use_unload_register => use_unload_register,
							nonblocking_read_flag => nonblocking_read_flag)
	port map (write_req => oack, write_ack => oreq, 
					write_data => odata,
				unload_req => update_req,
				unload_ack => update_ack,
				has_data => has_data,
				read_data =>  data, clk => clk, reset => reset);
end Base;
