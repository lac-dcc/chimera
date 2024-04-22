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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;

entity QueueWithBypass is
  generic(name : string; queue_depth: integer := 1; data_width: integer := 32);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity QueueWithBypass;

architecture behave of QueueWithBypass is

	signal number_of_elements_in_queue: unsigned( (Ceil_Log2(queue_depth+2))-1 downto 0); 

	signal qpush_req, qpush_ack, qpop_req, qpop_ack: std_logic;
	signal qdata_in, qdata_out: std_logic_vector(data_width-1 downto 0);

	signal qhas_data: Boolean;
	signal bypass_active : Boolean;

	signal empty, full: std_logic;

-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- SimModel

  assert (queue_depth > 0) report "QueueWithBypass "  &  name  & " must have depth > 0 "
				severity failure;

  qhas_data <= (empty = '0');

  -- queue will always accept if there is room.
  -- but it is possible that the accepted data goes 
  -- straight to the output.
  push_ack <= '1' when (full = '0') else '0';
 
  qinst: QueueBaseWithEmptyFull 
		generic map (name => name & "-qbase", queue_depth => queue_depth, data_width => data_width)
		port map (clk => clk, reset => reset, empty => empty, full => full,
				data_in => qdata_in, push_req => qpush_req, push_ack => qpush_ack,
				data_out => qdata_out, pop_req => qpop_req, pop_ack => qpop_ack);

  -- bypass is active?
  bypass_active <= (not qhas_data) and (pop_req = '1');

  -- push into the queue when queue-has-data = '1' or when the world does not care
  qpush_req <= push_req  when (not bypass_active) else  '0';
  qdata_in  <= data_in;

  -- pop from queue when queue-has-data = '1'.
  data_out <= qdata_out when qhas_data else data_in;
  qpop_req <= pop_req   when qhas_data else '0';
  
  -- Note: the forward path from push_req to pop_ack!
  pop_ack  <= qpop_ack  when qhas_data else push_req;

end behave;
