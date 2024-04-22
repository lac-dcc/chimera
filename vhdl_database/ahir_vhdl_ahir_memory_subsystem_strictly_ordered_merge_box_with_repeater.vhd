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
-- TODO: some bug here.

entity merge_box_with_repeater is 
  generic (name: string;
	   g_data_width: natural := 10;
           g_number_of_inputs: natural := 8;
           g_number_of_outputs: natural := 1;
           g_time_stamp_width : natural := 3;   -- width of timestamp
           g_tag_width : natural := 3;  -- width of tag
           g_pipeline_flag: integer := 1     -- if 0, dont add pipe-line stage
           );            

  port(data_left: in  std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
       req_in : in std_logic_vector(g_number_of_inputs-1 downto 0);
       ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
       data_right: out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
       req_out : out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clock: in std_logic;
       reset: in std_logic);

end merge_box_with_repeater;

architecture behave of merge_box_with_repeater is

  constant c_actual_data_width  : natural := g_data_width - g_time_stamp_width;
  constant c_num_inputs_per_tree : natural := Ceiling(g_number_of_inputs,g_number_of_outputs);
  constant c_residual_num_inputs_per_tree : natural := (g_number_of_inputs - ((g_number_of_outputs-1)*c_num_inputs_per_tree));
  
  signal in_data : std_logic_vector((c_actual_data_width*g_number_of_inputs)-1 downto 0);
  signal in_tstamp : std_logic_vector((g_time_stamp_width*g_number_of_inputs)-1 downto 0);
  signal in_req,in_ack : std_logic_vector(g_number_of_inputs-1 downto 0);
  signal out_req,out_ack : std_logic_vector(g_number_of_outputs-1 downto 0);
  signal out_data : std_logic_vector((g_number_of_outputs*c_actual_data_width)-1 downto 0);
  signal out_tstamp : std_logic_vector((g_number_of_outputs*g_time_stamp_width)-1 downto 0);
  
  signal repeater_in, repeater_out : std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0);
  signal repeater_in_req,repeater_in_ack,repeater_out_req,repeater_out_ack : std_logic_vector(g_number_of_outputs-1 downto 0);

  function RepeaterShiftDelay (constant x : integer)
    return integer is
    variable ret_var :integer;
  begin
    ret_var := 0;
    if(x > 0) then
      ret_var := 1;
    end if;
    return(ret_var);
  end RepeaterShiftDelay;
  constant shift_delay : integer := RepeaterShiftDelay(g_pipeline_flag);
  
