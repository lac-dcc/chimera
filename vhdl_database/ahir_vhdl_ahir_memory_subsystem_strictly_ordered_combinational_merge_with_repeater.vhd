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
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity combinational_merge_with_repeater is
  generic (
    name: string;
    g_data_width       : natural;
    g_number_of_inputs: natural;
    g_time_stamp_width : natural);
  port(
    clk : in std_logic;
    reset : in std_logic;
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    in_tstamp: in std_logic_vector((g_number_of_inputs*g_time_stamp_width)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    out_tstamp: out std_logic_vector(g_time_stamp_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end combinational_merge_with_repeater;

architecture Struct of combinational_merge_with_repeater is

  signal sel_vector : std_logic_vector(g_number_of_inputs-1 downto 0);

  signal rep_data_in : std_logic_vector(g_data_width-1 downto 0);
  signal rep_req_in, rep_ack_out: std_logic;
  
begin  

   cmerge: combinational_merge 
		generic map (name => name & "-cmerge", g_data_width => g_data_width,
			 g_number_of_inputs => g_number_of_inputs,
			 g_time_stamp_width => g_time_stamp_width)
		port map(in_data => in_data,
			 in_tstamp => in_tstamp,
			 out_data => rep_data_in,
			 out_tstamp => open,
			 in_req => in_req,
			 in_ack => in_ack,
			 out_req => rep_req_in,
			 out_ack => rep_ack_out);

    -- instantiate repeater only if the number of inputs is > 1.
    moreThanOneInputGen: if (g_number_of_inputs > 1) generate
    rptr:  mem_repeater generic map (name => name & "-rptr", g_data_width => g_data_width)
		port map(clk => clk, reset => reset,
			 data_in => rep_data_in,
			 req_in => rep_req_in,
			 ack_out => rep_ack_out,
			 data_out => out_data,
			 req_out => out_req,
			 ack_in => out_ack);	
    end generate moreThanOneInputGen;

    OneInputGen: if (g_number_of_inputs = 1) generate
         out_data <= rep_data_in;
         out_req  <= rep_req_in;
         rep_ack_out <= out_ack;
    end generate OneInputGen;
  
end Struct;
