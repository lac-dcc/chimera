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
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity sum_mod;
architecture Default of sum_mod is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal branch_block_stmt_4Xassign_stmt_24Xbinary_23Xcr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xassign_stmt_24Xbinary_23Xrr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xassign_stmt_24Xbinary_23Xra_dp_to_cp : boolean;
  signal branch_block_stmt_4Xassign_stmt_24Xbinary_23Xca_dp_to_cp : boolean;
  signal branch_block_stmt_4Xbinary_28Xrr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xbinary_28Xra_dp_to_cp : boolean;
  signal branch_block_stmt_4Xassign_stmt_19Xbinary_18Xrr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xassign_stmt_19Xbinary_18Xra_dp_to_cp : boolean;
  signal branch_block_stmt_4Xassign_stmt_19Xbinary_18Xcr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xassign_stmt_19Xbinary_18Xca_dp_to_cp : boolean;
  signal branch_block_stmt_4Xchoice_defaultXack0_dp_to_cp : boolean;
  signal branch_block_stmt_4Xmerge_stmt_5__entry___PhiReqXphi_stmt_6_req_cp_to_dp : boolean;
  signal branch_block_stmt_4Xmerge_stmt_5__entry___PhiReqXphi_stmt_10_req_cp_to_dp : boolean;
  signal branch_block_stmt_4Xloopback_PhiReqXphi_stmt_6_req_cp_to_dp : boolean;
  signal branch_block_stmt_4Xloopback_PhiReqXphi_stmt_10_req_cp_to_dp : boolean;
  signal branch_block_stmt_4Xmerge_stmt_5_PhiAckXphi_stmt_6_ack_dp_to_cp : boolean;
  signal branch_block_stmt_4Xmerge_stmt_5_PhiAckXphi_stmt_10_ack_dp_to_cp : boolean;
  signal assign_stmt_38Xreq_cp_to_dp : boolean;
  signal branch_block_stmt_4Xbinary_28Xcr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xbinary_28Xca_dp_to_cp : boolean;
  signal branch_block_stmt_4Xswitch_stmt_25__condition_check__XXexit_cp_to_dp : boolean;
  signal branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xrr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xra_dp_to_cp : boolean;
  signal branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xcr_cp_to_dp : boolean;
  signal branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xca_dp_to_cp : boolean;
  signal branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xcmp_cp_to_dp : boolean;
  signal branch_block_stmt_4Xchoice_0Xack1_dp_to_cp : boolean;
  signal assign_stmt_38Xack_dp_to_cp : boolean;
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
  cp_0: Block -- control-path 
    signal cp_0_start: Boolean;
    signal cp_1_symbol: Boolean;
    signal cp_2_symbol: Boolean;
    signal cp_3_symbol : Boolean;
    signal cp_93_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- branch_block_stmt_4 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      signal cp_7_symbol : Boolean;
      signal cp_8_symbol : Boolean;
      signal cp_9_symbol : Boolean;
      signal cp_10_symbol : Boolean;
      signal cp_11_symbol : Boolean;
      signal cp_12_symbol : Boolean;
      signal cp_13_symbol : Boolean;
      signal cp_14_symbol : Boolean;
      signal cp_27_symbol : Boolean;
      signal cp_40_symbol : Boolean;
      signal cp_50_symbol : Boolean;
      signal cp_51_symbol : Boolean;
      signal cp_62_symbol : Boolean;
      signal cp_63_symbol : Boolean;
      signal cp_64_symbol : Boolean;
      signal cp_68_symbol : Boolean;
      signal cp_69_symbol : Boolean;
      signal cp_70_symbol : Boolean;
      signal cp_73_symbol : Boolean;
      signal cp_77_symbol : Boolean;
      signal cp_82_symbol : Boolean;
      signal cp_87_symbol : Boolean;
      signal cp_88_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition branch_block_stmt_4/$entry
      cp_6_symbol  <=  cp_4_symbol; -- place branch_block_stmt_4/merge_stmt_5__entry__ (optimized away) 
      cp_7_symbol  <=  cp_88_symbol; -- place branch_block_stmt_4/merge_stmt_5__exit__ (optimized away) 
      cp_8_symbol  <=  cp_7_symbol or cp_7_symbol; -- place branch_block_stmt_4/assign_stmt_19__entry__ (optimized away) 
      cp_9_symbol  <=  cp_14_symbol; -- place branch_block_stmt_4/assign_stmt_19__exit__ (optimized away) 
      cp_10_symbol  <=  cp_9_symbol or cp_9_symbol; -- place branch_block_stmt_4/assign_stmt_24__entry__ (optimized away) 
      cp_11_symbol  <=  cp_27_symbol; -- place branch_block_stmt_4/assign_stmt_24__exit__ (optimized away) 
      cp_12_symbol  <=  cp_11_symbol or cp_11_symbol; -- place branch_block_stmt_4/switch_stmt_25__entry__ (optimized away) 
      cp_13_symbol  <=  cp_69_symbol; -- place branch_block_stmt_4/switch_stmt_25__exit__ (optimized away) 
      cp_14: Block -- branch_block_stmt_4/assign_stmt_19 
        signal cp_14_start: Boolean;
        signal cp_15_symbol: Boolean;
        signal cp_16_symbol: Boolean;
        signal cp_17_symbol : Boolean;
        -- 
      begin -- 
        cp_14_start <= cp_8_symbol; -- control passed to block
        cp_15_symbol  <= cp_14_start; -- transition branch_block_stmt_4/assign_stmt_19/$entry
        cp_17: Block -- branch_block_stmt_4/assign_stmt_19/binary_18 
          signal cp_17_start: Boolean;
          signal cp_18_symbol: Boolean;
          signal cp_19_symbol: Boolean;
          signal cp_20_symbol : Boolean;
          signal cp_23_symbol : Boolean;
          signal cp_24_symbol : Boolean;
          signal cp_25_symbol : Boolean;
          signal cp_26_symbol : Boolean;
          -- 
        begin -- 
          cp_17_start <= cp_15_symbol; -- control passed to block
          cp_18_symbol  <= cp_17_start; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/$entry
          cp_20: Block -- branch_block_stmt_4/assign_stmt_19/binary_18/binary_18_inputs 
            signal cp_20_start: Boolean;
            signal cp_21_symbol: Boolean;
            signal cp_22_symbol: Boolean;
            -- 
          begin -- 
            cp_20_start <= cp_18_symbol; -- control passed to block
            cp_21_symbol  <= cp_20_start; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/binary_18_inputs/$entry
            cp_22_symbol <= cp_21_symbol; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/binary_18_inputs/$exit
            cp_20_symbol <= cp_22_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_4/assign_stmt_19/binary_18/binary_18_inputs
          cp_23_symbol <= cp_20_symbol; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/rr
          branch_block_stmt_4Xassign_stmt_19Xbinary_18Xrr_cp_to_dp <= cp_23_symbol; -- link to DP
          cp_24_symbol <= branch_block_stmt_4Xassign_stmt_19Xbinary_18Xra_dp_to_cp; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/ra
          cp_25_symbol <= cp_24_symbol; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/cr
          branch_block_stmt_4Xassign_stmt_19Xbinary_18Xcr_cp_to_dp <= cp_25_symbol; -- link to DP
          cp_26_symbol <= branch_block_stmt_4Xassign_stmt_19Xbinary_18Xca_dp_to_cp; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/ca
          cp_19_symbol <= cp_26_symbol; -- transition branch_block_stmt_4/assign_stmt_19/binary_18/$exit
          cp_17_symbol <= cp_19_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_4/assign_stmt_19/binary_18
        cp_16_symbol <= cp_17_symbol; -- transition branch_block_stmt_4/assign_stmt_19/$exit
        cp_14_symbol <= cp_16_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/assign_stmt_19
      cp_27: Block -- branch_block_stmt_4/assign_stmt_24 
        signal cp_27_start: Boolean;
        signal cp_28_symbol: Boolean;
        signal cp_29_symbol: Boolean;
        signal cp_30_symbol : Boolean;
        -- 
      begin -- 
        cp_27_start <= cp_10_symbol; -- control passed to block
        cp_28_symbol  <= cp_27_start; -- transition branch_block_stmt_4/assign_stmt_24/$entry
        cp_30: Block -- branch_block_stmt_4/assign_stmt_24/binary_23 
          signal cp_30_start: Boolean;
          signal cp_31_symbol: Boolean;
          signal cp_32_symbol: Boolean;
          signal cp_33_symbol : Boolean;
          signal cp_36_symbol : Boolean;
          signal cp_37_symbol : Boolean;
          signal cp_38_symbol : Boolean;
          signal cp_39_symbol : Boolean;
          -- 
        begin -- 
          cp_30_start <= cp_28_symbol; -- control passed to block
          cp_31_symbol  <= cp_30_start; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/$entry
          cp_33: Block -- branch_block_stmt_4/assign_stmt_24/binary_23/binary_23_inputs 
            signal cp_33_start: Boolean;
            signal cp_34_symbol: Boolean;
            signal cp_35_symbol: Boolean;
            -- 
          begin -- 
            cp_33_start <= cp_31_symbol; -- control passed to block
            cp_34_symbol  <= cp_33_start; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/binary_23_inputs/$entry
            cp_35_symbol <= cp_34_symbol; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/binary_23_inputs/$exit
            cp_33_symbol <= cp_35_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_4/assign_stmt_24/binary_23/binary_23_inputs
          cp_36_symbol <= cp_33_symbol; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/rr
          branch_block_stmt_4Xassign_stmt_24Xbinary_23Xrr_cp_to_dp <= cp_36_symbol; -- link to DP
          cp_37_symbol <= branch_block_stmt_4Xassign_stmt_24Xbinary_23Xra_dp_to_cp; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/ra
          cp_38_symbol <= cp_37_symbol; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/cr
          branch_block_stmt_4Xassign_stmt_24Xbinary_23Xcr_cp_to_dp <= cp_38_symbol; -- link to DP
          cp_39_symbol <= branch_block_stmt_4Xassign_stmt_24Xbinary_23Xca_dp_to_cp; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/ca
          cp_32_symbol <= cp_39_symbol; -- transition branch_block_stmt_4/assign_stmt_24/binary_23/$exit
          cp_30_symbol <= cp_32_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_4/assign_stmt_24/binary_23
        cp_29_symbol <= cp_30_symbol; -- transition branch_block_stmt_4/assign_stmt_24/$exit
        cp_27_symbol <= cp_29_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/assign_stmt_24
      cp_40: Block -- branch_block_stmt_4/binary_28 
        signal cp_40_start: Boolean;
        signal cp_41_symbol: Boolean;
        signal cp_42_symbol: Boolean;
        signal cp_43_symbol : Boolean;
        signal cp_46_symbol : Boolean;
        signal cp_47_symbol : Boolean;
        signal cp_48_symbol : Boolean;
        signal cp_49_symbol : Boolean;
        -- 
      begin -- 
        cp_40_start <= cp_12_symbol; -- control passed to block
        cp_41_symbol  <= cp_40_start; -- transition branch_block_stmt_4/binary_28/$entry
        cp_43: Block -- branch_block_stmt_4/binary_28/binary_28_inputs 
          signal cp_43_start: Boolean;
          signal cp_44_symbol: Boolean;
          signal cp_45_symbol: Boolean;
          -- 
        begin -- 
          cp_43_start <= cp_41_symbol; -- control passed to block
          cp_44_symbol  <= cp_43_start; -- transition branch_block_stmt_4/binary_28/binary_28_inputs/$entry
          cp_45_symbol <= cp_44_symbol; -- transition branch_block_stmt_4/binary_28/binary_28_inputs/$exit
          cp_43_symbol <= cp_45_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_4/binary_28/binary_28_inputs
        cp_46_symbol <= cp_43_symbol; -- transition branch_block_stmt_4/binary_28/rr
        branch_block_stmt_4Xbinary_28Xrr_cp_to_dp <= cp_46_symbol; -- link to DP
        cp_47_symbol <= branch_block_stmt_4Xbinary_28Xra_dp_to_cp; -- transition branch_block_stmt_4/binary_28/ra
        cp_48_symbol <= cp_47_symbol; -- transition branch_block_stmt_4/binary_28/cr
        branch_block_stmt_4Xbinary_28Xcr_cp_to_dp <= cp_48_symbol; -- link to DP
        cp_49_symbol <= branch_block_stmt_4Xbinary_28Xca_dp_to_cp; -- transition branch_block_stmt_4/binary_28/ca
        cp_42_symbol <= cp_49_symbol; -- transition branch_block_stmt_4/binary_28/$exit
        cp_40_symbol <= cp_42_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/binary_28
      cp_50_symbol  <=  cp_40_symbol; -- place branch_block_stmt_4/switch_stmt_25__condition_check_place__ (optimized away) 
      cp_51: Block -- branch_block_stmt_4/switch_stmt_25__condition_check__ 
        signal cp_51_start: Boolean;
        signal cp_52_symbol: Boolean;
        signal cp_53_symbol: Boolean;
        signal cp_54_symbol : Boolean;
        -- 
      begin -- 
        cp_51_start <= cp_50_symbol; -- control passed to block
        cp_52_symbol  <= cp_51_start; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/$entry
        cp_54: Block -- branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0 
          signal cp_54_start: Boolean;
          signal cp_55_symbol: Boolean;
          signal cp_56_symbol: Boolean;
          signal cp_57_symbol : Boolean;
          signal cp_58_symbol : Boolean;
          signal cp_59_symbol : Boolean;
          signal cp_60_symbol : Boolean;
          signal cp_61_symbol : Boolean;
          -- 
        begin -- 
          cp_54_start <= cp_52_symbol; -- control passed to block
          cp_55_symbol  <= cp_54_start; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/$entry
          cp_57_symbol <= cp_55_symbol; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/rr
          branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xrr_cp_to_dp <= cp_57_symbol; -- link to DP
          cp_58_symbol <= branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xra_dp_to_cp; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/ra
          cp_59_symbol <= cp_58_symbol; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/cr
          branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xcr_cp_to_dp <= cp_59_symbol; -- link to DP
          cp_60_symbol <= branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xca_dp_to_cp; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/ca
          cp_61_symbol <= cp_60_symbol; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/cmp
          branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xcmp_cp_to_dp <= cp_61_symbol; -- link to DP
          cp_56_symbol <= cp_61_symbol; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0/$exit
          cp_54_symbol <= cp_56_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_4/switch_stmt_25__condition_check__/condition_0
        cp_53_symbol <= cp_54_symbol; -- transition branch_block_stmt_4/switch_stmt_25__condition_check__/$exit
        branch_block_stmt_4Xswitch_stmt_25__condition_check__XXexit_cp_to_dp <= cp_53_symbol; -- link to DP
        cp_51_symbol <= cp_53_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/switch_stmt_25__condition_check__
      cp_62_symbol  <=  cp_51_symbol; -- place branch_block_stmt_4/switch_stmt_25__select__ (optimized away) 
      cp_63_symbol  <=  cp_64_symbol; -- place branch_block_stmt_4/loopback (optimized away) 
      cp_64: Block -- branch_block_stmt_4/choice_0 
        signal cp_64_start: Boolean;
        signal cp_65_symbol: Boolean;
        signal cp_66_symbol: Boolean;
        signal cp_67_symbol : Boolean;
        -- 
      begin -- 
        cp_64_start <= cp_62_symbol; -- control passed to block
        cp_65_symbol  <= cp_64_start; -- transition branch_block_stmt_4/choice_0/$entry
        cp_67_symbol <= branch_block_stmt_4Xchoice_0Xack1_dp_to_cp; -- transition branch_block_stmt_4/choice_0/ack1
        cp_66_symbol <= cp_67_symbol; -- transition branch_block_stmt_4/choice_0/$exit
        cp_64_symbol <= cp_66_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/choice_0
      cp_68_symbol  <=  cp_73_symbol; -- place branch_block_stmt_4/stmt_33__entry__ (optimized away) 
      cp_69_symbol  <=  cp_70_symbol; -- place branch_block_stmt_4/stmt_33__exit__ (optimized away) 
      cp_70: Block -- branch_block_stmt_4/stmt_33 
        signal cp_70_start: Boolean;
        signal cp_71_symbol: Boolean;
        signal cp_72_symbol: Boolean;
        -- 
      begin -- 
        cp_70_start <= cp_68_symbol; -- control passed to block
        cp_71_symbol  <= cp_70_start; -- transition branch_block_stmt_4/stmt_33/$entry
        cp_72_symbol <= cp_71_symbol; -- transition branch_block_stmt_4/stmt_33/$exit
        cp_70_symbol <= cp_72_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/stmt_33
      cp_73: Block -- branch_block_stmt_4/choice_default 
        signal cp_73_start: Boolean;
        signal cp_74_symbol: Boolean;
        signal cp_75_symbol: Boolean;
        signal cp_76_symbol : Boolean;
        -- 
      begin -- 
        cp_73_start <= cp_62_symbol; -- control passed to block
        cp_74_symbol  <= cp_73_start; -- transition branch_block_stmt_4/choice_default/$entry
        cp_76_symbol <= branch_block_stmt_4Xchoice_defaultXack0_dp_to_cp; -- transition branch_block_stmt_4/choice_default/ack0
        cp_75_symbol <= cp_76_symbol; -- transition branch_block_stmt_4/choice_default/$exit
        cp_73_symbol <= cp_75_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/choice_default
      cp_77: Block -- branch_block_stmt_4/merge_stmt_5__entry___PhiReq 
        signal cp_77_start: Boolean;
        signal cp_78_symbol: Boolean;
        signal cp_79_symbol: Boolean;
        signal cp_80_symbol : Boolean;
        signal cp_81_symbol : Boolean;
        -- 
      begin -- 
        cp_77_start <= cp_6_symbol; -- control passed to block
        cp_78_symbol  <= cp_77_start; -- transition branch_block_stmt_4/merge_stmt_5__entry___PhiReq/$entry
        cp_80_symbol <= cp_78_symbol; -- transition branch_block_stmt_4/merge_stmt_5__entry___PhiReq/phi_stmt_6_req
        branch_block_stmt_4Xmerge_stmt_5__entry___PhiReqXphi_stmt_6_req_cp_to_dp <= cp_80_symbol; -- link to DP
        cp_81_symbol <= cp_78_symbol; -- transition branch_block_stmt_4/merge_stmt_5__entry___PhiReq/phi_stmt_10_req
        branch_block_stmt_4Xmerge_stmt_5__entry___PhiReqXphi_stmt_10_req_cp_to_dp <= cp_81_symbol; -- link to DP
        cp_79_block : Block -- non-trivial join transition branch_block_stmt_4/merge_stmt_5__entry___PhiReq/$exit 
          signal cp_79_predecessors: BooleanArray(1 downto 0);
          signal cp_79_p0_pred: BooleanArray(0 downto 0);
          signal cp_79_p0_succ: BooleanArray(0 downto 0);
          signal cp_79_p1_pred: BooleanArray(0 downto 0);
          signal cp_79_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          cp_79_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_79_p0_pred, cp_79_p0_succ, cp_79_predecessors(0), clk, reset-- 
            ); -- 
          cp_79_p0_succ(0) <=  cp_79_symbol;
          cp_79_p0_pred(0) <=  cp_80_symbol;
          cp_79_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_79_p1_pred, cp_79_p1_succ, cp_79_predecessors(1), clk, reset-- 
            ); -- 
          cp_79_p1_succ(0) <=  cp_79_symbol;
          cp_79_p1_pred(0) <=  cp_81_symbol;
          cp_79_symbol <= AndReduce(cp_79_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_4/merge_stmt_5__entry___PhiReq/$exit
        cp_77_symbol <= cp_79_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/merge_stmt_5__entry___PhiReq
      cp_82: Block -- branch_block_stmt_4/loopback_PhiReq 
        signal cp_82_start: Boolean;
        signal cp_83_symbol: Boolean;
        signal cp_84_symbol: Boolean;
        signal cp_85_symbol : Boolean;
        signal cp_86_symbol : Boolean;
        -- 
      begin -- 
        cp_82_start <= cp_63_symbol; -- control passed to block
        cp_83_symbol  <= cp_82_start; -- transition branch_block_stmt_4/loopback_PhiReq/$entry
        cp_85_symbol <= cp_83_symbol; -- transition branch_block_stmt_4/loopback_PhiReq/phi_stmt_6_req
        branch_block_stmt_4Xloopback_PhiReqXphi_stmt_6_req_cp_to_dp <= cp_85_symbol; -- link to DP
        cp_86_symbol <= cp_83_symbol; -- transition branch_block_stmt_4/loopback_PhiReq/phi_stmt_10_req
        branch_block_stmt_4Xloopback_PhiReqXphi_stmt_10_req_cp_to_dp <= cp_86_symbol; -- link to DP
        cp_84_block : Block -- non-trivial join transition branch_block_stmt_4/loopback_PhiReq/$exit 
          signal cp_84_predecessors: BooleanArray(1 downto 0);
          signal cp_84_p0_pred: BooleanArray(0 downto 0);
          signal cp_84_p0_succ: BooleanArray(0 downto 0);
          signal cp_84_p1_pred: BooleanArray(0 downto 0);
          signal cp_84_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          cp_84_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_84_p0_pred, cp_84_p0_succ, cp_84_predecessors(0), clk, reset-- 
            ); -- 
          cp_84_p0_succ(0) <=  cp_84_symbol;
          cp_84_p0_pred(0) <=  cp_85_symbol;
          cp_84_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_84_p1_pred, cp_84_p1_succ, cp_84_predecessors(1), clk, reset-- 
            ); -- 
          cp_84_p1_succ(0) <=  cp_84_symbol;
          cp_84_p1_pred(0) <=  cp_86_symbol;
          cp_84_symbol <= AndReduce(cp_84_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_4/loopback_PhiReq/$exit
        cp_82_symbol <= cp_84_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/loopback_PhiReq
      cp_87_symbol  <=  cp_77_symbol or cp_82_symbol; -- place branch_block_stmt_4/merge_stmt_5_PhiReqMerge (optimized away) 
      cp_88: Block -- branch_block_stmt_4/merge_stmt_5_PhiAck 
        signal cp_88_start: Boolean;
        signal cp_89_symbol: Boolean;
        signal cp_90_symbol: Boolean;
        signal cp_91_symbol : Boolean;
        signal cp_92_symbol : Boolean;
        -- 
      begin -- 
        cp_88_start <= cp_87_symbol; -- control passed to block
        cp_89_symbol  <= cp_88_start; -- transition branch_block_stmt_4/merge_stmt_5_PhiAck/$entry
        cp_91_symbol <= branch_block_stmt_4Xmerge_stmt_5_PhiAckXphi_stmt_6_ack_dp_to_cp; -- transition branch_block_stmt_4/merge_stmt_5_PhiAck/phi_stmt_6_ack
        cp_92_symbol <= branch_block_stmt_4Xmerge_stmt_5_PhiAckXphi_stmt_10_ack_dp_to_cp; -- transition branch_block_stmt_4/merge_stmt_5_PhiAck/phi_stmt_10_ack
        cp_90_block : Block -- non-trivial join transition branch_block_stmt_4/merge_stmt_5_PhiAck/$exit 
          signal cp_90_predecessors: BooleanArray(1 downto 0);
          signal cp_90_p0_pred: BooleanArray(0 downto 0);
          signal cp_90_p0_succ: BooleanArray(0 downto 0);
          signal cp_90_p1_pred: BooleanArray(0 downto 0);
          signal cp_90_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          cp_90_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_90_p0_pred, cp_90_p0_succ, cp_90_predecessors(0), clk, reset-- 
            ); -- 
          cp_90_p0_succ(0) <=  cp_90_symbol;
          cp_90_p0_pred(0) <=  cp_91_symbol;
          cp_90_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_90_p1_pred, cp_90_p1_succ, cp_90_predecessors(1), clk, reset-- 
            ); -- 
          cp_90_p1_succ(0) <=  cp_90_symbol;
          cp_90_p1_pred(0) <=  cp_92_symbol;
          cp_90_symbol <= AndReduce(cp_90_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_4/merge_stmt_5_PhiAck/$exit
        cp_88_symbol <= cp_90_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_4/merge_stmt_5_PhiAck
      cp_5_symbol <= cp_13_symbol; -- transition branch_block_stmt_4/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- branch_block_stmt_4
    cp_93: Block -- assign_stmt_38 
      signal cp_93_start: Boolean;
      signal cp_94_symbol: Boolean;
      signal cp_95_symbol: Boolean;
      signal cp_96_symbol : Boolean;
      signal cp_97_symbol : Boolean;
      -- 
    begin -- 
      cp_93_start <= cp_3_symbol; -- control passed to block
      cp_94_symbol  <= cp_93_start; -- transition assign_stmt_38/$entry
      cp_96_symbol <= cp_94_symbol; -- transition assign_stmt_38/req
      assign_stmt_38Xreq_cp_to_dp <= cp_96_symbol; -- link to DP
      cp_97_symbol <= assign_stmt_38Xack_dp_to_cp; -- transition assign_stmt_38/ack
      cp_95_symbol <= cp_97_symbol; -- transition assign_stmt_38/$exit
      cp_93_symbol <= cp_95_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_38
    cp_2_symbol <= cp_93_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal binary_28_wire : std_logic_vector(0 downto 0);
    signal expr_12_wire_constant : std_logic_vector(9 downto 0);
    signal expr_17_wire_constant : std_logic_vector(9 downto 0);
    signal expr_22_wire_constant : std_logic_vector(9 downto 0);
    signal expr_27_wire_constant : std_logic_vector(9 downto 0);
    signal expr_30_wire_constant : std_logic_vector(0 downto 0);
    signal expr_30_wire_constant_cmp : std_logic_vector(0 downto 0);
    signal loop_counter_6 : std_logic_vector(9 downto 0);
    signal new_loop_counter_19 : std_logic_vector(9 downto 0);
    signal t_24 : std_logic_vector(9 downto 0);
    signal temp_t_10 : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    expr_12_wire_constant <= "0000000000";
    expr_17_wire_constant <= "0000000001";
    expr_22_wire_constant <= "0000000001";
    expr_27_wire_constant <= "0000000000";
    expr_30_wire_constant <= "0";
    phi_stmt_10: Block; -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= expr_12_wire_constant & t_24;
      req <= branch_block_stmt_4Xmerge_stmt_5__entry___PhiReqXphi_stmt_10_req_cp_to_dp & branch_block_stmt_4Xloopback_PhiReqXphi_stmt_10_req_cp_to_dp;
      phi: PhiBase port map(req => req, ack => branch_block_stmt_4Xmerge_stmt_5_PhiAckXphi_stmt_10_ack_dp_to_cp,idata = > idata, odata => temp_t_10, clk => clk, reset => reset);
      -- 
    end Block; -- phi operator phi_stmt_10
    phi_stmt_6: Block; -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= a & new_loop_counter_19;
      req <= branch_block_stmt_4Xmerge_stmt_5__entry___PhiReqXphi_stmt_6_req_cp_to_dp & branch_block_stmt_4Xloopback_PhiReqXphi_stmt_6_req_cp_to_dp;
      phi: PhiBase port map(req => req, ack => branch_block_stmt_4Xmerge_stmt_5_PhiAckXphi_stmt_6_ack_dp_to_cp,idata = > idata, odata => loop_counter_6, clk => clk, reset => reset);
      -- 
    end Block; -- phi operator phi_stmt_6
    simple_obj_ref_36_inst: RegisterBase generic map(data_width => 10) -- 
      port map( din => t_24, dout => b, req => assign_stmt_38Xreq_cp_to_dp, ack => assign_stmt_38Xack_dp_to_cp, clk => clk, reset => reset); -- 
    switch_stmt_25_branch_0: BranchBase  port map( -- 
      condition => expr_30_wire_constant_cmp,
      req => branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xcmp_cp_to_dp,
      ack0 => $openack1 => branch_block_stmt_4Xchoice_0Xack1_dp_to_cp,
      clk => clk,
      reset => reset); -- 
    switch_stmt_25_branch_default_: BranchBase  port map( -- 
      condition => expr_30_wire_constant_cmp,
      req => branch_block_stmt_4Xswitch_stmt_25__condition_check__XXexit_cp_to_dp,
      ack0 => branch_block_stmt_4Xchoice_defaultXack0_dp_to_cpack1 => $open,
      clk => clk,
      reset => reset); -- 
    -- shared split operator group (0) : binary_18_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= branch_block_stmt_4Xassign_stmt_19Xbinary_18Xrr_cp_to_dp;
      branch_block_stmt_4Xassign_stmt_19Xbinary_18Xra_dp_to_cp <= ackL(0);
      reqR(0) <= branch_block_stmt_4Xassign_stmt_19Xbinary_18Xcr_cp_to_dp;
      branch_block_stmt_4Xassign_stmt_19Xbinary_18Xca_dp_to_cp <= ackR(0);
      data_in <= expr_17_wire_constant;
      new_loop_counter_19 <= data_out(9 downto 0);
      SplitOperator: SplitOperatorShared -- 
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
          use_constant  => true,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_23_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= branch_block_stmt_4Xassign_stmt_24Xbinary_23Xrr_cp_to_dp;
      branch_block_stmt_4Xassign_stmt_24Xbinary_23Xra_dp_to_cp <= ackL(0);
      reqR(0) <= branch_block_stmt_4Xassign_stmt_24Xbinary_23Xcr_cp_to_dp;
      branch_block_stmt_4Xassign_stmt_24Xbinary_23Xca_dp_to_cp <= ackR(0);
      data_in <= expr_22_wire_constant;
      t_24 <= data_out(9 downto 0);
      SplitOperator: SplitOperatorShared -- 
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
          use_constant  => true,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_28_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= branch_block_stmt_4Xbinary_28Xrr_cp_to_dp;
      branch_block_stmt_4Xbinary_28Xra_dp_to_cp <= ackL(0);
      reqR(0) <= branch_block_stmt_4Xbinary_28Xcr_cp_to_dp;
      branch_block_stmt_4Xbinary_28Xca_dp_to_cp <= ackR(0);
      data_in <= expr_27_wire_constant;
      binary_28_wire <= data_out(0 downto 0);
      SplitOperator: SplitOperatorShared -- 
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
          constant_operand => "0000000000",
          use_constant  => true,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 2
    -- shared split operator group (3) : switch_stmt_25_select_expr_0 
    SplitOperatorGroup3: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xrr_cp_to_dp;
      branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xra_dp_to_cp <= ackL(0);
      reqR(0) <= branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xcr_cp_to_dp;
      branch_block_stmt_4Xswitch_stmt_25__condition_check__Xcondition_0Xca_dp_to_cp <= ackR(0);
      data_in <= expr_30_wire_constant;
      expr_30_wire_constant_cmp <= data_out(0 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => true,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 3
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
    reset : in std_logic); -- 
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
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
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
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal sum_mod_a :  std_logic_vector(9 downto 0);
  signal sum_mod_b :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0) := (others => '0');
  signal sum_mod_tag_out: std_logic_vector(0 downto 0) := (others => '0');
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= (1 => '1', 0 => '1', others => '0');
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
      reset => reset); -- 
  -- 
end Default;