begin  -- behave

  assert g_number_of_inputs > 0 and g_number_of_outputs > 0 report "at least one i/p and o/p needed in merge-box with repeater" severity error;
  
  -- unpack input-side signals.
  genIn: for I in 0 to g_number_of_inputs-1 generate
    in_data((c_actual_data_width*(I+1))-1 downto (c_actual_data_width*I)) <=
      data_left((g_data_width*(I+1) -1) downto ((g_data_width*(I+1))-c_actual_data_width));
    in_tstamp((g_time_stamp_width*(I+1))-1 downto (g_time_stamp_width*I)) <=
      data_left(((g_data_width*(I+1) - c_actual_data_width) - 1) downto (g_data_width*I));
    in_req(I) <= req_in(I);
    ack_out(I) <= in_ack(I);
  end generate genIn;

  -- unpack output side signals.
  genOut: for I in 0 to g_number_of_outputs-1 generate
    repeater_in((g_data_width)*(I+1)-1 downto ((g_data_width)*I))
      <= out_data((c_actual_data_width*(I+1))-1 downto (c_actual_data_width*I)) &
           out_tstamp((g_time_stamp_width*(I+1))-1 downto (g_time_stamp_width*I));

    repeater_in_req(I) <= out_req(I);
    out_ack(I) <= repeater_in_ack(I);
    
    data_right((g_data_width*(I+1))-1 downto (g_data_width*I)) <=
          repeater_out((g_data_width)*(I+1)-1 downto ((g_data_width)*I));
    req_out(I) <= repeater_out_req(I);
    repeater_out_ack(I) <= ack_in(I);
  end generate genOut;

  -- now instantiate the comb.merge block followed by the
  -- repeater.
  ifgen: if g_number_of_outputs > 1 generate
    
    genLogic: for J in 0 to g_number_of_outputs-2 generate

      cmerge: combinational_merge
        generic map(name => name & "-cmerge" & Convert_Integer_To_String(J), 
		    g_data_width        => c_actual_data_width,
                    g_number_of_inputs  => c_num_inputs_per_tree,
                    g_time_stamp_width  => g_time_stamp_width)
        port map(in_data    => in_data    (((J+1)*c_num_inputs_per_tree*c_actual_data_width)-1
                                           downto
                                           (J*c_num_inputs_per_tree*c_actual_data_width)),
                 in_tstamp  => in_tstamp  (((J+1)*c_num_inputs_per_tree*g_time_stamp_width)-1
                                           downto
                                           (J*c_num_inputs_per_tree*g_time_stamp_width)),
                 out_data   => out_data   ((J+1)*(c_actual_data_width)-1 downto (J*c_actual_data_width)),
                 out_tstamp => out_tstamp ((J+1)*(g_time_stamp_width)-1 downto (J*g_time_stamp_width)),
                 in_req     => in_req     (((J+1)*c_num_inputs_per_tree)-1 downto (J*c_num_inputs_per_tree)),
                 in_ack     => in_ack     (((J+1)*c_num_inputs_per_tree)-1 downto (J*c_num_inputs_per_tree)),
                 out_req    => out_req    (J),
                 out_ack    => out_ack    (J));

      Rptr: mem_shift_repeater generic map(name => name & "-Rptr",
						g_data_width => g_data_width, g_number_of_stages => shift_delay)
        port map(clk      => clock,
                 reset    => reset,
                 data_in  => repeater_in      ((J+1)*(g_data_width) -1 downto (J*(g_data_width))),
                 req_in   => repeater_in_req  (J),
                 ack_out  => repeater_in_ack  (J),
                 data_out => repeater_out     ((J+1)*(g_data_width) -1 downto (J*(g_data_width))),
                 req_out  => repeater_out_req (J),
                 ack_in   => repeater_out_ack (J));
      
    end generate genLogic;
  end generate ifgen;


  -- residual block
  cmerge: combinational_merge
    generic map(name => name & "-residual-cmerge", g_data_width        => c_actual_data_width,
                g_number_of_inputs  => c_residual_num_inputs_per_tree,
                g_time_stamp_width  => g_time_stamp_width)
    port map(in_data    => in_data    ((g_number_of_inputs*c_actual_data_width-1) downto
                                       ((g_number_of_inputs*c_actual_data_width) -
                                        (c_residual_num_inputs_per_tree*c_actual_data_width))),
             in_tstamp  => in_tstamp  ((g_number_of_inputs*g_time_stamp_width-1) downto
                                       ((g_number_of_inputs*g_time_stamp_width) -
                                        (c_residual_num_inputs_per_tree*g_time_stamp_width))),
             out_data   => out_data   ((g_number_of_outputs)*(c_actual_data_width)-1 downto
                                       ((g_number_of_outputs-1)*c_actual_data_width)),
             out_tstamp => out_tstamp ((g_number_of_outputs)*(g_time_stamp_width)-1 downto
                                       ((g_number_of_outputs-1)*g_time_stamp_width)),
             in_req     => in_req     (g_number_of_inputs-1 downto
                                       (g_number_of_inputs - c_residual_num_inputs_per_tree)),
             in_ack     => in_ack     (g_number_of_inputs-1 downto
                                       (g_number_of_inputs - c_residual_num_inputs_per_tree)),
             out_req    => out_req    (g_number_of_outputs-1),
             out_ack    => out_ack    (g_number_of_outputs-1));

  -- residual repeater
  Rptr: mem_shift_repeater generic map(name => name & "-residual-Rptr", g_data_width => g_data_width, g_number_of_stages => shift_delay)
    port map(clk      => clock,
             reset    => reset,
             data_in  => repeater_in      ((g_number_of_outputs)*(g_data_width) -1 downto ((g_number_of_outputs-1)*(g_data_width))),
             req_in   => repeater_in_req  (g_number_of_outputs-1),
             ack_out  => repeater_in_ack  (g_number_of_outputs-1),
             data_out => repeater_out     ((g_number_of_outputs)*(g_data_width) -1 downto ((g_number_of_outputs-1)*(g_data_width))),
             req_out  => repeater_out_req (g_number_of_outputs-1),
             ack_in   => repeater_out_ack (g_number_of_outputs-1));

end behave;
