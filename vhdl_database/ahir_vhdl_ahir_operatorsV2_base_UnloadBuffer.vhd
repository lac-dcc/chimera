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

--
-- The unload buffer is used all over the place.  We will use
-- three forms
--     depth <= 1
--         fast cut through with buffering provided by a single register
--     depth >= 2
--         queue + wastes a buffer.  this needs to be sorted out.
--
--  Using shallow buffers (<= 1) will result in fast in->out 
--  performance but combinational through paths.  Using deeper
--  buffers will result in at least one unit of delay from in->out
--
-- Added Nov 2019.  Added use_unload_register generic.
--
--   This avoids wastage of an extra register in the unload-buffer.
--   but must be used with a cut-through that has a combinational
--   unload_ack to write_ack path.
-- 
entity UnloadBuffer is
  generic (name: string; buffer_size: integer ; data_width : integer ; 
			-- bypass = true means there are some combi paths.
			--   from write_req to unload_ack
			--   from unload_req to write_ack
			--   from write_data to read_data.
			bypass_flag : boolean := false; 
			-- self-explanatory.
			nonblocking_read_flag : boolean := false;
			-- if false use new revised version of the unload buffer (revised)
			-- which does not need an unload-register.
			use_unload_register: boolean := true);
  port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
	has_data: out std_logic;
        clk : in std_logic;
        reset: in std_logic);
end UnloadBuffer;

architecture default_arch of UnloadBuffer is

  signal pop_req, pop_ack, push_req, push_ack: std_logic_vector(0 downto 0);
  signal pipe_data_out, data_to_unload_register:  std_logic_vector(data_width-1 downto 0);

  signal pipe_has_data: boolean;

  signal unload_register_ready: boolean;

  signal pop_req_from_unload_register : std_logic;
  signal pop_ack_to_unload_register   : std_logic;

  signal write_to_pipe: boolean;
  signal unload_from_pipe : boolean;

  signal empty, full: std_logic;
  --
  -- try to save a slot if buffer size is 1... this
  -- tries to prevent a 100% wastage of resources
  -- and allows us to use 2-depth buffers to cut long
  -- combinational paths.
  --
  function DecrDepth (buf_size: integer; bypass: boolean)
	return integer is
      variable ret_val: integer;
  begin
      ret_val := buf_size;
      if((not bypass) and (buffer_size = 1)) then
	ret_val := buf_size - 1;
      end if;
      return ret_val;
  end function DecrDepth;

  constant actual_buffer_size  : integer  := DecrDepth (buffer_size, bypass_flag);

  constant bypass_flag_to_ureg : boolean := (bypass_flag or (buffer_size = 0));

  constant shallow_flag : boolean :=    (buffer_size < global_pipe_shallowness_threshold);

  constant optimized_case : boolean :=
			global_use_optimized_unload_buffer 
				and (buffer_size > 0) and shallow_flag and (not bypass_flag) and
									(not use_unload_register);

  constant revised_case: boolean := 
	(not optimized_case) and 
		((buffer_size > 0) and shallow_flag and (not use_unload_register) and (not nonblocking_read_flag));

  constant un_revised_case: boolean :=  (not revised_case) and (not optimized_case);

  -- constant revised_case: boolean := false;

-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- default_arch

  OptimizedCase: if optimized_case generate
     ulb_revised: UnloadBufferOptimized
			generic map (name => name & "-revised",
					buffer_size => buffer_size, 
					data_width => data_width,
					nonblocking_read_flag => nonblocking_read_flag)
			port map (
				write_req => write_req,
				write_ack => write_ack,
				unload_req => unload_req,
				unload_ack => unload_ack,
				write_data => write_data,
				read_data => read_data, 
				has_data => has_data,
				clk => clk, reset => reset);
	
  end generate OptimizedCase;

  RevisedCase: if revised_case generate
	ulb_revised: UnloadBufferRevised
			generic map (name => name & "-revised",
					buffer_size => buffer_size, data_width => data_width,
						bypass_flag => bypass_flag)
			port map (
				write_req => write_req,
				write_ack => write_ack,
				unload_req => unload_req,
				unload_ack => unload_ack,
				write_data => write_data,
				read_data => read_data, 
				has_data => has_data,
				clk => clk, reset => reset);
  end generate RevisedCase;

  DeepCase: if not shallow_flag generate
	ulb_deep: UnloadBufferDeep
			generic map (name => name & "-deep",
					buffer_size => buffer_size, data_width => data_width,
						nonblocking_read_flag => nonblocking_read_flag)
			port map (
				write_req => write_req,
				write_ack => write_ack,
				unload_req => unload_req,
				unload_ack => unload_ack,
				write_data => write_data,
				read_data => read_data, 
				has_data => has_data,
				clk => clk, reset => reset);
  end generate DeepCase;

  NotRevisedCase: if un_revised_case generate

    ShallowCase: if shallow_flag  generate
      bufGt0: if actual_buffer_size > 0 generate

  	has_data <= '1' when pipe_has_data else '0';

  	pipe_has_data <= (empty = '0');
	write_to_pipe <= (pipe_has_data or (not unload_register_ready));
	unload_from_pipe <= pipe_has_data;

	unload_register_ready <= (pop_req_from_unload_register = '1');
 
	-- if pipe does not have data, then we will be bypassing write-data straight
	-- to the unload-register, if it is ready to accept stuff.
	push_req(0) <= write_req when write_to_pipe else '0';
	write_ack   <= push_ack(0);

	pop_ack_to_unload_register <= pop_ack(0) when unload_from_pipe else write_req;
	pop_req(0)  <= pop_req_from_unload_register;
	data_to_unload_register <= pipe_data_out when unload_from_pipe else write_data;

  	-- the input pipe.
  	bufPipe : QueueBaseWithEmptyFull generic map (
        	name =>  name & "-blocking_read-bufPipe",
        	data_width => data_width,
        	queue_depth      => actual_buffer_size)
      	port map (
        	pop_req   => pop_req(0),
        	pop_ack   => pop_ack(0),
        	data_out  => pipe_data_out,
        	push_req  => push_req(0),
        	push_ack  => push_ack(0),
        	data_in => write_data,
		empty => empty,
		full => full,
        	clk        => clk,
        	reset      => reset);

     end generate bufGt0;
	

     -- unload-register will provide bypassed buffering.
     bufEq0: if (actual_buffer_size = 0) generate

	empty <= '1';
	full  <= '0';

	has_data <= '0';

	data_to_unload_register <= write_data;
	pop_ack_to_unload_register <= write_req;
	write_ack  <= pop_req_from_unload_register;
     end generate bufEq0;

     ulReg: UnloadRegister 
			generic map (name => name & "-unload-register",
					data_width => data_width,
						bypass_flag => bypass_flag_to_ureg,
						   nonblocking_read_flag => nonblocking_read_flag)
			port map (
					write_data => data_to_unload_register,
					write_req => pop_ack_to_unload_register,
					write_ack => pop_req_from_unload_register,
					unload_req => unload_req,
					unload_ack => unload_ack,
					read_data => read_data,
					clk => clk,  reset => reset
				);
							
   end generate ShallowCase;
 end generate NotRevisedCase;

end default_arch;
