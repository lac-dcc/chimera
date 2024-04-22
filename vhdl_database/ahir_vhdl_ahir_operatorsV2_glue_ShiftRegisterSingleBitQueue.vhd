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
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.GlobalConstants.all;

--
-- higher in->out latency, but distributed in space (think ASIC, ASIC).
-- often good enough.
--
entity ShiftRegisterSingleBitQueue is
  generic(name : string; queue_depth: integer; number_of_stages: integer; bypass_flag: boolean := false);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(0 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(0 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity ShiftRegisterSingleBitQueue;

architecture behave of ShiftRegisterSingleBitQueue is

  constant stage_depth : integer := Ceil(queue_depth, number_of_stages);

  signal intermediate_data:   std_logic_vector(0 to number_of_stages);
  signal intermediate_lr_req: std_logic_vector(0 to number_of_stages);
  signal intermediate_lr_ack: std_logic_vector(0 to number_of_stages);

begin  -- SimModel

	assert(number_of_stages > 0) report "In " & name & " number of stages must be > 0 " severity failure;

     intermediate_data(0) <= data_in(0);
     intermediate_lr_req(0) <= push_req;
     push_ack <= intermediate_lr_ack(0);

     stageGen: for I in 0 to number_of_stages-1 generate
	qinst: SingleBitQueueBase 
		generic map (name => name & "-stageGen-qinst-" & Convert_To_String(I),
				queue_depth => stage_depth, bypass_flag => bypass_flag)
		port map ( reset => reset, clk => clk, 
				data_in => intermediate_data(I to I),
				push_req => intermediate_lr_req(I),
				push_ack => intermediate_lr_ack(I),
				pop_req  => intermediate_lr_ack(I+1), -- cross-over
				pop_ack => intermediate_lr_req(I+1), -- cross-over
				data_out => intermediate_data((I+1) to (I+1)));
     end generate stageGen;

     data_out(0) <= intermediate_data(number_of_stages);
     intermediate_lr_ack(number_of_stages) <= pop_req;
     pop_ack <= intermediate_lr_req(number_of_stages);

end behave;
