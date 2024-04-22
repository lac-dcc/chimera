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
package vc_system_package is -- 
  -- 
end package vc_system_package;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
entity sum_mod is -- 
  port ( -- 
    a : in  std_logic_vector(9 downto 0);
    b : out  std_logic_vector(9 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    inpipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    inpipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    inpipe_pipe_read_data : in   std_logic_vector(9 downto 0);
    stage0_pipe_read_req : out  std_logic_vector(0 downto 0);
    stage0_pipe_read_ack : in   std_logic_vector(0 downto 0);
    stage0_pipe_read_data : in   std_logic_vector(9 downto 0);
    stage1_pipe_read_req : out  std_logic_vector(0 downto 0);
    stage1_pipe_read_ack : in   std_logic_vector(0 downto 0);
    stage1_pipe_read_data : in   std_logic_vector(9 downto 0);
    outpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    outpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    outpipe_pipe_write_data : out  std_logic_vector(9 downto 0);
    stage0_pipe_write_req : out  std_logic_vector(0 downto 0);
    stage0_pipe_write_ack : in   std_logic_vector(0 downto 0);
    stage0_pipe_write_data : out  std_logic_vector(9 downto 0);
    stage1_pipe_write_req : out  std_logic_vector(0 downto 0);
    stage1_pipe_write_ack : in   std_logic_vector(0 downto 0);
    stage1_pipe_write_data : out  std_logic_vector(9 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity sum_mod;
architecture Default of sum_mod is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal simple_obj_ref_10_inst_req_0 : boolean;
  signal simple_obj_ref_10_inst_ack_0 : boolean;
  signal simple_obj_ref_16_inst_ack_0 : boolean;
  signal simple_obj_ref_9_inst_req_0 : boolean;
  signal simple_obj_ref_9_inst_ack_0 : boolean;
  signal simple_obj_ref_16_inst_req_0 : boolean;
  signal simple_obj_ref_15_inst_req_0 : boolean;
  signal simple_obj_ref_15_inst_ack_0 : boolean;
  signal simple_obj_ref_13_inst_req_0 : boolean;
  signal simple_obj_ref_13_inst_ack_0 : boolean;
  signal simple_obj_ref_12_inst_req_0 : boolean;
  signal simple_obj_ref_12_inst_ack_0 : boolean;
  -- 
begin --  
  -- tag register
  process(clk) 
  begin -- 
    if clk'event and clk = '1' then -- 
      if start='1' then -- 
        tag_out <= tag_in; -- 
      end if; -- 
    end if; -- 
  end process;
  -- the control path
  always_true_symbol <= true; 
  sum_mod_CP_0: Block -- control-path 
    signal sum_mod_CP_0_start: Boolean;
    signal Xentry_1_symbol: Boolean;
    signal Xexit_2_symbol: Boolean;
    signal parallel_block_stmt_8_3_symbol : Boolean;
    -- 
  begin -- 
    sum_mod_CP_0_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_1_symbol  <= sum_mod_CP_0_start; -- transition $entry
    parallel_block_stmt_8_3: Block -- parallel_block_stmt_8 
      signal parallel_block_stmt_8_3_start: Boolean;
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal assign_stmt_11_6_symbol : Boolean;
      signal assign_stmt_14_19_symbol : Boolean;
      signal assign_stmt_17_32_symbol : Boolean;
      -- 
    begin -- 
      parallel_block_stmt_8_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= parallel_block_stmt_8_3_start; -- transition parallel_block_stmt_8/$entry
      assign_stmt_11_6: Block -- parallel_block_stmt_8/assign_stmt_11 
        signal assign_stmt_11_6_start: Boolean;
        signal Xentry_7_symbol: Boolean;
        signal Xexit_8_symbol: Boolean;
        signal simple_obj_ref_10_9_symbol : Boolean;
        signal simple_obj_ref_9_14_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_11_6_start <= Xentry_4_symbol; -- control passed to block
        Xentry_7_symbol  <= assign_stmt_11_6_start; -- transition parallel_block_stmt_8/assign_stmt_11/$entry
        simple_obj_ref_10_9: Block -- parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_10 
          signal simple_obj_ref_10_9_start: Boolean;
          signal Xentry_10_symbol: Boolean;
          signal Xexit_11_symbol: Boolean;
          signal req_12_symbol : Boolean;
          signal ack_13_symbol : Boolean;
          -- 
        begin -- 
          simple_obj_ref_10_9_start <= Xentry_7_symbol; -- control passed to block
          Xentry_10_symbol  <= simple_obj_ref_10_9_start; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_10/$entry
          req_12_symbol <= Xentry_10_symbol; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_10/req
          simple_obj_ref_10_inst_req_0 <= req_12_symbol; -- link to DP
          ack_13_symbol <= simple_obj_ref_10_inst_ack_0; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_10/ack
          Xexit_11_symbol <= ack_13_symbol; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_10/$exit
          simple_obj_ref_10_9_symbol <= Xexit_11_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_10
        simple_obj_ref_9_14: Block -- parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_9 
          signal simple_obj_ref_9_14_start: Boolean;
          signal Xentry_15_symbol: Boolean;
          signal Xexit_16_symbol: Boolean;
          signal pipe_wreq_17_symbol : Boolean;
          signal pipe_wack_18_symbol : Boolean;
          -- 
        begin -- 
          simple_obj_ref_9_14_start <= simple_obj_ref_10_9_symbol; -- control passed to block
          Xentry_15_symbol  <= simple_obj_ref_9_14_start; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_9/$entry
          pipe_wreq_17_symbol <= Xentry_15_symbol; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_9/pipe_wreq
          simple_obj_ref_9_inst_req_0 <= pipe_wreq_17_symbol; -- link to DP
          pipe_wack_18_symbol <= simple_obj_ref_9_inst_ack_0; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_9/pipe_wack
          Xexit_16_symbol <= pipe_wack_18_symbol; -- transition parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_9/$exit
          simple_obj_ref_9_14_symbol <= Xexit_16_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_8/assign_stmt_11/simple_obj_ref_9
        Xexit_8_symbol <= simple_obj_ref_9_14_symbol; -- transition parallel_block_stmt_8/assign_stmt_11/$exit
        assign_stmt_11_6_symbol <= Xexit_8_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_8/assign_stmt_11
      assign_stmt_14_19: Block -- parallel_block_stmt_8/assign_stmt_14 
        signal assign_stmt_14_19_start: Boolean;
        signal Xentry_20_symbol: Boolean;
        signal Xexit_21_symbol: Boolean;
        signal simple_obj_ref_13_22_symbol : Boolean;
        signal simple_obj_ref_12_27_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_14_19_start <= Xentry_4_symbol; -- control passed to block
        Xentry_20_symbol  <= assign_stmt_14_19_start; -- transition parallel_block_stmt_8/assign_stmt_14/$entry
        simple_obj_ref_13_22: Block -- parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_13 
          signal simple_obj_ref_13_22_start: Boolean;
          signal Xentry_23_symbol: Boolean;
          signal Xexit_24_symbol: Boolean;
          signal req_25_symbol : Boolean;
          signal ack_26_symbol : Boolean;
          -- 
        begin -- 
          simple_obj_ref_13_22_start <= Xentry_20_symbol; -- control passed to block
          Xentry_23_symbol  <= simple_obj_ref_13_22_start; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_13/$entry
          req_25_symbol <= Xentry_23_symbol; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_13/req
          simple_obj_ref_13_inst_req_0 <= req_25_symbol; -- link to DP
          ack_26_symbol <= simple_obj_ref_13_inst_ack_0; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_13/ack
          Xexit_24_symbol <= ack_26_symbol; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_13/$exit
          simple_obj_ref_13_22_symbol <= Xexit_24_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_13
        simple_obj_ref_12_27: Block -- parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_12 
          signal simple_obj_ref_12_27_start: Boolean;
          signal Xentry_28_symbol: Boolean;
          signal Xexit_29_symbol: Boolean;
          signal pipe_wreq_30_symbol : Boolean;
          signal pipe_wack_31_symbol : Boolean;
          -- 
        begin -- 
          simple_obj_ref_12_27_start <= simple_obj_ref_13_22_symbol; -- control passed to block
          Xentry_28_symbol  <= simple_obj_ref_12_27_start; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_12/$entry
          pipe_wreq_30_symbol <= Xentry_28_symbol; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_12/pipe_wreq
          simple_obj_ref_12_inst_req_0 <= pipe_wreq_30_symbol; -- link to DP
          pipe_wack_31_symbol <= simple_obj_ref_12_inst_ack_0; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_12/pipe_wack
          Xexit_29_symbol <= pipe_wack_31_symbol; -- transition parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_12/$exit
          simple_obj_ref_12_27_symbol <= Xexit_29_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_8/assign_stmt_14/simple_obj_ref_12
        Xexit_21_symbol <= simple_obj_ref_12_27_symbol; -- transition parallel_block_stmt_8/assign_stmt_14/$exit
        assign_stmt_14_19_symbol <= Xexit_21_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_8/assign_stmt_14
      assign_stmt_17_32: Block -- parallel_block_stmt_8/assign_stmt_17 
        signal assign_stmt_17_32_start: Boolean;
        signal Xentry_33_symbol: Boolean;
        signal Xexit_34_symbol: Boolean;
        signal simple_obj_ref_16_35_symbol : Boolean;
        signal simple_obj_ref_15_40_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_17_32_start <= Xentry_4_symbol; -- control passed to block
        Xentry_33_symbol  <= assign_stmt_17_32_start; -- transition parallel_block_stmt_8/assign_stmt_17/$entry
        simple_obj_ref_16_35: Block -- parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_16 
          signal simple_obj_ref_16_35_start: Boolean;
          signal Xentry_36_symbol: Boolean;
          signal Xexit_37_symbol: Boolean;
          signal req_38_symbol : Boolean;
          signal ack_39_symbol : Boolean;
          -- 
        begin -- 
          simple_obj_ref_16_35_start <= Xentry_33_symbol; -- control passed to block
          Xentry_36_symbol  <= simple_obj_ref_16_35_start; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_16/$entry
          req_38_symbol <= Xentry_36_symbol; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_16/req
          simple_obj_ref_16_inst_req_0 <= req_38_symbol; -- link to DP
          ack_39_symbol <= simple_obj_ref_16_inst_ack_0; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_16/ack
          Xexit_37_symbol <= ack_39_symbol; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_16/$exit
          simple_obj_ref_16_35_symbol <= Xexit_37_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_16
        simple_obj_ref_15_40: Block -- parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_15 
          signal simple_obj_ref_15_40_start: Boolean;
          signal Xentry_41_symbol: Boolean;
          signal Xexit_42_symbol: Boolean;
          signal pipe_wreq_43_symbol : Boolean;
          signal pipe_wack_44_symbol : Boolean;
          -- 
        begin -- 
          simple_obj_ref_15_40_start <= simple_obj_ref_16_35_symbol; -- control passed to block
          Xentry_41_symbol  <= simple_obj_ref_15_40_start; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_15/$entry
          pipe_wreq_43_symbol <= Xentry_41_symbol; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_15/pipe_wreq
          simple_obj_ref_15_inst_req_0 <= pipe_wreq_43_symbol; -- link to DP
          pipe_wack_44_symbol <= simple_obj_ref_15_inst_ack_0; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_15/pipe_wack
          Xexit_42_symbol <= pipe_wack_44_symbol; -- transition parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_15/$exit
          simple_obj_ref_15_40_symbol <= Xexit_42_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_8/assign_stmt_17/simple_obj_ref_15
        Xexit_34_symbol <= simple_obj_ref_15_40_symbol; -- transition parallel_block_stmt_8/assign_stmt_17/$exit
        assign_stmt_17_32_symbol <= Xexit_34_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_8/assign_stmt_17
      Xexit_5_block : Block -- non-trivial join transition parallel_block_stmt_8/$exit 
        signal Xexit_5_predecessors: BooleanArray(2 downto 0);
        signal Xexit_5_p0_pred: BooleanArray(0 downto 0);
        signal Xexit_5_p0_succ: BooleanArray(0 downto 0);
        signal Xexit_5_p1_pred: BooleanArray(0 downto 0);
        signal Xexit_5_p1_succ: BooleanArray(0 downto 0);
        signal Xexit_5_p2_pred: BooleanArray(0 downto 0);
        signal Xexit_5_p2_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        Xexit_5_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_5_p0_pred, Xexit_5_p0_succ, Xexit_5_predecessors(0), clk, reset-- 
          ); -- 
        Xexit_5_p0_succ(0) <=  Xexit_5_symbol;
        Xexit_5_p0_pred(0) <=  assign_stmt_11_6_symbol;
        Xexit_5_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_5_p1_pred, Xexit_5_p1_succ, Xexit_5_predecessors(1), clk, reset-- 
          ); -- 
        Xexit_5_p1_succ(0) <=  Xexit_5_symbol;
        Xexit_5_p1_pred(0) <=  assign_stmt_14_19_symbol;
        Xexit_5_2_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_5_p2_pred, Xexit_5_p2_succ, Xexit_5_predecessors(2), clk, reset-- 
          ); -- 
        Xexit_5_p2_succ(0) <=  Xexit_5_symbol;
        Xexit_5_p2_pred(0) <=  assign_stmt_17_32_symbol;
        Xexit_5_symbol <= AndReduce(Xexit_5_predecessors); 
        -- 
      end Block; -- non-trivial join transition parallel_block_stmt_8/$exit
      parallel_block_stmt_8_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- parallel_block_stmt_8
    Xexit_2_symbol <= parallel_block_stmt_8_3_symbol; -- transition $exit
    fin  <=  '1' when Xexit_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal simple_obj_ref_10_wire : std_logic_vector(9 downto 0);
    signal simple_obj_ref_13_wire : std_logic_vector(9 downto 0);
    signal simple_obj_ref_16_wire : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    -- shared inport operator group (0) : simple_obj_ref_10_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= simple_obj_ref_10_inst_req_0;
      simple_obj_ref_10_inst_ack_0 <= ack(0);
      simple_obj_ref_10_wire <= data_out(9 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => inpipe_pipe_read_req(0),
          oack => inpipe_pipe_read_ack(0),
          odata => inpipe_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared inport operator group (1) : simple_obj_ref_13_inst 
    InportGroup1: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= simple_obj_ref_13_inst_req_0;
      simple_obj_ref_13_inst_ack_0 <= ack(0);
      simple_obj_ref_13_wire <= data_out(9 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => stage0_pipe_read_req(0),
          oack => stage0_pipe_read_ack(0),
          odata => stage0_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared inport operator group (2) : simple_obj_ref_16_inst 
    InportGroup2: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= simple_obj_ref_16_inst_req_0;
      simple_obj_ref_16_inst_ack_0 <= ack(0);
      simple_obj_ref_16_wire <= data_out(9 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => stage1_pipe_read_req(0),
          oack => stage1_pipe_read_ack(0),
          odata => stage1_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 2
    -- shared outport operator group (0) : simple_obj_ref_12_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= simple_obj_ref_12_inst_req_0;
      simple_obj_ref_12_inst_ack_0 <= ack(0);
      data_in <= simple_obj_ref_13_wire;
      outport: OutputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => stage1_pipe_write_req(0),
          oack => stage1_pipe_write_ack(0),
          odata => stage1_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : simple_obj_ref_15_inst 
    OutportGroup1: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= simple_obj_ref_15_inst_req_0;
      simple_obj_ref_15_inst_ack_0 <= ack(0);
      data_in <= simple_obj_ref_16_wire;
      outport: OutputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => outpipe_pipe_write_req(0),
          oack => outpipe_pipe_write_ack(0),
          odata => outpipe_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- shared outport operator group (2) : simple_obj_ref_9_inst 
    OutportGroup2: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= simple_obj_ref_9_inst_req_0;
      simple_obj_ref_9_inst_ack_0 <= ack(0);
      data_in <= simple_obj_ref_10_wire;
      outport: OutputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => stage0_pipe_write_req(0),
          oack => stage0_pipe_write_ack(0),
          odata => stage0_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 2
    -- 
  end Block; -- data_path
  -- 
end Default;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
entity test_system is  -- system 
  port (-- 
    sum_mod_a : in  std_logic_vector(9 downto 0);
    sum_mod_b : out  std_logic_vector(9 downto 0);
    sum_mod_tag_in: in std_logic_vector(0 downto 0);
    sum_mod_tag_out: out std_logic_vector(0 downto 0);
    sum_mod_start : in std_logic;
    sum_mod_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic;
    inpipe_pipe_write_data: in std_logic_vector(9 downto 0);
    inpipe_pipe_write_req : in std_logic_vector(0 downto 0);
    inpipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    outpipe_pipe_read_data: out std_logic_vector(9 downto 0);
    outpipe_pipe_read_req : in std_logic_vector(0 downto 0);
    outpipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module sum_mod
  component sum_mod is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : out  std_logic_vector(9 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      inpipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      inpipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      inpipe_pipe_read_data : in   std_logic_vector(9 downto 0);
      stage0_pipe_read_req : out  std_logic_vector(0 downto 0);
      stage0_pipe_read_ack : in   std_logic_vector(0 downto 0);
      stage0_pipe_read_data : in   std_logic_vector(9 downto 0);
      stage1_pipe_read_req : out  std_logic_vector(0 downto 0);
      stage1_pipe_read_ack : in   std_logic_vector(0 downto 0);
      stage1_pipe_read_data : in   std_logic_vector(9 downto 0);
      outpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      outpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      outpipe_pipe_write_data : out  std_logic_vector(9 downto 0);
      stage0_pipe_write_req : out  std_logic_vector(0 downto 0);
      stage0_pipe_write_ack : in   std_logic_vector(0 downto 0);
      stage0_pipe_write_data : out  std_logic_vector(9 downto 0);
      stage1_pipe_write_req : out  std_logic_vector(0 downto 0);
      stage1_pipe_write_ack : in   std_logic_vector(0 downto 0);
      stage1_pipe_write_data : out  std_logic_vector(9 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- aggregate signals for read from pipe inpipe
  signal inpipe_pipe_read_data: std_logic_vector(9 downto 0);
  signal inpipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal inpipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe outpipe
  signal outpipe_pipe_write_data: std_logic_vector(9 downto 0);
  signal outpipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal outpipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe stage0
  signal stage0_pipe_write_data: std_logic_vector(9 downto 0);
  signal stage0_pipe_write_req: std_logic_vector(0 downto 0);
  signal stage0_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe stage0
  signal stage0_pipe_read_data: std_logic_vector(9 downto 0);
  signal stage0_pipe_read_req: std_logic_vector(0 downto 0);
  signal stage0_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe stage1
  signal stage1_pipe_write_data: std_logic_vector(9 downto 0);
  signal stage1_pipe_write_req: std_logic_vector(0 downto 0);
  signal stage1_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe stage1
  signal stage1_pipe_read_data: std_logic_vector(9 downto 0);
  signal stage1_pipe_read_req: std_logic_vector(0 downto 0);
  signal stage1_pipe_read_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module sum_mod
  sum_mod_instance:sum_mod-- 
    port map(-- 
      a => sum_mod_a,
      b => sum_mod_b,
      start => sum_mod_start,
      fin => sum_mod_fin,
      clk => clk,
      reset => reset,
      inpipe_pipe_read_req => inpipe_pipe_read_req(0 downto 0),
      inpipe_pipe_read_ack => inpipe_pipe_read_ack(0 downto 0),
      inpipe_pipe_read_data => inpipe_pipe_read_data(9 downto 0),
      stage0_pipe_read_req => stage0_pipe_read_req(0 downto 0),
      stage0_pipe_read_ack => stage0_pipe_read_ack(0 downto 0),
      stage0_pipe_read_data => stage0_pipe_read_data(9 downto 0),
      stage1_pipe_read_req => stage1_pipe_read_req(0 downto 0),
      stage1_pipe_read_ack => stage1_pipe_read_ack(0 downto 0),
      stage1_pipe_read_data => stage1_pipe_read_data(9 downto 0),
      outpipe_pipe_write_req => outpipe_pipe_write_req(0 downto 0),
      outpipe_pipe_write_ack => outpipe_pipe_write_ack(0 downto 0),
      outpipe_pipe_write_data => outpipe_pipe_write_data(9 downto 0),
      stage0_pipe_write_req => stage0_pipe_write_req(0 downto 0),
      stage0_pipe_write_ack => stage0_pipe_write_ack(0 downto 0),
      stage0_pipe_write_data => stage0_pipe_write_data(9 downto 0),
      stage1_pipe_write_req => stage1_pipe_write_req(0 downto 0),
      stage1_pipe_write_ack => stage1_pipe_write_ack(0 downto 0),
      stage1_pipe_write_data => stage1_pipe_write_data(9 downto 0),
      tag_in => sum_mod_tag_in,
      tag_out => sum_mod_tag_out-- 
    ); -- 
  inpipe_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => inpipe_pipe_read_req,
      read_ack => inpipe_pipe_read_ack,
      read_data => inpipe_pipe_read_data,
      write_req => inpipe_pipe_write_req,
      write_ack => inpipe_pipe_write_ack,
      write_data => inpipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  outpipe_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => outpipe_pipe_read_req,
      read_ack => outpipe_pipe_read_ack,
      read_data => outpipe_pipe_read_data,
      write_req => outpipe_pipe_write_req,
      write_ack => outpipe_pipe_write_ack,
      write_data => outpipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  stage0_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => stage0_pipe_read_req,
      read_ack => stage0_pipe_read_ack,
      read_data => stage0_pipe_read_data,
      write_req => stage0_pipe_write_req,
      write_ack => stage0_pipe_write_ack,
      write_data => stage0_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  stage1_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => stage1_pipe_read_req,
      read_ack => stage1_pipe_read_ack,
      read_data => stage1_pipe_read_data,
      write_req => stage1_pipe_write_req,
      write_ack => stage1_pipe_write_ack,
      write_data => stage1_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end Default;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      sum_mod_a : in  std_logic_vector(9 downto 0);
      sum_mod_b : out  std_logic_vector(9 downto 0);
      sum_mod_tag_in: in std_logic_vector(0 downto 0);
      sum_mod_tag_out: out std_logic_vector(0 downto 0);
      sum_mod_start : in std_logic;
      sum_mod_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic;
      inpipe_pipe_write_data: in std_logic_vector(9 downto 0);
      inpipe_pipe_write_req : in std_logic_vector(0 downto 0);
      inpipe_pipe_write_ack : out std_logic_vector(0 downto 0);
      outpipe_pipe_read_data: out std_logic_vector(9 downto 0);
      outpipe_pipe_read_req : in std_logic_vector(0 downto 0);
      outpipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal sum_mod_a :  std_logic_vector(9 downto 0);
  signal sum_mod_b :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- write to pipe inpipe
  signal inpipe_pipe_write_data: std_logic_vector(9 downto 0) := (others => '1');
  signal inpipe_pipe_write_req : std_logic_vector(0 downto 0) := (others => '1');
  signal inpipe_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe outpipe
  signal outpipe_pipe_read_data: std_logic_vector(9 downto 0);
  signal outpipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '1');
  signal outpipe_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  clk <= not clk after 5 ns;

  process
  begin
	wait until clk = '1';
	reset <= '0'; 
	sum_mod_start <= '1';
	wait until clk = '1';
	sum_mod_start <= '0';
	while sum_mod_fin /= '1' loop
		wait until clk = '1';
	end loop;
  	wait;
  end process;

  test_system_instance: test_system -- 
    port map ( -- 
      sum_mod_a => sum_mod_a,
      sum_mod_b => sum_mod_b,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset,
      inpipe_pipe_write_data  => inpipe_pipe_write_data, 
      inpipe_pipe_write_req  => inpipe_pipe_write_req, 
      inpipe_pipe_write_ack  => inpipe_pipe_write_ack,
      outpipe_pipe_read_data  => outpipe_pipe_read_data, 
      outpipe_pipe_read_req  => outpipe_pipe_read_req, 
      outpipe_pipe_read_ack  => outpipe_pipe_read_ack ); -- 
  -- 
end Default;
