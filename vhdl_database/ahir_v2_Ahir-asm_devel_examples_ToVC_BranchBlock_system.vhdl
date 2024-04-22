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
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
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
use ahir.utilities.all;
library work;
use work.vc_system_package.all;
entity sum_mod is -- 
  generic (tag_length : integer); 
  port ( -- 
    b : out  std_logic_vector(9 downto 0);
    test : out  std_logic_vector(0 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic;
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
  );
  -- 
end entity sum_mod;
architecture Default of sum_mod is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal start_req_symbol: Boolean;
  signal start_ack_symbol: Boolean;
  signal fin_req_symbol: Boolean;
  signal fin_ack_symbol: Boolean;
  signal tag_push, tag_pop: std_logic; 
  signal start_ack_sig, fin_ack_sig: std_logic; 
  -- output port buffer signals
  signal b_buffer :  std_logic_vector(9 downto 0);
  signal test_buffer :  std_logic_vector(0 downto 0);
  signal sum_mod_CP_0_start: Boolean;
  -- links between control-path and data-path
  signal binary_28_inst_req_0 : boolean;
  signal binary_28_inst_ack_0 : boolean;
  signal binary_28_inst_req_1 : boolean;
  signal binary_28_inst_ack_1 : boolean;
  signal binary_23_inst_req_0 : boolean;
  signal binary_23_inst_ack_0 : boolean;
  signal binary_23_inst_req_1 : boolean;
  signal binary_23_inst_ack_1 : boolean;
  signal switch_stmt_30_branch_1_req_0 : boolean;
  signal switch_stmt_30_branch_1_ack_1 : boolean;
  signal switch_stmt_30_branch_2_ack_1 : boolean;
  signal switch_stmt_30_branch_default_ack_0 : boolean;
  signal phi_stmt_11_req_0 : boolean;
  signal phi_stmt_15_req_0 : boolean;
  signal switch_stmt_30_branch_default_req_0 : boolean;
  signal switch_stmt_30_select_expr_0_req_0 : boolean;
  signal switch_stmt_30_select_expr_0_ack_0 : boolean;
  signal switch_stmt_30_select_expr_0_req_1 : boolean;
  signal switch_stmt_30_select_expr_0_ack_1 : boolean;
  signal switch_stmt_30_branch_0_req_0 : boolean;
  signal switch_stmt_30_select_expr_1_req_0 : boolean;
  signal switch_stmt_30_select_expr_1_ack_0 : boolean;
  signal switch_stmt_30_select_expr_1_req_1 : boolean;
  signal switch_stmt_30_select_expr_1_ack_1 : boolean;
  signal switch_stmt_30_select_expr_2_req_0 : boolean;
  signal switch_stmt_30_select_expr_2_ack_0 : boolean;
  signal switch_stmt_30_select_expr_2_req_1 : boolean;
  signal switch_stmt_30_select_expr_2_ack_1 : boolean;
  signal switch_stmt_30_branch_2_req_0 : boolean;
  signal switch_stmt_30_branch_0_ack_1 : boolean;
  signal phi_stmt_11_req_1 : boolean;
  signal phi_stmt_15_req_1 : boolean;
  signal simple_obj_ref_74_inst_req_0 : boolean;
  signal simple_obj_ref_74_inst_ack_0 : boolean;
  signal phi_stmt_11_ack_0 : boolean;
  signal phi_stmt_15_ack_0 : boolean;
  signal binary_58_inst_req_0 : boolean;
  signal binary_58_inst_ack_0 : boolean;
  signal binary_58_inst_req_1 : boolean;
  signal binary_58_inst_ack_1 : boolean;
  signal binary_63_inst_req_0 : boolean;
  signal binary_63_inst_ack_0 : boolean;
  signal binary_63_inst_req_1 : boolean;
  signal binary_63_inst_ack_1 : boolean;
  signal binary_68_inst_req_0 : boolean;
  signal binary_68_inst_ack_0 : boolean;
  signal binary_68_inst_req_1 : boolean;
  signal binary_68_inst_ack_1 : boolean;
  signal if_stmt_65_branch_req_0 : boolean;
  signal if_stmt_65_branch_ack_1 : boolean;
  signal if_stmt_65_branch_ack_0 : boolean;
  signal phi_stmt_46_req_0 : boolean;
  signal phi_stmt_50_req_0 : boolean;
  signal phi_stmt_46_req_1 : boolean;
  signal phi_stmt_50_req_1 : boolean;
  signal phi_stmt_46_ack_0 : boolean;
  signal phi_stmt_50_ack_0 : boolean;
  signal binary_80_inst_req_0 : boolean;
  signal binary_80_inst_ack_0 : boolean;
  signal binary_80_inst_req_1 : boolean;
  signal binary_80_inst_ack_1 : boolean;
  -- 
begin --  
  -- output port buffering assignments
  b <= b_buffer; 
  test <= test_buffer; 
  -- level-to-pulse translation..
  l2pStart: level_to_pulse -- 
    generic map (forward_delay => 0, backward_delay => 0) 
    port map(clk => clk, reset =>reset, lreq => start_req, lack => start_ack_sig, preq => start_req_symbol, pack => start_ack_symbol); -- 
  start_ack <= start_ack_sig; 
  l2pFin: level_to_pulse -- 
    generic map (forward_delay => 0, backward_delay => 0) 
    port map(clk => clk, reset =>reset, lreq => fin_req, lack => fin_ack_sig, preq => fin_req_symbol, pack => fin_ack_symbol); -- 
  fin_ack <= fin_ack_sig; 
  tag_push <= '1' when start_req_symbol else '0'; 
  tag_pop  <= fin_req and fin_ack_sig ; 
  tagQueue: QueueBase generic map(data_width => 1, queue_depth => 5 + 1) -- 
    port map(pop_req => tag_pop, pop_ack => open, 
    push_req => tag_push, push_ack => open, 
    data_out => tag_out, data_in => tag_in, 
    clk => clk, reset => reset); -- 
  -- the control path
  always_true_symbol <= true; 
  sum_mod_CP_0: Block -- control-path 
    signal Xentry_1_symbol: Boolean;
    signal Xexit_2_symbol: Boolean;
    signal assign_stmt_8_3_start : Boolean;
    signal assign_stmt_8_3_symbol : Boolean;
    signal branch_block_stmt_9_7_start : Boolean;
    signal branch_block_stmt_9_7_symbol : Boolean;
    signal branch_block_stmt_44_145_start : Boolean;
    signal branch_block_stmt_44_145_symbol : Boolean;
    signal assign_stmt_76_261_start : Boolean;
    signal assign_stmt_76_261_symbol : Boolean;
    signal assign_stmt_81_266_start : Boolean;
    signal assign_stmt_81_266_symbol : Boolean;
    -- 
  begin -- 
    sum_mod_CP_0_start_interlock : pipeline_interlock -- 
      port map (trigger => start_req_symbol,
      enable =>  fin_ack_symbol, 
      symbol_out => sum_mod_CP_0_start, 
      clk => clk, reset => reset); -- 
    start_ack_symbol <= Xexit_2_symbol;
    Xentry_1_symbol  <= sum_mod_CP_0_start; -- transition $entry
    assign_stmt_8_3: Block -- assign_stmt_8 
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal dummy_6_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_8_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= assign_stmt_8_3_start; -- transition assign_stmt_8/$entry
      dummy_6_symbol <= Xentry_4_symbol; -- transition assign_stmt_8/dummy
      Xexit_5_symbol <= dummy_6_symbol; -- transition assign_stmt_8/$exit
      assign_stmt_8_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_8
    branch_block_stmt_9_7: Block -- branch_block_stmt_9 
      signal Xentry_8_symbol: Boolean;
      signal Xexit_9_symbol: Boolean;
      signal branch_block_stmt_9_x_xentry_x_xx_x10_symbol : Boolean;
      signal branch_block_stmt_9_x_xexit_x_xx_x11_symbol : Boolean;
      signal merge_stmt_10_x_xentry_x_xx_x12_symbol : Boolean;
      signal merge_stmt_10_x_xexit_x_xx_x13_symbol : Boolean;
      signal assign_stmt_24_x_xentry_x_xx_x14_symbol : Boolean;
      signal assign_stmt_24_x_xexit_x_xx_x15_symbol : Boolean;
      signal assign_stmt_29_x_xentry_x_xx_x16_symbol : Boolean;
      signal assign_stmt_29_x_xexit_x_xx_x17_symbol : Boolean;
      signal switch_stmt_30_x_xentry_x_xx_x18_symbol : Boolean;
      signal switch_stmt_30_x_xexit_x_xx_x19_symbol : Boolean;
      signal assign_stmt_24_20_start : Boolean;
      signal assign_stmt_24_20_symbol : Boolean;
      signal assign_stmt_29_33_start : Boolean;
      signal assign_stmt_29_33_symbol : Boolean;
      signal switch_stmt_30_dead_link_46_start : Boolean;
      signal switch_stmt_30_dead_link_46_symbol : Boolean;
      signal switch_stmt_30_x_xcondition_check_place_x_xx_x50_symbol : Boolean;
      signal switch_stmt_30_x_xcondition_check_x_xx_x51_start : Boolean;
      signal switch_stmt_30_x_xcondition_check_x_xx_x51_symbol : Boolean;
      signal switch_stmt_30_x_xselect_x_xx_x78_symbol : Boolean;
      signal switch_stmt_30_choice_0_79_start : Boolean;
      signal switch_stmt_30_choice_0_79_symbol : Boolean;
      signal loopback_83_symbol : Boolean;
      signal switch_stmt_30_choice_1_84_start : Boolean;
      signal switch_stmt_30_choice_1_84_symbol : Boolean;
      signal switch_stmt_30_choice_2_88_start : Boolean;
      signal switch_stmt_30_choice_2_88_symbol : Boolean;
      signal switch_stmt_30_choice_default_92_start : Boolean;
      signal switch_stmt_30_choice_default_92_symbol : Boolean;
      signal stmt_41_x_xentry_x_xx_x96_symbol : Boolean;
      signal stmt_41_x_xexit_x_xx_x97_symbol : Boolean;
      signal stmt_41_98_start : Boolean;
      signal stmt_41_98_symbol : Boolean;
      signal merge_stmt_10_dead_link_101_start : Boolean;
      signal merge_stmt_10_dead_link_101_symbol : Boolean;
      signal merge_stmt_10_x_xentry_x_xx_xPhiReq_105_start : Boolean;
      signal merge_stmt_10_x_xentry_x_xx_xPhiReq_105_symbol : Boolean;
      signal loopback_PhiReq_122_start : Boolean;
      signal loopback_PhiReq_122_symbol : Boolean;
      signal merge_stmt_10_PhiReqMerge_139_symbol : Boolean;
      signal merge_stmt_10_PhiAck_140_start : Boolean;
      signal merge_stmt_10_PhiAck_140_symbol : Boolean;
      -- 
    begin -- 
      branch_block_stmt_9_7_start <= assign_stmt_8_3_symbol; -- control passed to block
      Xentry_8_symbol  <= branch_block_stmt_9_7_start; -- transition branch_block_stmt_9/$entry
      branch_block_stmt_9_x_xentry_x_xx_x10_symbol  <=  Xentry_8_symbol; -- place branch_block_stmt_9/branch_block_stmt_9__entry__ (optimized away) 
      branch_block_stmt_9_x_xexit_x_xx_x11_symbol  <=  switch_stmt_30_x_xexit_x_xx_x19_symbol; -- place branch_block_stmt_9/branch_block_stmt_9__exit__ (optimized away) 
      merge_stmt_10_x_xentry_x_xx_x12_symbol  <=  branch_block_stmt_9_x_xentry_x_xx_x10_symbol; -- place branch_block_stmt_9/merge_stmt_10__entry__ (optimized away) 
      merge_stmt_10_x_xexit_x_xx_x13_symbol  <=  merge_stmt_10_dead_link_101_symbol or merge_stmt_10_PhiAck_140_symbol; -- place branch_block_stmt_9/merge_stmt_10__exit__ (optimized away) 
      assign_stmt_24_x_xentry_x_xx_x14_symbol  <=  merge_stmt_10_x_xexit_x_xx_x13_symbol; -- place branch_block_stmt_9/assign_stmt_24__entry__ (optimized away) 
      assign_stmt_24_x_xexit_x_xx_x15_symbol  <=  assign_stmt_24_20_symbol; -- place branch_block_stmt_9/assign_stmt_24__exit__ (optimized away) 
      assign_stmt_29_x_xentry_x_xx_x16_symbol  <=  assign_stmt_24_x_xexit_x_xx_x15_symbol; -- place branch_block_stmt_9/assign_stmt_29__entry__ (optimized away) 
      assign_stmt_29_x_xexit_x_xx_x17_symbol  <=  assign_stmt_29_33_symbol; -- place branch_block_stmt_9/assign_stmt_29__exit__ (optimized away) 
      switch_stmt_30_x_xentry_x_xx_x18_symbol  <=  assign_stmt_29_x_xexit_x_xx_x17_symbol; -- place branch_block_stmt_9/switch_stmt_30__entry__ (optimized away) 
      switch_stmt_30_x_xexit_x_xx_x19_symbol  <=  stmt_41_x_xexit_x_xx_x97_symbol or switch_stmt_30_dead_link_46_symbol; -- place branch_block_stmt_9/switch_stmt_30__exit__ (optimized away) 
      assign_stmt_24_20: Block -- branch_block_stmt_9/assign_stmt_24 
        signal Xentry_21_symbol: Boolean;
        signal Xexit_22_symbol: Boolean;
        signal binary_23_23_start : Boolean;
        signal binary_23_23_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_24_20_start <= assign_stmt_24_x_xentry_x_xx_x14_symbol; -- control passed to block
        Xentry_21_symbol  <= assign_stmt_24_20_start; -- transition branch_block_stmt_9/assign_stmt_24/$entry
        binary_23_23: Block -- branch_block_stmt_9/assign_stmt_24/binary_23 
          signal Xentry_24_symbol: Boolean;
          signal Xexit_25_symbol: Boolean;
          signal binary_23_inputs_26_start : Boolean;
          signal binary_23_inputs_26_symbol : Boolean;
          signal rr_29_symbol : Boolean;
          signal ra_30_symbol : Boolean;
          signal cr_31_symbol : Boolean;
          signal ca_32_symbol : Boolean;
          -- 
        begin -- 
          binary_23_23_start <= Xentry_21_symbol; -- control passed to block
          Xentry_24_symbol  <= binary_23_23_start; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/$entry
          binary_23_inputs_26: Block -- branch_block_stmt_9/assign_stmt_24/binary_23/binary_23_inputs 
            signal Xentry_27_symbol: Boolean;
            signal Xexit_28_symbol: Boolean;
            -- 
          begin -- 
            binary_23_inputs_26_start <= Xentry_24_symbol; -- control passed to block
            Xentry_27_symbol  <= binary_23_inputs_26_start; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/binary_23_inputs/$entry
            Xexit_28_symbol <= Xentry_27_symbol; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/binary_23_inputs/$exit
            binary_23_inputs_26_symbol <= Xexit_28_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_9/assign_stmt_24/binary_23/binary_23_inputs
          rr_29_symbol <= binary_23_inputs_26_symbol; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/rr
          binary_23_inst_req_0 <= rr_29_symbol; -- link to DP
          ra_30_symbol <= binary_23_inst_ack_0; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/ra
          cr_31_symbol <= ra_30_symbol; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/cr
          binary_23_inst_req_1 <= cr_31_symbol; -- link to DP
          ca_32_symbol <= binary_23_inst_ack_1; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/ca
          Xexit_25_symbol <= ca_32_symbol; -- transition branch_block_stmt_9/assign_stmt_24/binary_23/$exit
          binary_23_23_symbol <= Xexit_25_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/assign_stmt_24/binary_23
        Xexit_22_symbol <= binary_23_23_symbol; -- transition branch_block_stmt_9/assign_stmt_24/$exit
        assign_stmt_24_20_symbol <= Xexit_22_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/assign_stmt_24
      assign_stmt_29_33: Block -- branch_block_stmt_9/assign_stmt_29 
        signal Xentry_34_symbol: Boolean;
        signal Xexit_35_symbol: Boolean;
        signal binary_28_36_start : Boolean;
        signal binary_28_36_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_29_33_start <= assign_stmt_29_x_xentry_x_xx_x16_symbol; -- control passed to block
        Xentry_34_symbol  <= assign_stmt_29_33_start; -- transition branch_block_stmt_9/assign_stmt_29/$entry
        binary_28_36: Block -- branch_block_stmt_9/assign_stmt_29/binary_28 
          signal Xentry_37_symbol: Boolean;
          signal Xexit_38_symbol: Boolean;
          signal binary_28_inputs_39_start : Boolean;
          signal binary_28_inputs_39_symbol : Boolean;
          signal rr_42_symbol : Boolean;
          signal ra_43_symbol : Boolean;
          signal cr_44_symbol : Boolean;
          signal ca_45_symbol : Boolean;
          -- 
        begin -- 
          binary_28_36_start <= Xentry_34_symbol; -- control passed to block
          Xentry_37_symbol  <= binary_28_36_start; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/$entry
          binary_28_inputs_39: Block -- branch_block_stmt_9/assign_stmt_29/binary_28/binary_28_inputs 
            signal Xentry_40_symbol: Boolean;
            signal Xexit_41_symbol: Boolean;
            -- 
          begin -- 
            binary_28_inputs_39_start <= Xentry_37_symbol; -- control passed to block
            Xentry_40_symbol  <= binary_28_inputs_39_start; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/binary_28_inputs/$entry
            Xexit_41_symbol <= Xentry_40_symbol; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/binary_28_inputs/$exit
            binary_28_inputs_39_symbol <= Xexit_41_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_9/assign_stmt_29/binary_28/binary_28_inputs
          rr_42_symbol <= binary_28_inputs_39_symbol; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/rr
          binary_28_inst_req_0 <= rr_42_symbol; -- link to DP
          ra_43_symbol <= binary_28_inst_ack_0; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/ra
          cr_44_symbol <= ra_43_symbol; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/cr
          binary_28_inst_req_1 <= cr_44_symbol; -- link to DP
          ca_45_symbol <= binary_28_inst_ack_1; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/ca
          Xexit_38_symbol <= ca_45_symbol; -- transition branch_block_stmt_9/assign_stmt_29/binary_28/$exit
          binary_28_36_symbol <= Xexit_38_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/assign_stmt_29/binary_28
        Xexit_35_symbol <= binary_28_36_symbol; -- transition branch_block_stmt_9/assign_stmt_29/$exit
        assign_stmt_29_33_symbol <= Xexit_35_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/assign_stmt_29
      switch_stmt_30_dead_link_46: Block -- branch_block_stmt_9/switch_stmt_30_dead_link 
        signal Xentry_47_symbol: Boolean;
        signal Xexit_48_symbol: Boolean;
        signal dead_transition_49_symbol : Boolean;
        -- 
      begin -- 
        switch_stmt_30_dead_link_46_start <= switch_stmt_30_x_xentry_x_xx_x18_symbol; -- control passed to block
        Xentry_47_symbol  <= switch_stmt_30_dead_link_46_start; -- transition branch_block_stmt_9/switch_stmt_30_dead_link/$entry
        dead_transition_49_symbol <= false;
        Xexit_48_symbol <= dead_transition_49_symbol; -- transition branch_block_stmt_9/switch_stmt_30_dead_link/$exit
        switch_stmt_30_dead_link_46_symbol <= Xexit_48_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/switch_stmt_30_dead_link
      switch_stmt_30_x_xcondition_check_place_x_xx_x50_symbol  <=  switch_stmt_30_x_xentry_x_xx_x18_symbol; -- place branch_block_stmt_9/switch_stmt_30__condition_check_place__ (optimized away) 
      switch_stmt_30_x_xcondition_check_x_xx_x51: Block -- branch_block_stmt_9/switch_stmt_30__condition_check__ 
        signal Xentry_52_symbol: Boolean;
        signal Xexit_53_symbol: Boolean;
        signal condition_0_54_start : Boolean;
        signal condition_0_54_symbol : Boolean;
        signal condition_1_62_start : Boolean;
        signal condition_1_62_symbol : Boolean;
        signal condition_2_70_start : Boolean;
        signal condition_2_70_symbol : Boolean;
        -- 
      begin -- 
        switch_stmt_30_x_xcondition_check_x_xx_x51_start <= switch_stmt_30_x_xcondition_check_place_x_xx_x50_symbol; -- control passed to block
        Xentry_52_symbol  <= switch_stmt_30_x_xcondition_check_x_xx_x51_start; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/$entry
        condition_0_54: Block -- branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0 
          signal Xentry_55_symbol: Boolean;
          signal Xexit_56_symbol: Boolean;
          signal rr_57_symbol : Boolean;
          signal ra_58_symbol : Boolean;
          signal cr_59_symbol : Boolean;
          signal ca_60_symbol : Boolean;
          signal cmp_61_symbol : Boolean;
          -- 
        begin -- 
          condition_0_54_start <= Xentry_52_symbol; -- control passed to block
          Xentry_55_symbol  <= condition_0_54_start; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/$entry
          rr_57_symbol <= Xentry_55_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/rr
          switch_stmt_30_select_expr_0_req_0 <= rr_57_symbol; -- link to DP
          ra_58_symbol <= switch_stmt_30_select_expr_0_ack_0; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/ra
          cr_59_symbol <= ra_58_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/cr
          switch_stmt_30_select_expr_0_req_1 <= cr_59_symbol; -- link to DP
          ca_60_symbol <= switch_stmt_30_select_expr_0_ack_1; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/ca
          cmp_61_symbol <= ca_60_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/cmp
          switch_stmt_30_branch_0_req_0 <= cmp_61_symbol; -- link to DP
          Xexit_56_symbol <= cmp_61_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0/$exit
          condition_0_54_symbol <= Xexit_56_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/switch_stmt_30__condition_check__/condition_0
        condition_1_62: Block -- branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1 
          signal Xentry_63_symbol: Boolean;
          signal Xexit_64_symbol: Boolean;
          signal rr_65_symbol : Boolean;
          signal ra_66_symbol : Boolean;
          signal cr_67_symbol : Boolean;
          signal ca_68_symbol : Boolean;
          signal cmp_69_symbol : Boolean;
          -- 
        begin -- 
          condition_1_62_start <= Xentry_52_symbol; -- control passed to block
          Xentry_63_symbol  <= condition_1_62_start; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/$entry
          rr_65_symbol <= Xentry_63_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/rr
          switch_stmt_30_select_expr_1_req_0 <= rr_65_symbol; -- link to DP
          ra_66_symbol <= switch_stmt_30_select_expr_1_ack_0; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/ra
          cr_67_symbol <= ra_66_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/cr
          switch_stmt_30_select_expr_1_req_1 <= cr_67_symbol; -- link to DP
          ca_68_symbol <= switch_stmt_30_select_expr_1_ack_1; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/ca
          cmp_69_symbol <= ca_68_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/cmp
          switch_stmt_30_branch_1_req_0 <= cmp_69_symbol; -- link to DP
          Xexit_64_symbol <= cmp_69_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1/$exit
          condition_1_62_symbol <= Xexit_64_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/switch_stmt_30__condition_check__/condition_1
        condition_2_70: Block -- branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2 
          signal Xentry_71_symbol: Boolean;
          signal Xexit_72_symbol: Boolean;
          signal rr_73_symbol : Boolean;
          signal ra_74_symbol : Boolean;
          signal cr_75_symbol : Boolean;
          signal ca_76_symbol : Boolean;
          signal cmp_77_symbol : Boolean;
          -- 
        begin -- 
          condition_2_70_start <= Xentry_52_symbol; -- control passed to block
          Xentry_71_symbol  <= condition_2_70_start; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/$entry
          rr_73_symbol <= Xentry_71_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/rr
          switch_stmt_30_select_expr_2_req_0 <= rr_73_symbol; -- link to DP
          ra_74_symbol <= switch_stmt_30_select_expr_2_ack_0; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/ra
          cr_75_symbol <= ra_74_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/cr
          switch_stmt_30_select_expr_2_req_1 <= cr_75_symbol; -- link to DP
          ca_76_symbol <= switch_stmt_30_select_expr_2_ack_1; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/ca
          cmp_77_symbol <= ca_76_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/cmp
          switch_stmt_30_branch_2_req_0 <= cmp_77_symbol; -- link to DP
          Xexit_72_symbol <= cmp_77_symbol; -- transition branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2/$exit
          condition_2_70_symbol <= Xexit_72_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/switch_stmt_30__condition_check__/condition_2
        Xexit_53_block : Block -- non-trivial join transition branch_block_stmt_9/switch_stmt_30__condition_check__/$exit 
          signal Xexit_53_predecessors: BooleanArray(2 downto 0);
          -- 
        begin -- 
          Xexit_53_predecessors(0) <= condition_0_54_symbol;
          Xexit_53_predecessors(1) <= condition_1_62_symbol;
          Xexit_53_predecessors(2) <= condition_2_70_symbol;
          Xexit_53_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_53_predecessors,
              symbol_out => Xexit_53_symbol,
              clk => clk,
              reset => reset); -- 
          switch_stmt_30_branch_default_req_0 <= Xexit_53_symbol; -- link to DP
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_9/switch_stmt_30__condition_check__/$exit
        switch_stmt_30_x_xcondition_check_x_xx_x51_symbol <= Xexit_53_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/switch_stmt_30__condition_check__
      switch_stmt_30_x_xselect_x_xx_x78_symbol  <=  switch_stmt_30_x_xcondition_check_x_xx_x51_symbol; -- place branch_block_stmt_9/switch_stmt_30__select__ (optimized away) 
      switch_stmt_30_choice_0_79: Block -- branch_block_stmt_9/switch_stmt_30_choice_0 
        signal Xentry_80_symbol: Boolean;
        signal Xexit_81_symbol: Boolean;
        signal ack1_82_symbol : Boolean;
        -- 
      begin -- 
        switch_stmt_30_choice_0_79_start <= switch_stmt_30_x_xselect_x_xx_x78_symbol; -- control passed to block
        Xentry_80_symbol  <= switch_stmt_30_choice_0_79_start; -- transition branch_block_stmt_9/switch_stmt_30_choice_0/$entry
        ack1_82_symbol <= switch_stmt_30_branch_0_ack_1; -- transition branch_block_stmt_9/switch_stmt_30_choice_0/ack1
        Xexit_81_symbol <= ack1_82_symbol; -- transition branch_block_stmt_9/switch_stmt_30_choice_0/$exit
        switch_stmt_30_choice_0_79_symbol <= Xexit_81_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/switch_stmt_30_choice_0
      loopback_83_symbol  <=  switch_stmt_30_choice_0_79_symbol or switch_stmt_30_choice_1_84_symbol or switch_stmt_30_choice_2_88_symbol; -- place branch_block_stmt_9/loopback (optimized away) 
      switch_stmt_30_choice_1_84: Block -- branch_block_stmt_9/switch_stmt_30_choice_1 
        signal Xentry_85_symbol: Boolean;
        signal Xexit_86_symbol: Boolean;
        signal ack1_87_symbol : Boolean;
        -- 
      begin -- 
        switch_stmt_30_choice_1_84_start <= switch_stmt_30_x_xselect_x_xx_x78_symbol; -- control passed to block
        Xentry_85_symbol  <= switch_stmt_30_choice_1_84_start; -- transition branch_block_stmt_9/switch_stmt_30_choice_1/$entry
        ack1_87_symbol <= switch_stmt_30_branch_1_ack_1; -- transition branch_block_stmt_9/switch_stmt_30_choice_1/ack1
        Xexit_86_symbol <= ack1_87_symbol; -- transition branch_block_stmt_9/switch_stmt_30_choice_1/$exit
        switch_stmt_30_choice_1_84_symbol <= Xexit_86_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/switch_stmt_30_choice_1
      switch_stmt_30_choice_2_88: Block -- branch_block_stmt_9/switch_stmt_30_choice_2 
        signal Xentry_89_symbol: Boolean;
        signal Xexit_90_symbol: Boolean;
        signal ack1_91_symbol : Boolean;
        -- 
      begin -- 
        switch_stmt_30_choice_2_88_start <= switch_stmt_30_x_xselect_x_xx_x78_symbol; -- control passed to block
        Xentry_89_symbol  <= switch_stmt_30_choice_2_88_start; -- transition branch_block_stmt_9/switch_stmt_30_choice_2/$entry
        ack1_91_symbol <= switch_stmt_30_branch_2_ack_1; -- transition branch_block_stmt_9/switch_stmt_30_choice_2/ack1
        Xexit_90_symbol <= ack1_91_symbol; -- transition branch_block_stmt_9/switch_stmt_30_choice_2/$exit
        switch_stmt_30_choice_2_88_symbol <= Xexit_90_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/switch_stmt_30_choice_2
      switch_stmt_30_choice_default_92: Block -- branch_block_stmt_9/switch_stmt_30_choice_default 
        signal Xentry_93_symbol: Boolean;
        signal Xexit_94_symbol: Boolean;
        signal ack0_95_symbol : Boolean;
        -- 
      begin -- 
        switch_stmt_30_choice_default_92_start <= switch_stmt_30_x_xselect_x_xx_x78_symbol; -- control passed to block
        Xentry_93_symbol  <= switch_stmt_30_choice_default_92_start; -- transition branch_block_stmt_9/switch_stmt_30_choice_default/$entry
        ack0_95_symbol <= switch_stmt_30_branch_default_ack_0; -- transition branch_block_stmt_9/switch_stmt_30_choice_default/ack0
        Xexit_94_symbol <= ack0_95_symbol; -- transition branch_block_stmt_9/switch_stmt_30_choice_default/$exit
        switch_stmt_30_choice_default_92_symbol <= Xexit_94_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/switch_stmt_30_choice_default
      stmt_41_x_xentry_x_xx_x96_symbol  <=  switch_stmt_30_choice_default_92_symbol; -- place branch_block_stmt_9/stmt_41__entry__ (optimized away) 
      stmt_41_x_xexit_x_xx_x97_symbol  <=  stmt_41_98_symbol; -- place branch_block_stmt_9/stmt_41__exit__ (optimized away) 
      stmt_41_98: Block -- branch_block_stmt_9/stmt_41 
        signal Xentry_99_symbol: Boolean;
        signal Xexit_100_symbol: Boolean;
        -- 
      begin -- 
        stmt_41_98_start <= stmt_41_x_xentry_x_xx_x96_symbol; -- control passed to block
        Xentry_99_symbol  <= stmt_41_98_start; -- transition branch_block_stmt_9/stmt_41/$entry
        Xexit_100_symbol <= Xentry_99_symbol; -- transition branch_block_stmt_9/stmt_41/$exit
        stmt_41_98_symbol <= Xexit_100_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/stmt_41
      merge_stmt_10_dead_link_101: Block -- branch_block_stmt_9/merge_stmt_10_dead_link 
        signal Xentry_102_symbol: Boolean;
        signal Xexit_103_symbol: Boolean;
        signal dead_transition_104_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_10_dead_link_101_start <= merge_stmt_10_x_xentry_x_xx_x12_symbol; -- control passed to block
        Xentry_102_symbol  <= merge_stmt_10_dead_link_101_start; -- transition branch_block_stmt_9/merge_stmt_10_dead_link/$entry
        dead_transition_104_symbol <= false;
        Xexit_103_symbol <= dead_transition_104_symbol; -- transition branch_block_stmt_9/merge_stmt_10_dead_link/$exit
        merge_stmt_10_dead_link_101_symbol <= Xexit_103_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/merge_stmt_10_dead_link
      merge_stmt_10_x_xentry_x_xx_xPhiReq_105: Block -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq 
        signal Xentry_106_symbol: Boolean;
        signal Xexit_107_symbol: Boolean;
        signal phi_stmt_11_108_start : Boolean;
        signal phi_stmt_11_108_symbol : Boolean;
        signal phi_stmt_15_115_start : Boolean;
        signal phi_stmt_15_115_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_10_x_xentry_x_xx_xPhiReq_105_start <= merge_stmt_10_x_xentry_x_xx_x12_symbol; -- control passed to block
        Xentry_106_symbol  <= merge_stmt_10_x_xentry_x_xx_xPhiReq_105_start; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/$entry
        phi_stmt_11_108: Block -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11 
          signal Xentry_109_symbol: Boolean;
          signal Xexit_110_symbol: Boolean;
          signal phi_stmt_11_sources_111_start : Boolean;
          signal phi_stmt_11_sources_111_symbol : Boolean;
          signal phi_stmt_11_req_114_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_11_108_start <= Xentry_106_symbol; -- control passed to block
          Xentry_109_symbol  <= phi_stmt_11_108_start; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/$entry
          phi_stmt_11_sources_111: Block -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/phi_stmt_11_sources 
            signal Xentry_112_symbol: Boolean;
            signal Xexit_113_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_11_sources_111_start <= Xentry_109_symbol; -- control passed to block
            Xentry_112_symbol  <= phi_stmt_11_sources_111_start; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/phi_stmt_11_sources/$entry
            Xexit_113_symbol <= Xentry_112_symbol; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/phi_stmt_11_sources/$exit
            phi_stmt_11_sources_111_symbol <= Xexit_113_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/phi_stmt_11_sources
          phi_stmt_11_req_114_symbol <= phi_stmt_11_sources_111_symbol; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/phi_stmt_11_req
          phi_stmt_11_req_0 <= phi_stmt_11_req_114_symbol; -- link to DP
          Xexit_110_symbol <= phi_stmt_11_req_114_symbol; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11/$exit
          phi_stmt_11_108_symbol <= Xexit_110_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_11
        phi_stmt_15_115: Block -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15 
          signal Xentry_116_symbol: Boolean;
          signal Xexit_117_symbol: Boolean;
          signal phi_stmt_15_sources_118_start : Boolean;
          signal phi_stmt_15_sources_118_symbol : Boolean;
          signal phi_stmt_15_req_121_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_15_115_start <= Xentry_106_symbol; -- control passed to block
          Xentry_116_symbol  <= phi_stmt_15_115_start; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/$entry
          phi_stmt_15_sources_118: Block -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/phi_stmt_15_sources 
            signal Xentry_119_symbol: Boolean;
            signal Xexit_120_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_15_sources_118_start <= Xentry_116_symbol; -- control passed to block
            Xentry_119_symbol  <= phi_stmt_15_sources_118_start; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/phi_stmt_15_sources/$entry
            Xexit_120_symbol <= Xentry_119_symbol; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/phi_stmt_15_sources/$exit
            phi_stmt_15_sources_118_symbol <= Xexit_120_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/phi_stmt_15_sources
          phi_stmt_15_req_121_symbol <= phi_stmt_15_sources_118_symbol; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/phi_stmt_15_req
          phi_stmt_15_req_0 <= phi_stmt_15_req_121_symbol; -- link to DP
          Xexit_117_symbol <= phi_stmt_15_req_121_symbol; -- transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15/$exit
          phi_stmt_15_115_symbol <= Xexit_117_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq/phi_stmt_15
        Xexit_107_block : Block -- non-trivial join transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/$exit 
          signal Xexit_107_predecessors: BooleanArray(1 downto 0);
          -- 
        begin -- 
          Xexit_107_predecessors(0) <= phi_stmt_11_108_symbol;
          Xexit_107_predecessors(1) <= phi_stmt_15_115_symbol;
          Xexit_107_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_107_predecessors,
              symbol_out => Xexit_107_symbol,
              clk => clk,
              reset => reset); -- 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_9/merge_stmt_10__entry___PhiReq/$exit
        merge_stmt_10_x_xentry_x_xx_xPhiReq_105_symbol <= Xexit_107_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/merge_stmt_10__entry___PhiReq
      loopback_PhiReq_122: Block -- branch_block_stmt_9/loopback_PhiReq 
        signal Xentry_123_symbol: Boolean;
        signal Xexit_124_symbol: Boolean;
        signal phi_stmt_11_125_start : Boolean;
        signal phi_stmt_11_125_symbol : Boolean;
        signal phi_stmt_15_132_start : Boolean;
        signal phi_stmt_15_132_symbol : Boolean;
        -- 
      begin -- 
        loopback_PhiReq_122_start <= loopback_83_symbol; -- control passed to block
        Xentry_123_symbol  <= loopback_PhiReq_122_start; -- transition branch_block_stmt_9/loopback_PhiReq/$entry
        phi_stmt_11_125: Block -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_11 
          signal Xentry_126_symbol: Boolean;
          signal Xexit_127_symbol: Boolean;
          signal phi_stmt_11_sources_128_start : Boolean;
          signal phi_stmt_11_sources_128_symbol : Boolean;
          signal phi_stmt_11_req_131_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_11_125_start <= Xentry_123_symbol; -- control passed to block
          Xentry_126_symbol  <= phi_stmt_11_125_start; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/$entry
          phi_stmt_11_sources_128: Block -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/phi_stmt_11_sources 
            signal Xentry_129_symbol: Boolean;
            signal Xexit_130_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_11_sources_128_start <= Xentry_126_symbol; -- control passed to block
            Xentry_129_symbol  <= phi_stmt_11_sources_128_start; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/phi_stmt_11_sources/$entry
            Xexit_130_symbol <= Xentry_129_symbol; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/phi_stmt_11_sources/$exit
            phi_stmt_11_sources_128_symbol <= Xexit_130_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/phi_stmt_11_sources
          phi_stmt_11_req_131_symbol <= phi_stmt_11_sources_128_symbol; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/phi_stmt_11_req
          phi_stmt_11_req_1 <= phi_stmt_11_req_131_symbol; -- link to DP
          Xexit_127_symbol <= phi_stmt_11_req_131_symbol; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_11/$exit
          phi_stmt_11_125_symbol <= Xexit_127_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_11
        phi_stmt_15_132: Block -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_15 
          signal Xentry_133_symbol: Boolean;
          signal Xexit_134_symbol: Boolean;
          signal phi_stmt_15_sources_135_start : Boolean;
          signal phi_stmt_15_sources_135_symbol : Boolean;
          signal phi_stmt_15_req_138_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_15_132_start <= Xentry_123_symbol; -- control passed to block
          Xentry_133_symbol  <= phi_stmt_15_132_start; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/$entry
          phi_stmt_15_sources_135: Block -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/phi_stmt_15_sources 
            signal Xentry_136_symbol: Boolean;
            signal Xexit_137_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_15_sources_135_start <= Xentry_133_symbol; -- control passed to block
            Xentry_136_symbol  <= phi_stmt_15_sources_135_start; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/phi_stmt_15_sources/$entry
            Xexit_137_symbol <= Xentry_136_symbol; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/phi_stmt_15_sources/$exit
            phi_stmt_15_sources_135_symbol <= Xexit_137_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/phi_stmt_15_sources
          phi_stmt_15_req_138_symbol <= phi_stmt_15_sources_135_symbol; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/phi_stmt_15_req
          phi_stmt_15_req_1 <= phi_stmt_15_req_138_symbol; -- link to DP
          Xexit_134_symbol <= phi_stmt_15_req_138_symbol; -- transition branch_block_stmt_9/loopback_PhiReq/phi_stmt_15/$exit
          phi_stmt_15_132_symbol <= Xexit_134_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_9/loopback_PhiReq/phi_stmt_15
        Xexit_124_block : Block -- non-trivial join transition branch_block_stmt_9/loopback_PhiReq/$exit 
          signal Xexit_124_predecessors: BooleanArray(1 downto 0);
          -- 
        begin -- 
          Xexit_124_predecessors(0) <= phi_stmt_11_125_symbol;
          Xexit_124_predecessors(1) <= phi_stmt_15_132_symbol;
          Xexit_124_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_124_predecessors,
              symbol_out => Xexit_124_symbol,
              clk => clk,
              reset => reset); -- 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_9/loopback_PhiReq/$exit
        loopback_PhiReq_122_symbol <= Xexit_124_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/loopback_PhiReq
      merge_stmt_10_PhiReqMerge_139_symbol  <=  merge_stmt_10_x_xentry_x_xx_xPhiReq_105_symbol or loopback_PhiReq_122_symbol; -- place branch_block_stmt_9/merge_stmt_10_PhiReqMerge (optimized away) 
      merge_stmt_10_PhiAck_140: Block -- branch_block_stmt_9/merge_stmt_10_PhiAck 
        signal Xentry_141_symbol: Boolean;
        signal Xexit_142_symbol: Boolean;
        signal phi_stmt_11_ack_143_symbol : Boolean;
        signal phi_stmt_15_ack_144_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_10_PhiAck_140_start <= merge_stmt_10_PhiReqMerge_139_symbol; -- control passed to block
        Xentry_141_symbol  <= merge_stmt_10_PhiAck_140_start; -- transition branch_block_stmt_9/merge_stmt_10_PhiAck/$entry
        phi_stmt_11_ack_143_symbol <= phi_stmt_11_ack_0; -- transition branch_block_stmt_9/merge_stmt_10_PhiAck/phi_stmt_11_ack
        phi_stmt_15_ack_144_symbol <= phi_stmt_15_ack_0; -- transition branch_block_stmt_9/merge_stmt_10_PhiAck/phi_stmt_15_ack
        Xexit_142_block : Block -- non-trivial join transition branch_block_stmt_9/merge_stmt_10_PhiAck/$exit 
          signal Xexit_142_predecessors: BooleanArray(1 downto 0);
          -- 
        begin -- 
          Xexit_142_predecessors(0) <= phi_stmt_11_ack_143_symbol;
          Xexit_142_predecessors(1) <= phi_stmt_15_ack_144_symbol;
          Xexit_142_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_142_predecessors,
              symbol_out => Xexit_142_symbol,
              clk => clk,
              reset => reset); -- 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_9/merge_stmt_10_PhiAck/$exit
        merge_stmt_10_PhiAck_140_symbol <= Xexit_142_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_9/merge_stmt_10_PhiAck
      Xexit_9_symbol <= branch_block_stmt_9_x_xexit_x_xx_x11_symbol; -- transition branch_block_stmt_9/$exit
      branch_block_stmt_9_7_symbol <= Xexit_9_symbol; -- control passed from block 
      -- 
    end Block; -- branch_block_stmt_9
    branch_block_stmt_44_145: Block -- branch_block_stmt_44 
      signal Xentry_146_symbol: Boolean;
      signal Xexit_147_symbol: Boolean;
      signal branch_block_stmt_44_x_xentry_x_xx_x148_symbol : Boolean;
      signal branch_block_stmt_44_x_xexit_x_xx_x149_symbol : Boolean;
      signal merge_stmt_45_x_xentry_x_xx_x150_symbol : Boolean;
      signal merge_stmt_45_x_xexit_x_xx_x151_symbol : Boolean;
      signal assign_stmt_59_x_xentry_x_xx_x152_symbol : Boolean;
      signal assign_stmt_59_x_xexit_x_xx_x153_symbol : Boolean;
      signal assign_stmt_64_x_xentry_x_xx_x154_symbol : Boolean;
      signal assign_stmt_64_x_xexit_x_xx_x155_symbol : Boolean;
      signal if_stmt_65_x_xentry_x_xx_x156_symbol : Boolean;
      signal if_stmt_65_x_xexit_x_xx_x157_symbol : Boolean;
      signal assign_stmt_59_158_start : Boolean;
      signal assign_stmt_59_158_symbol : Boolean;
      signal assign_stmt_64_171_start : Boolean;
      signal assign_stmt_64_171_symbol : Boolean;
      signal if_stmt_65_dead_link_184_start : Boolean;
      signal if_stmt_65_dead_link_184_symbol : Boolean;
      signal if_stmt_65_eval_test_188_start : Boolean;
      signal if_stmt_65_eval_test_188_symbol : Boolean;
      signal binary_68_place_202_symbol : Boolean;
      signal if_stmt_65_if_link_203_start : Boolean;
      signal if_stmt_65_if_link_203_symbol : Boolean;
      signal if_stmt_65_else_link_207_start : Boolean;
      signal if_stmt_65_else_link_207_symbol : Boolean;
      signal loopback_211_symbol : Boolean;
      signal stmt_71_x_xentry_x_xx_x212_symbol : Boolean;
      signal stmt_71_x_xexit_x_xx_x213_symbol : Boolean;
      signal stmt_71_214_start : Boolean;
      signal stmt_71_214_symbol : Boolean;
      signal merge_stmt_45_dead_link_217_start : Boolean;
      signal merge_stmt_45_dead_link_217_symbol : Boolean;
      signal merge_stmt_45_x_xentry_x_xx_xPhiReq_221_start : Boolean;
      signal merge_stmt_45_x_xentry_x_xx_xPhiReq_221_symbol : Boolean;
      signal loopback_PhiReq_238_start : Boolean;
      signal loopback_PhiReq_238_symbol : Boolean;
      signal merge_stmt_45_PhiReqMerge_255_symbol : Boolean;
      signal merge_stmt_45_PhiAck_256_start : Boolean;
      signal merge_stmt_45_PhiAck_256_symbol : Boolean;
      -- 
    begin -- 
      branch_block_stmt_44_145_start <= branch_block_stmt_9_7_symbol; -- control passed to block
      Xentry_146_symbol  <= branch_block_stmt_44_145_start; -- transition branch_block_stmt_44/$entry
      branch_block_stmt_44_x_xentry_x_xx_x148_symbol  <=  Xentry_146_symbol; -- place branch_block_stmt_44/branch_block_stmt_44__entry__ (optimized away) 
      branch_block_stmt_44_x_xexit_x_xx_x149_symbol  <=  if_stmt_65_x_xexit_x_xx_x157_symbol; -- place branch_block_stmt_44/branch_block_stmt_44__exit__ (optimized away) 
      merge_stmt_45_x_xentry_x_xx_x150_symbol  <=  branch_block_stmt_44_x_xentry_x_xx_x148_symbol; -- place branch_block_stmt_44/merge_stmt_45__entry__ (optimized away) 
      merge_stmt_45_x_xexit_x_xx_x151_symbol  <=  merge_stmt_45_dead_link_217_symbol or merge_stmt_45_PhiAck_256_symbol; -- place branch_block_stmt_44/merge_stmt_45__exit__ (optimized away) 
      assign_stmt_59_x_xentry_x_xx_x152_symbol  <=  merge_stmt_45_x_xexit_x_xx_x151_symbol; -- place branch_block_stmt_44/assign_stmt_59__entry__ (optimized away) 
      assign_stmt_59_x_xexit_x_xx_x153_symbol  <=  assign_stmt_59_158_symbol; -- place branch_block_stmt_44/assign_stmt_59__exit__ (optimized away) 
      assign_stmt_64_x_xentry_x_xx_x154_symbol  <=  assign_stmt_59_x_xexit_x_xx_x153_symbol; -- place branch_block_stmt_44/assign_stmt_64__entry__ (optimized away) 
      assign_stmt_64_x_xexit_x_xx_x155_symbol  <=  assign_stmt_64_171_symbol; -- place branch_block_stmt_44/assign_stmt_64__exit__ (optimized away) 
      if_stmt_65_x_xentry_x_xx_x156_symbol  <=  assign_stmt_64_x_xexit_x_xx_x155_symbol; -- place branch_block_stmt_44/if_stmt_65__entry__ (optimized away) 
      if_stmt_65_x_xexit_x_xx_x157_symbol  <=  stmt_71_x_xexit_x_xx_x213_symbol or if_stmt_65_dead_link_184_symbol; -- place branch_block_stmt_44/if_stmt_65__exit__ (optimized away) 
      assign_stmt_59_158: Block -- branch_block_stmt_44/assign_stmt_59 
        signal Xentry_159_symbol: Boolean;
        signal Xexit_160_symbol: Boolean;
        signal binary_58_161_start : Boolean;
        signal binary_58_161_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_59_158_start <= assign_stmt_59_x_xentry_x_xx_x152_symbol; -- control passed to block
        Xentry_159_symbol  <= assign_stmt_59_158_start; -- transition branch_block_stmt_44/assign_stmt_59/$entry
        binary_58_161: Block -- branch_block_stmt_44/assign_stmt_59/binary_58 
          signal Xentry_162_symbol: Boolean;
          signal Xexit_163_symbol: Boolean;
          signal binary_58_inputs_164_start : Boolean;
          signal binary_58_inputs_164_symbol : Boolean;
          signal rr_167_symbol : Boolean;
          signal ra_168_symbol : Boolean;
          signal cr_169_symbol : Boolean;
          signal ca_170_symbol : Boolean;
          -- 
        begin -- 
          binary_58_161_start <= Xentry_159_symbol; -- control passed to block
          Xentry_162_symbol  <= binary_58_161_start; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/$entry
          binary_58_inputs_164: Block -- branch_block_stmt_44/assign_stmt_59/binary_58/binary_58_inputs 
            signal Xentry_165_symbol: Boolean;
            signal Xexit_166_symbol: Boolean;
            -- 
          begin -- 
            binary_58_inputs_164_start <= Xentry_162_symbol; -- control passed to block
            Xentry_165_symbol  <= binary_58_inputs_164_start; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/binary_58_inputs/$entry
            Xexit_166_symbol <= Xentry_165_symbol; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/binary_58_inputs/$exit
            binary_58_inputs_164_symbol <= Xexit_166_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/assign_stmt_59/binary_58/binary_58_inputs
          rr_167_symbol <= binary_58_inputs_164_symbol; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/rr
          binary_58_inst_req_0 <= rr_167_symbol; -- link to DP
          ra_168_symbol <= binary_58_inst_ack_0; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/ra
          cr_169_symbol <= ra_168_symbol; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/cr
          binary_58_inst_req_1 <= cr_169_symbol; -- link to DP
          ca_170_symbol <= binary_58_inst_ack_1; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/ca
          Xexit_163_symbol <= ca_170_symbol; -- transition branch_block_stmt_44/assign_stmt_59/binary_58/$exit
          binary_58_161_symbol <= Xexit_163_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/assign_stmt_59/binary_58
        Xexit_160_symbol <= binary_58_161_symbol; -- transition branch_block_stmt_44/assign_stmt_59/$exit
        assign_stmt_59_158_symbol <= Xexit_160_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/assign_stmt_59
      assign_stmt_64_171: Block -- branch_block_stmt_44/assign_stmt_64 
        signal Xentry_172_symbol: Boolean;
        signal Xexit_173_symbol: Boolean;
        signal binary_63_174_start : Boolean;
        signal binary_63_174_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_64_171_start <= assign_stmt_64_x_xentry_x_xx_x154_symbol; -- control passed to block
        Xentry_172_symbol  <= assign_stmt_64_171_start; -- transition branch_block_stmt_44/assign_stmt_64/$entry
        binary_63_174: Block -- branch_block_stmt_44/assign_stmt_64/binary_63 
          signal Xentry_175_symbol: Boolean;
          signal Xexit_176_symbol: Boolean;
          signal binary_63_inputs_177_start : Boolean;
          signal binary_63_inputs_177_symbol : Boolean;
          signal rr_180_symbol : Boolean;
          signal ra_181_symbol : Boolean;
          signal cr_182_symbol : Boolean;
          signal ca_183_symbol : Boolean;
          -- 
        begin -- 
          binary_63_174_start <= Xentry_172_symbol; -- control passed to block
          Xentry_175_symbol  <= binary_63_174_start; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/$entry
          binary_63_inputs_177: Block -- branch_block_stmt_44/assign_stmt_64/binary_63/binary_63_inputs 
            signal Xentry_178_symbol: Boolean;
            signal Xexit_179_symbol: Boolean;
            -- 
          begin -- 
            binary_63_inputs_177_start <= Xentry_175_symbol; -- control passed to block
            Xentry_178_symbol  <= binary_63_inputs_177_start; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/binary_63_inputs/$entry
            Xexit_179_symbol <= Xentry_178_symbol; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/binary_63_inputs/$exit
            binary_63_inputs_177_symbol <= Xexit_179_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/assign_stmt_64/binary_63/binary_63_inputs
          rr_180_symbol <= binary_63_inputs_177_symbol; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/rr
          binary_63_inst_req_0 <= rr_180_symbol; -- link to DP
          ra_181_symbol <= binary_63_inst_ack_0; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/ra
          cr_182_symbol <= ra_181_symbol; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/cr
          binary_63_inst_req_1 <= cr_182_symbol; -- link to DP
          ca_183_symbol <= binary_63_inst_ack_1; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/ca
          Xexit_176_symbol <= ca_183_symbol; -- transition branch_block_stmt_44/assign_stmt_64/binary_63/$exit
          binary_63_174_symbol <= Xexit_176_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/assign_stmt_64/binary_63
        Xexit_173_symbol <= binary_63_174_symbol; -- transition branch_block_stmt_44/assign_stmt_64/$exit
        assign_stmt_64_171_symbol <= Xexit_173_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/assign_stmt_64
      if_stmt_65_dead_link_184: Block -- branch_block_stmt_44/if_stmt_65_dead_link 
        signal Xentry_185_symbol: Boolean;
        signal Xexit_186_symbol: Boolean;
        signal dead_transition_187_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_65_dead_link_184_start <= if_stmt_65_x_xentry_x_xx_x156_symbol; -- control passed to block
        Xentry_185_symbol  <= if_stmt_65_dead_link_184_start; -- transition branch_block_stmt_44/if_stmt_65_dead_link/$entry
        dead_transition_187_symbol <= false;
        Xexit_186_symbol <= dead_transition_187_symbol; -- transition branch_block_stmt_44/if_stmt_65_dead_link/$exit
        if_stmt_65_dead_link_184_symbol <= Xexit_186_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/if_stmt_65_dead_link
      if_stmt_65_eval_test_188: Block -- branch_block_stmt_44/if_stmt_65_eval_test 
        signal Xentry_189_symbol: Boolean;
        signal Xexit_190_symbol: Boolean;
        signal binary_68_191_start : Boolean;
        signal binary_68_191_symbol : Boolean;
        signal branch_req_201_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_65_eval_test_188_start <= if_stmt_65_x_xentry_x_xx_x156_symbol; -- control passed to block
        Xentry_189_symbol  <= if_stmt_65_eval_test_188_start; -- transition branch_block_stmt_44/if_stmt_65_eval_test/$entry
        binary_68_191: Block -- branch_block_stmt_44/if_stmt_65_eval_test/binary_68 
          signal Xentry_192_symbol: Boolean;
          signal Xexit_193_symbol: Boolean;
          signal binary_68_inputs_194_start : Boolean;
          signal binary_68_inputs_194_symbol : Boolean;
          signal rr_197_symbol : Boolean;
          signal ra_198_symbol : Boolean;
          signal cr_199_symbol : Boolean;
          signal ca_200_symbol : Boolean;
          -- 
        begin -- 
          binary_68_191_start <= Xentry_189_symbol; -- control passed to block
          Xentry_192_symbol  <= binary_68_191_start; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/$entry
          binary_68_inputs_194: Block -- branch_block_stmt_44/if_stmt_65_eval_test/binary_68/binary_68_inputs 
            signal Xentry_195_symbol: Boolean;
            signal Xexit_196_symbol: Boolean;
            -- 
          begin -- 
            binary_68_inputs_194_start <= Xentry_192_symbol; -- control passed to block
            Xentry_195_symbol  <= binary_68_inputs_194_start; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/binary_68_inputs/$entry
            Xexit_196_symbol <= Xentry_195_symbol; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/binary_68_inputs/$exit
            binary_68_inputs_194_symbol <= Xexit_196_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/if_stmt_65_eval_test/binary_68/binary_68_inputs
          rr_197_symbol <= binary_68_inputs_194_symbol; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/rr
          binary_68_inst_req_0 <= rr_197_symbol; -- link to DP
          ra_198_symbol <= binary_68_inst_ack_0; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/ra
          cr_199_symbol <= ra_198_symbol; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/cr
          binary_68_inst_req_1 <= cr_199_symbol; -- link to DP
          ca_200_symbol <= binary_68_inst_ack_1; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/ca
          Xexit_193_symbol <= ca_200_symbol; -- transition branch_block_stmt_44/if_stmt_65_eval_test/binary_68/$exit
          binary_68_191_symbol <= Xexit_193_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/if_stmt_65_eval_test/binary_68
        branch_req_201_symbol <= binary_68_191_symbol; -- transition branch_block_stmt_44/if_stmt_65_eval_test/branch_req
        if_stmt_65_branch_req_0 <= branch_req_201_symbol; -- link to DP
        Xexit_190_symbol <= branch_req_201_symbol; -- transition branch_block_stmt_44/if_stmt_65_eval_test/$exit
        if_stmt_65_eval_test_188_symbol <= Xexit_190_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/if_stmt_65_eval_test
      binary_68_place_202_symbol  <=  if_stmt_65_eval_test_188_symbol; -- place branch_block_stmt_44/binary_68_place (optimized away) 
      if_stmt_65_if_link_203: Block -- branch_block_stmt_44/if_stmt_65_if_link 
        signal Xentry_204_symbol: Boolean;
        signal Xexit_205_symbol: Boolean;
        signal if_choice_transition_206_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_65_if_link_203_start <= binary_68_place_202_symbol; -- control passed to block
        Xentry_204_symbol  <= if_stmt_65_if_link_203_start; -- transition branch_block_stmt_44/if_stmt_65_if_link/$entry
        if_choice_transition_206_symbol <= if_stmt_65_branch_ack_1; -- transition branch_block_stmt_44/if_stmt_65_if_link/if_choice_transition
        Xexit_205_symbol <= if_choice_transition_206_symbol; -- transition branch_block_stmt_44/if_stmt_65_if_link/$exit
        if_stmt_65_if_link_203_symbol <= Xexit_205_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/if_stmt_65_if_link
      if_stmt_65_else_link_207: Block -- branch_block_stmt_44/if_stmt_65_else_link 
        signal Xentry_208_symbol: Boolean;
        signal Xexit_209_symbol: Boolean;
        signal else_choice_transition_210_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_65_else_link_207_start <= binary_68_place_202_symbol; -- control passed to block
        Xentry_208_symbol  <= if_stmt_65_else_link_207_start; -- transition branch_block_stmt_44/if_stmt_65_else_link/$entry
        else_choice_transition_210_symbol <= if_stmt_65_branch_ack_0; -- transition branch_block_stmt_44/if_stmt_65_else_link/else_choice_transition
        Xexit_209_symbol <= else_choice_transition_210_symbol; -- transition branch_block_stmt_44/if_stmt_65_else_link/$exit
        if_stmt_65_else_link_207_symbol <= Xexit_209_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/if_stmt_65_else_link
      loopback_211_symbol  <=  if_stmt_65_if_link_203_symbol; -- place branch_block_stmt_44/loopback (optimized away) 
      stmt_71_x_xentry_x_xx_x212_symbol  <=  if_stmt_65_else_link_207_symbol; -- place branch_block_stmt_44/stmt_71__entry__ (optimized away) 
      stmt_71_x_xexit_x_xx_x213_symbol  <=  stmt_71_214_symbol; -- place branch_block_stmt_44/stmt_71__exit__ (optimized away) 
      stmt_71_214: Block -- branch_block_stmt_44/stmt_71 
        signal Xentry_215_symbol: Boolean;
        signal Xexit_216_symbol: Boolean;
        -- 
      begin -- 
        stmt_71_214_start <= stmt_71_x_xentry_x_xx_x212_symbol; -- control passed to block
        Xentry_215_symbol  <= stmt_71_214_start; -- transition branch_block_stmt_44/stmt_71/$entry
        Xexit_216_symbol <= Xentry_215_symbol; -- transition branch_block_stmt_44/stmt_71/$exit
        stmt_71_214_symbol <= Xexit_216_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/stmt_71
      merge_stmt_45_dead_link_217: Block -- branch_block_stmt_44/merge_stmt_45_dead_link 
        signal Xentry_218_symbol: Boolean;
        signal Xexit_219_symbol: Boolean;
        signal dead_transition_220_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_45_dead_link_217_start <= merge_stmt_45_x_xentry_x_xx_x150_symbol; -- control passed to block
        Xentry_218_symbol  <= merge_stmt_45_dead_link_217_start; -- transition branch_block_stmt_44/merge_stmt_45_dead_link/$entry
        dead_transition_220_symbol <= false;
        Xexit_219_symbol <= dead_transition_220_symbol; -- transition branch_block_stmt_44/merge_stmt_45_dead_link/$exit
        merge_stmt_45_dead_link_217_symbol <= Xexit_219_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/merge_stmt_45_dead_link
      merge_stmt_45_x_xentry_x_xx_xPhiReq_221: Block -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq 
        signal Xentry_222_symbol: Boolean;
        signal Xexit_223_symbol: Boolean;
        signal phi_stmt_46_224_start : Boolean;
        signal phi_stmt_46_224_symbol : Boolean;
        signal phi_stmt_50_231_start : Boolean;
        signal phi_stmt_50_231_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_45_x_xentry_x_xx_xPhiReq_221_start <= merge_stmt_45_x_xentry_x_xx_x150_symbol; -- control passed to block
        Xentry_222_symbol  <= merge_stmt_45_x_xentry_x_xx_xPhiReq_221_start; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/$entry
        phi_stmt_46_224: Block -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46 
          signal Xentry_225_symbol: Boolean;
          signal Xexit_226_symbol: Boolean;
          signal phi_stmt_46_sources_227_start : Boolean;
          signal phi_stmt_46_sources_227_symbol : Boolean;
          signal phi_stmt_46_req_230_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_46_224_start <= Xentry_222_symbol; -- control passed to block
          Xentry_225_symbol  <= phi_stmt_46_224_start; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/$entry
          phi_stmt_46_sources_227: Block -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/phi_stmt_46_sources 
            signal Xentry_228_symbol: Boolean;
            signal Xexit_229_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_46_sources_227_start <= Xentry_225_symbol; -- control passed to block
            Xentry_228_symbol  <= phi_stmt_46_sources_227_start; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/phi_stmt_46_sources/$entry
            Xexit_229_symbol <= Xentry_228_symbol; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/phi_stmt_46_sources/$exit
            phi_stmt_46_sources_227_symbol <= Xexit_229_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/phi_stmt_46_sources
          phi_stmt_46_req_230_symbol <= phi_stmt_46_sources_227_symbol; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/phi_stmt_46_req
          phi_stmt_46_req_0 <= phi_stmt_46_req_230_symbol; -- link to DP
          Xexit_226_symbol <= phi_stmt_46_req_230_symbol; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46/$exit
          phi_stmt_46_224_symbol <= Xexit_226_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_46
        phi_stmt_50_231: Block -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50 
          signal Xentry_232_symbol: Boolean;
          signal Xexit_233_symbol: Boolean;
          signal phi_stmt_50_sources_234_start : Boolean;
          signal phi_stmt_50_sources_234_symbol : Boolean;
          signal phi_stmt_50_req_237_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_50_231_start <= Xentry_222_symbol; -- control passed to block
          Xentry_232_symbol  <= phi_stmt_50_231_start; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/$entry
          phi_stmt_50_sources_234: Block -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/phi_stmt_50_sources 
            signal Xentry_235_symbol: Boolean;
            signal Xexit_236_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_50_sources_234_start <= Xentry_232_symbol; -- control passed to block
            Xentry_235_symbol  <= phi_stmt_50_sources_234_start; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/phi_stmt_50_sources/$entry
            Xexit_236_symbol <= Xentry_235_symbol; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/phi_stmt_50_sources/$exit
            phi_stmt_50_sources_234_symbol <= Xexit_236_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/phi_stmt_50_sources
          phi_stmt_50_req_237_symbol <= phi_stmt_50_sources_234_symbol; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/phi_stmt_50_req
          phi_stmt_50_req_0 <= phi_stmt_50_req_237_symbol; -- link to DP
          Xexit_233_symbol <= phi_stmt_50_req_237_symbol; -- transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50/$exit
          phi_stmt_50_231_symbol <= Xexit_233_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq/phi_stmt_50
        Xexit_223_block : Block -- non-trivial join transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/$exit 
          signal Xexit_223_predecessors: BooleanArray(1 downto 0);
          -- 
        begin -- 
          Xexit_223_predecessors(0) <= phi_stmt_46_224_symbol;
          Xexit_223_predecessors(1) <= phi_stmt_50_231_symbol;
          Xexit_223_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_223_predecessors,
              symbol_out => Xexit_223_symbol,
              clk => clk,
              reset => reset); -- 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_44/merge_stmt_45__entry___PhiReq/$exit
        merge_stmt_45_x_xentry_x_xx_xPhiReq_221_symbol <= Xexit_223_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/merge_stmt_45__entry___PhiReq
      loopback_PhiReq_238: Block -- branch_block_stmt_44/loopback_PhiReq 
        signal Xentry_239_symbol: Boolean;
        signal Xexit_240_symbol: Boolean;
        signal phi_stmt_46_241_start : Boolean;
        signal phi_stmt_46_241_symbol : Boolean;
        signal phi_stmt_50_248_start : Boolean;
        signal phi_stmt_50_248_symbol : Boolean;
        -- 
      begin -- 
        loopback_PhiReq_238_start <= loopback_211_symbol; -- control passed to block
        Xentry_239_symbol  <= loopback_PhiReq_238_start; -- transition branch_block_stmt_44/loopback_PhiReq/$entry
        phi_stmt_46_241: Block -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_46 
          signal Xentry_242_symbol: Boolean;
          signal Xexit_243_symbol: Boolean;
          signal phi_stmt_46_sources_244_start : Boolean;
          signal phi_stmt_46_sources_244_symbol : Boolean;
          signal phi_stmt_46_req_247_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_46_241_start <= Xentry_239_symbol; -- control passed to block
          Xentry_242_symbol  <= phi_stmt_46_241_start; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/$entry
          phi_stmt_46_sources_244: Block -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/phi_stmt_46_sources 
            signal Xentry_245_symbol: Boolean;
            signal Xexit_246_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_46_sources_244_start <= Xentry_242_symbol; -- control passed to block
            Xentry_245_symbol  <= phi_stmt_46_sources_244_start; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/phi_stmt_46_sources/$entry
            Xexit_246_symbol <= Xentry_245_symbol; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/phi_stmt_46_sources/$exit
            phi_stmt_46_sources_244_symbol <= Xexit_246_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/phi_stmt_46_sources
          phi_stmt_46_req_247_symbol <= phi_stmt_46_sources_244_symbol; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/phi_stmt_46_req
          phi_stmt_46_req_1 <= phi_stmt_46_req_247_symbol; -- link to DP
          Xexit_243_symbol <= phi_stmt_46_req_247_symbol; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_46/$exit
          phi_stmt_46_241_symbol <= Xexit_243_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_46
        phi_stmt_50_248: Block -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_50 
          signal Xentry_249_symbol: Boolean;
          signal Xexit_250_symbol: Boolean;
          signal phi_stmt_50_sources_251_start : Boolean;
          signal phi_stmt_50_sources_251_symbol : Boolean;
          signal phi_stmt_50_req_254_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_50_248_start <= Xentry_239_symbol; -- control passed to block
          Xentry_249_symbol  <= phi_stmt_50_248_start; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/$entry
          phi_stmt_50_sources_251: Block -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/phi_stmt_50_sources 
            signal Xentry_252_symbol: Boolean;
            signal Xexit_253_symbol: Boolean;
            -- 
          begin -- 
            phi_stmt_50_sources_251_start <= Xentry_249_symbol; -- control passed to block
            Xentry_252_symbol  <= phi_stmt_50_sources_251_start; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/phi_stmt_50_sources/$entry
            Xexit_253_symbol <= Xentry_252_symbol; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/phi_stmt_50_sources/$exit
            phi_stmt_50_sources_251_symbol <= Xexit_253_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/phi_stmt_50_sources
          phi_stmt_50_req_254_symbol <= phi_stmt_50_sources_251_symbol; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/phi_stmt_50_req
          phi_stmt_50_req_1 <= phi_stmt_50_req_254_symbol; -- link to DP
          Xexit_250_symbol <= phi_stmt_50_req_254_symbol; -- transition branch_block_stmt_44/loopback_PhiReq/phi_stmt_50/$exit
          phi_stmt_50_248_symbol <= Xexit_250_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_44/loopback_PhiReq/phi_stmt_50
        Xexit_240_block : Block -- non-trivial join transition branch_block_stmt_44/loopback_PhiReq/$exit 
          signal Xexit_240_predecessors: BooleanArray(1 downto 0);
          -- 
        begin -- 
          Xexit_240_predecessors(0) <= phi_stmt_46_241_symbol;
          Xexit_240_predecessors(1) <= phi_stmt_50_248_symbol;
          Xexit_240_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_240_predecessors,
              symbol_out => Xexit_240_symbol,
              clk => clk,
              reset => reset); -- 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_44/loopback_PhiReq/$exit
        loopback_PhiReq_238_symbol <= Xexit_240_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/loopback_PhiReq
      merge_stmt_45_PhiReqMerge_255_symbol  <=  merge_stmt_45_x_xentry_x_xx_xPhiReq_221_symbol or loopback_PhiReq_238_symbol; -- place branch_block_stmt_44/merge_stmt_45_PhiReqMerge (optimized away) 
      merge_stmt_45_PhiAck_256: Block -- branch_block_stmt_44/merge_stmt_45_PhiAck 
        signal Xentry_257_symbol: Boolean;
        signal Xexit_258_symbol: Boolean;
        signal phi_stmt_46_ack_259_symbol : Boolean;
        signal phi_stmt_50_ack_260_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_45_PhiAck_256_start <= merge_stmt_45_PhiReqMerge_255_symbol; -- control passed to block
        Xentry_257_symbol  <= merge_stmt_45_PhiAck_256_start; -- transition branch_block_stmt_44/merge_stmt_45_PhiAck/$entry
        phi_stmt_46_ack_259_symbol <= phi_stmt_46_ack_0; -- transition branch_block_stmt_44/merge_stmt_45_PhiAck/phi_stmt_46_ack
        phi_stmt_50_ack_260_symbol <= phi_stmt_50_ack_0; -- transition branch_block_stmt_44/merge_stmt_45_PhiAck/phi_stmt_50_ack
        Xexit_258_block : Block -- non-trivial join transition branch_block_stmt_44/merge_stmt_45_PhiAck/$exit 
          signal Xexit_258_predecessors: BooleanArray(1 downto 0);
          -- 
        begin -- 
          Xexit_258_predecessors(0) <= phi_stmt_46_ack_259_symbol;
          Xexit_258_predecessors(1) <= phi_stmt_50_ack_260_symbol;
          Xexit_258_join: join -- 
            generic map ( bypass => true)
            port map( -- 
              preds => Xexit_258_predecessors,
              symbol_out => Xexit_258_symbol,
              clk => clk,
              reset => reset); -- 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_44/merge_stmt_45_PhiAck/$exit
        merge_stmt_45_PhiAck_256_symbol <= Xexit_258_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_44/merge_stmt_45_PhiAck
      Xexit_147_symbol <= branch_block_stmt_44_x_xexit_x_xx_x149_symbol; -- transition branch_block_stmt_44/$exit
      branch_block_stmt_44_145_symbol <= Xexit_147_symbol; -- control passed from block 
      -- 
    end Block; -- branch_block_stmt_44
    assign_stmt_76_261: Block -- assign_stmt_76 
      signal Xentry_262_symbol: Boolean;
      signal Xexit_263_symbol: Boolean;
      signal req_264_symbol : Boolean;
      signal ack_265_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_76_261_start <= branch_block_stmt_44_145_symbol; -- control passed to block
      Xentry_262_symbol  <= assign_stmt_76_261_start; -- transition assign_stmt_76/$entry
      req_264_symbol <= Xentry_262_symbol; -- transition assign_stmt_76/req
      simple_obj_ref_74_inst_req_0 <= req_264_symbol; -- link to DP
      ack_265_symbol <= simple_obj_ref_74_inst_ack_0; -- transition assign_stmt_76/ack
      Xexit_263_symbol <= ack_265_symbol; -- transition assign_stmt_76/$exit
      assign_stmt_76_261_symbol <= Xexit_263_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_76
    assign_stmt_81_266: Block -- assign_stmt_81 
      signal Xentry_267_symbol: Boolean;
      signal Xexit_268_symbol: Boolean;
      signal binary_80_269_start : Boolean;
      signal binary_80_269_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_81_266_start <= assign_stmt_76_261_symbol; -- control passed to block
      Xentry_267_symbol  <= assign_stmt_81_266_start; -- transition assign_stmt_81/$entry
      binary_80_269: Block -- assign_stmt_81/binary_80 
        signal Xentry_270_symbol: Boolean;
        signal Xexit_271_symbol: Boolean;
        signal binary_80_inputs_272_start : Boolean;
        signal binary_80_inputs_272_symbol : Boolean;
        signal rr_275_symbol : Boolean;
        signal ra_276_symbol : Boolean;
        signal cr_277_symbol : Boolean;
        signal ca_278_symbol : Boolean;
        -- 
      begin -- 
        binary_80_269_start <= Xentry_267_symbol; -- control passed to block
        Xentry_270_symbol  <= binary_80_269_start; -- transition assign_stmt_81/binary_80/$entry
        binary_80_inputs_272: Block -- assign_stmt_81/binary_80/binary_80_inputs 
          signal Xentry_273_symbol: Boolean;
          signal Xexit_274_symbol: Boolean;
          -- 
        begin -- 
          binary_80_inputs_272_start <= Xentry_270_symbol; -- control passed to block
          Xentry_273_symbol  <= binary_80_inputs_272_start; -- transition assign_stmt_81/binary_80/binary_80_inputs/$entry
          Xexit_274_symbol <= Xentry_273_symbol; -- transition assign_stmt_81/binary_80/binary_80_inputs/$exit
          binary_80_inputs_272_symbol <= Xexit_274_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_81/binary_80/binary_80_inputs
        rr_275_symbol <= binary_80_inputs_272_symbol; -- transition assign_stmt_81/binary_80/rr
        binary_80_inst_req_0 <= rr_275_symbol; -- link to DP
        ra_276_symbol <= binary_80_inst_ack_0; -- transition assign_stmt_81/binary_80/ra
        cr_277_symbol <= ra_276_symbol; -- transition assign_stmt_81/binary_80/cr
        binary_80_inst_req_1 <= cr_277_symbol; -- link to DP
        ca_278_symbol <= binary_80_inst_ack_1; -- transition assign_stmt_81/binary_80/ca
        Xexit_271_symbol <= ca_278_symbol; -- transition assign_stmt_81/binary_80/$exit
        binary_80_269_symbol <= Xexit_271_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_81/binary_80
      Xexit_268_symbol <= binary_80_269_symbol; -- transition assign_stmt_81/$exit
      assign_stmt_81_266_symbol <= Xexit_268_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_81
    Xexit_2_symbol <= assign_stmt_81_266_symbol; -- transition $exit
    fin_ack_symbol_join : Block -- non-trivial join transition fin_ack_symbol 
      signal fin_ack_symbol_predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      fin_ack_symbol_predecessors <= Xexit_2_symbol & fin_req_symbol;
      fin_ack_symbol_join_instance: join -- 
        generic map ( bypass => true)
        port map( -- 
          clk => clk, reset => reset, 
          preds => fin_ack_symbol_predecessors,
          symbol_out => fin_ack_symbol); -- 
      end block; --
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal a_8 : std_logic_vector(9 downto 0);
    signal binary_68_wire : std_logic_vector(0 downto 0);
    signal expr_17_wire_constant : std_logic_vector(9 downto 0);
    signal expr_22_wire_constant : std_logic_vector(9 downto 0);
    signal expr_27_wire_constant : std_logic_vector(9 downto 0);
    signal expr_32_wire_constant : std_logic_vector(9 downto 0);
    signal expr_32_wire_constant_cmp : std_logic_vector(0 downto 0);
    signal expr_35_wire_constant : std_logic_vector(9 downto 0);
    signal expr_35_wire_constant_cmp : std_logic_vector(0 downto 0);
    signal expr_38_wire_constant : std_logic_vector(9 downto 0);
    signal expr_38_wire_constant_cmp : std_logic_vector(0 downto 0);
    signal expr_52_wire_constant : std_logic_vector(9 downto 0);
    signal expr_57_wire_constant : std_logic_vector(9 downto 0);
    signal expr_62_wire_constant : std_logic_vector(9 downto 0);
    signal expr_67_wire_constant : std_logic_vector(9 downto 0);
    signal loop_counter_11 : std_logic_vector(9 downto 0);
    signal loop_counter_46 : std_logic_vector(9 downto 0);
    signal new_loop_counter_24 : std_logic_vector(9 downto 0);
    signal new_loop_counter_59 : std_logic_vector(9 downto 0);
    signal t_29 : std_logic_vector(9 downto 0);
    signal t_64 : std_logic_vector(9 downto 0);
    signal temp_t_15 : std_logic_vector(9 downto 0);
    signal temp_t_50 : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    a_8 <= "0000000011";
    expr_17_wire_constant <= "0000000000";
    expr_22_wire_constant <= "0000000001";
    expr_27_wire_constant <= "0000000001";
    expr_32_wire_constant <= "0000000001";
    expr_35_wire_constant <= "0000000010";
    expr_38_wire_constant <= "0000000011";
    expr_52_wire_constant <= "0000000000";
    expr_57_wire_constant <= "0000000001";
    expr_62_wire_constant <= "0000000001";
    expr_67_wire_constant <= "0000000000";
    phi_stmt_11: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= a_8 & new_loop_counter_24;
      req <= phi_stmt_11_req_0 & phi_stmt_11_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_11_ack_0,
          idata => idata,
          odata => loop_counter_11,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_11
    phi_stmt_15: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= expr_17_wire_constant & t_29;
      req <= phi_stmt_15_req_0 & phi_stmt_15_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_15_ack_0,
          idata => idata,
          odata => temp_t_15,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_15
    phi_stmt_46: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= a_8 & new_loop_counter_59;
      req <= phi_stmt_46_req_0 & phi_stmt_46_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_46_ack_0,
          idata => idata,
          odata => loop_counter_46,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_46
    phi_stmt_50: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= expr_52_wire_constant & t_64;
      req <= phi_stmt_50_req_0 & phi_stmt_50_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_50_ack_0,
          idata => idata,
          odata => temp_t_50,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_50
    simple_obj_ref_74_inst: RegisterBase --
      generic map(in_data_width => 10,out_data_width => 10, flow_through => false ) 
      port map( din => t_29, dout => b_buffer, req => simple_obj_ref_74_inst_req_0, ack => simple_obj_ref_74_inst_ack_0, clk => clk, reset => reset); -- 
    if_stmt_65_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= binary_68_wire;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_65_branch_req_0,
          ack0 => if_stmt_65_branch_ack_0,
          ack1 => if_stmt_65_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    switch_stmt_30_branch_0: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= expr_32_wire_constant_cmp;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => switch_stmt_30_branch_0_req_0,
          ack0 => open,
          ack1 => switch_stmt_30_branch_0_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    switch_stmt_30_branch_1: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= expr_35_wire_constant_cmp;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => switch_stmt_30_branch_1_req_0,
          ack0 => open,
          ack1 => switch_stmt_30_branch_1_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    switch_stmt_30_branch_2: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= expr_38_wire_constant_cmp;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => switch_stmt_30_branch_2_req_0,
          ack0 => open,
          ack1 => switch_stmt_30_branch_2_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    switch_stmt_30_branch_default: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(2 downto 0);
      begin 
      condition_sig <= expr_32_wire_constant_cmp & expr_35_wire_constant_cmp & expr_38_wire_constant_cmp;
      branch_instance: BranchBase -- 
        generic map( condition_width => 3)
        port map( -- 
          condition => condition_sig,
          req => switch_stmt_30_branch_default_req_0,
          ack0 => switch_stmt_30_branch_default_ack_0,
          ack1 => open,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared split operator group (0) : binary_23_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= loop_counter_11;
      new_loop_counter_24 <= data_out(9 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntSub",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0000000001",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_23_inst_req_0,
          ackL => binary_23_inst_ack_0,
          reqR => binary_23_inst_req_1,
          ackR => binary_23_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_28_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= temp_t_15;
      t_29 <= data_out(9 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0000000001",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_28_inst_req_0,
          ackL => binary_28_inst_ack_0,
          reqR => binary_28_inst_req_1,
          ackR => binary_28_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_58_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= loop_counter_46;
      new_loop_counter_59 <= data_out(9 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntSub",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0000000001",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_58_inst_req_0,
          ackL => binary_58_inst_ack_0,
          reqR => binary_58_inst_req_1,
          ackR => binary_58_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 2
    -- shared split operator group (3) : binary_63_inst 
    SplitOperatorGroup3: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= temp_t_50;
      t_64 <= data_out(9 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0000000001",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_63_inst_req_0,
          ackL => binary_63_inst_ack_0,
          reqR => binary_63_inst_req_1,
          ackR => binary_63_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 3
    -- shared split operator group (4) : binary_68_inst 
    SplitOperatorGroup4: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= new_loop_counter_59;
      binary_68_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntUgt",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000000",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_68_inst_req_0,
          ackL => binary_68_inst_ack_0,
          reqR => binary_68_inst_req_1,
          ackR => binary_68_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 4
    -- shared split operator group (5) : binary_80_inst 
    SplitOperatorGroup5: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= t_29 & t_64;
      test_buffer <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          constant_width => 1,
          use_constant  => false,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_80_inst_req_0,
          ackL => binary_80_inst_ack_0,
          reqR => binary_80_inst_req_1,
          ackR => binary_80_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 5
    -- shared split operator group (6) : switch_stmt_30_select_expr_0 
    SplitOperatorGroup6: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= new_loop_counter_24;
      expr_32_wire_constant_cmp <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000001",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => switch_stmt_30_select_expr_0_req_0,
          ackL => switch_stmt_30_select_expr_0_ack_0,
          reqR => switch_stmt_30_select_expr_0_req_1,
          ackR => switch_stmt_30_select_expr_0_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 6
    -- shared split operator group (7) : switch_stmt_30_select_expr_1 
    SplitOperatorGroup7: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= new_loop_counter_24;
      expr_35_wire_constant_cmp <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000010",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => switch_stmt_30_select_expr_1_req_0,
          ackL => switch_stmt_30_select_expr_1_ack_0,
          reqR => switch_stmt_30_select_expr_1_req_1,
          ackR => switch_stmt_30_select_expr_1_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 7
    -- shared split operator group (8) : switch_stmt_30_select_expr_2 
    SplitOperatorGroup8: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= new_loop_counter_24;
      expr_38_wire_constant_cmp <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000000011",
          constant_width => 10,
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => switch_stmt_30_select_expr_2_req_0,
          ackL => switch_stmt_30_select_expr_2_ack_0,
          reqR => switch_stmt_30_select_expr_2_req_1,
          ackR => switch_stmt_30_select_expr_2_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 8
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
use ahir.utilities.all;
library work;
use work.vc_system_package.all;
entity test_system is  -- system 
  port (-- 
    sum_mod_b : out  std_logic_vector(9 downto 0);
    sum_mod_test : out  std_logic_vector(0 downto 0);
    sum_mod_tag_in: in std_logic_vector(0 downto 0);
    sum_mod_tag_out: out std_logic_vector(0 downto 0);
    sum_mod_start_req : in std_logic;
    sum_mod_start_ack : out std_logic;
    sum_mod_fin_req   : in std_logic;
    sum_mod_fin_ack   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module sum_mod
  component sum_mod is -- 
    generic (tag_length : integer); 
    port ( -- 
      b : out  std_logic_vector(9 downto 0);
      test : out  std_logic_vector(0 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
    -- 
  end component;
  -- 
begin -- 
  -- module sum_mod
  sum_mod_instance:sum_mod-- 
    generic map(tag_length => 1)
    port map(-- 
      b => sum_mod_b,
      test => sum_mod_test,
      start_req => sum_mod_start_req,
      start_ack => sum_mod_start_ack,
      fin_req => sum_mod_fin_req,
      fin_ack => sum_mod_fin_ack,
      clk => clk,
      reset => reset,
      tag_in => sum_mod_tag_in,
      tag_out => sum_mod_tag_out-- 
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
use ahir.utilities.all;
library work;
use work.vc_system_package.all;
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      sum_mod_b : out  std_logic_vector(9 downto 0);
      sum_mod_test : out  std_logic_vector(0 downto 0);
      sum_mod_tag_in: in std_logic_vector(0 downto 0);
      sum_mod_tag_out: out std_logic_vector(0 downto 0);
      sum_mod_start_req : in std_logic;
      sum_mod_start_ack : out std_logic;
      sum_mod_fin_req   : in std_logic;
      sum_mod_fin_ack   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal sum_mod_b :   std_logic_vector(9 downto 0);
  signal sum_mod_test :   std_logic_vector(0 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start_req : std_logic := '0';
  signal sum_mod_start_ack : std_logic := '0';
  signal sum_mod_fin_req   : std_logic := '0';
  signal sum_mod_fin_ack   : std_logic := '0';
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    wait until clk = '1';
    reset <= '0';
    wait;
    --
  end process;
  -- a rudimentary tb.. will start all the top-level modules ..
  process
  begin --
    wait until clk = '1';
    sum_mod_start_req <= '1';
    while true loop --
      wait until clk = '1';
      if sum_mod_start_ack = '1' then exit; end if;--
    end loop; 
    sum_mod_start_req <= '0';
    sum_mod_fin_req <= '1';
    while true loop -- 
      wait until clk = '1';
      if sum_mod_fin_ack = '1' then exit; end if; --  
    end loop; 
    sum_mod_fin_req <= '0';
    wait;
    --
  end process;
  test_system_instance: test_system -- 
    port map ( -- 
      sum_mod_b => sum_mod_b,
      sum_mod_test => sum_mod_test,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start_req => sum_mod_start_req,
      sum_mod_start_ack => sum_mod_start_ack,
      sum_mod_fin_req  => sum_mod_fin_req, 
      sum_mod_fin_ack  => sum_mod_fin_ack ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
