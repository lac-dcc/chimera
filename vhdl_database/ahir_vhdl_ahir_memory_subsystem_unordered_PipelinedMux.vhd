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

entity PipelinedMux is
  generic (
    name : string;
    g_number_of_inputs: natural;          
    g_data_width: natural;          -- total width of data
                                        -- (= actual-data & tag & port_id)
    g_mux_degree :natural;         -- max-indegree of each pipeline-stage
    g_port_id_width: natural
    );       

  port (
    merge_data_in : in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    merge_req_in  : in std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_data_out: out std_logic_vector(g_data_width-1 downto 0);
    merge_req_out : out std_logic;
    merge_ack_in  : in std_logic;
    clock: in std_logic;
    reset: in std_logic);
  
end PipelinedMux;


architecture pipelined of PipelinedMux is
  constant c_number_of_stages : integer := Maximum(1,Ceil_Log(g_number_of_inputs, g_mux_degree));
  constant c_total_intermediate_width : natural := Total_Intermediate_Width(g_number_of_inputs,g_mux_degree);

  -- intermediate signals used to cross levels.
  signal intermediate_vector : std_logic_vector(0 to ((g_data_width)*c_total_intermediate_width)-1);  
  signal intermediate_req_vector : std_logic_vector(0 to (c_total_intermediate_width)-1);
  signal intermediate_ack_vector : std_logic_vector(0 to (c_total_intermediate_width)-1);

begin  -- behave

  assert Stage_Width(c_number_of_stages,g_mux_degree, g_number_of_inputs) = 1 report "last stage should have one input!" severity error;
  
  intermediate_vector(
    Left_Index(0,g_mux_degree,g_number_of_inputs)*g_data_width to
    ((Right_Index(0,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1)
    <= merge_data_in;

  intermediate_req_vector(
    Left_Index(0,g_mux_degree,g_number_of_inputs) to
    Right_Index(0,g_mux_degree,g_number_of_inputs))
    <= merge_req_in;

  merge_ack_out <=
    intermediate_ack_vector(
      Left_Index(0,g_mux_degree,g_number_of_inputs) to
      Right_Index(0,g_mux_degree,g_number_of_inputs));

  PipelineGen:  for LEVEL  in 0 to c_number_of_stages-1  generate

    -- Each stage has multiple inputs and multiple outputs..
    mBoxPipeStage : PipelinedMuxStage generic map (
      name => name & "-mBoxPipeState-" & Convert_Integer_To_String(LEVEL),
      g_data_width => g_data_width,
      g_number_of_inputs => Stage_Width(LEVEL,g_mux_degree,g_number_of_inputs),
      g_number_of_outputs => Stage_Width(LEVEL+1,g_mux_degree,g_number_of_inputs))
      port map ( data_left =>
                 intermediate_vector(
                   Left_Index(LEVEL,g_mux_degree,g_number_of_inputs)*g_data_width to
                   ((Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
                 req_in =>
                 intermediate_req_vector(
                   Left_Index(LEVEL,g_mux_degree,g_number_of_inputs) to
                   Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)),
                 ack_out =>
                   intermediate_ack_vector(
                     Left_Index(LEVEL,g_mux_degree,g_number_of_inputs) to
                     Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)),
                 data_right =>
                 intermediate_vector(
                   Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)*g_data_width to
                   ((Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
                 req_out =>
                 intermediate_req_vector(
                   Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs) to
                   Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)),
                 ack_in =>
                   intermediate_ack_vector(
                     Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs) to
                     Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)),
                 clock => clock,
                 reset => reset);
                   
  end generate;  -- PipelineGen

  -- to the right (pad the required number of shifts)
  merge_data_out <= intermediate_vector(
        Left_Index(c_number_of_stages,g_mux_degree,g_number_of_inputs)*g_data_width to
        ((Right_Index(c_number_of_stages,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1);
  merge_req_out <= 
	intermediate_req_vector(Left_Index(c_number_of_stages,g_mux_degree, g_number_of_inputs));
  intermediate_ack_vector(Left_Index(c_number_of_stages,g_mux_degree, g_number_of_inputs)) 
	<= merge_ack_in;


end pipelined;

