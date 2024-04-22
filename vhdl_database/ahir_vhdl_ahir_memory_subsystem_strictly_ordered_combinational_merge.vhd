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

entity combinational_merge is
  generic (
    name: string;
    g_data_width       : natural;
    g_number_of_inputs: natural;
    g_time_stamp_width : natural);
  port(
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    in_tstamp: in std_logic_vector((g_number_of_inputs*g_time_stamp_width)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    out_tstamp: out std_logic_vector(g_time_stamp_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end combinational_merge;

architecture combinational_merge of combinational_merge is

  signal sel_vector : std_logic_vector(g_number_of_inputs-1 downto 0);
  
begin  -- combinational_merge

  process(in_tstamp,in_data,in_req)
    variable best_tstamp_var : std_logic_vector(1 to g_time_stamp_width);
    variable best_data : std_logic_vector(1 to g_data_width);
    variable sel_var : std_logic_vector(g_number_of_inputs-1 downto 0);
    variable vflag : std_logic;
  begin
    Select_Best_Index(in_tstamp,in_data, in_req,best_tstamp_var,best_data,sel_var,vflag);
    if(vflag = '1') then
      out_tstamp <= best_tstamp_var;
      out_data <= best_data;
      sel_vector <= sel_var;
      out_req <= '1';
    else
      out_tstamp <= (others => '0');
      out_data <= (others => '0');
      sel_vector <= (others => '0');
      out_req <= '0';
    end if;
  end process;
  
  AckGen: for I in 0 to g_number_of_inputs-1 generate
    in_ack(I) <= '1' when (sel_vector(I) = '1'  and out_ack = '1' and in_req(I) = '1') else '0';
  end generate AckGen;
  
end combinational_merge;
