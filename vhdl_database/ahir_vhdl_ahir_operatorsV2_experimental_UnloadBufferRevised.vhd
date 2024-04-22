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
--
-- A more "optimized" version of the old UnloadBuffer.
-- tries to avoid the use of an extra register.  Use
-- when buffer-size > 1.
--  
--
entity UnloadBufferRevised is

  generic (name: string; 
		buffer_size: integer ; 
		data_width : integer ; 
		bypass_flag: boolean );

  port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
	has_data: out std_logic;
        clk : in std_logic;
        reset: in std_logic);

end UnloadBufferRevised;

architecture default_arch of UnloadBufferRevised is

  signal pop_req, pop_ack, push_req, push_ack: std_logic_vector(0 downto 0);

  signal pipe_data_out, ufsm_bypass_write_data, ufsm_write_data:  std_logic_vector(data_width-1 downto 0);
  signal pipe_has_data: boolean;


  signal write_to_pipe: boolean;
  signal unload_from_pipe : boolean;

  signal empty, full: std_logic;
  signal ufsm_write_req, ufsm_write_ack: std_logic;
  signal ufsm_bypass_write_req, ufsm_bypass_write_ack: std_logic;

-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- default_arch

	ufsm_write_data <= pipe_data_out;
	ufsm_write_req  <= pop_ack(0);
	pop_req(0) <= ufsm_write_ack;

	push_req(0) <= write_req;
	write_ack   <= push_ack(0);

	ufsm: UnloadFsm generic map (name => name & ":ufsm", data_width => data_width)
		port map (
			   write_req => ufsm_write_req,
			   write_ack => ufsm_write_ack,
			   unload_req => unload_req,
			   unload_ack => unload_ack,
			   data_in => ufsm_write_data,
			   data_out => read_data,
			   clk => clk, reset => reset);

  	pipe_has_data <= (empty = '0');
  	has_data <= '1' when pipe_has_data else '0';


  	bufPipe : QueueBaseWithEmptyFull generic map (
        	name =>  name & "-blocking_read-bufPipe",
        	data_width => data_width,
		reverse_bypass_flag => bypass_flag,
        	queue_depth      => buffer_size)
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

	
end default_arch;
