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
    b : in  std_logic_vector(9 downto 0);
    c : in  std_logic_vector(9 downto 0);
    d : in  std_logic_vector(9 downto 0);
    result : out  std_logic_vector(9 downto 0);
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
  signal fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xrr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xra_dp_to_cp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xcr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xrr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xra_dp_to_cp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xcr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xca_dp_to_cp : boolean;
  signal fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xca_dp_to_cp : boolean;
  signal fork_block_stmt_7Xassign_stmt_32Xbinary_31Xrr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xassign_stmt_32Xbinary_31Xra_dp_to_cp : boolean;
  signal fork_block_stmt_7Xassign_stmt_32Xbinary_31Xcr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xassign_stmt_32Xbinary_31Xca_dp_to_cp : boolean;
  signal assign_stmt_39Xbinary_38Xrr_cp_to_dp : boolean;
  signal assign_stmt_39Xbinary_38Xra_dp_to_cp : boolean;
  signal assign_stmt_39Xbinary_38Xcr_cp_to_dp : boolean;
  signal assign_stmt_39Xbinary_38Xca_dp_to_cp : boolean;
  signal fork_block_stmt_7Xassign_stmt_27Xbinary_26Xrr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xassign_stmt_27Xbinary_26Xra_dp_to_cp : boolean;
  signal fork_block_stmt_7Xassign_stmt_27Xbinary_26Xcr_cp_to_dp : boolean;
  signal fork_block_stmt_7Xassign_stmt_27Xbinary_26Xca_dp_to_cp : boolean;
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
    signal cp_65_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- fork_block_stmt_7 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      signal cp_22_symbol : Boolean;
      signal cp_38_symbol : Boolean;
      signal cp_51_symbol : Boolean;
      signal cp_64_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition fork_block_stmt_7/$entry
      cp_6: Block -- fork_block_stmt_7/series_block_stmt_8 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition fork_block_stmt_7/series_block_stmt_8/$entry
        cp_9: Block -- fork_block_stmt_7/series_block_stmt_8/assign_stmt_13 
          signal cp_9_start: Boolean;
          signal cp_10_symbol: Boolean;
          signal cp_11_symbol: Boolean;
          signal cp_12_symbol : Boolean;
          -- 
        begin -- 
          cp_9_start <= cp_7_symbol; -- control passed to block
          cp_10_symbol  <= cp_9_start; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/$entry
          cp_12: Block -- fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12 
            signal cp_12_start: Boolean;
            signal cp_13_symbol: Boolean;
            signal cp_14_symbol: Boolean;
            signal cp_15_symbol : Boolean;
            signal cp_18_symbol : Boolean;
            signal cp_19_symbol : Boolean;
            signal cp_20_symbol : Boolean;
            signal cp_21_symbol : Boolean;
            -- 
          begin -- 
            cp_12_start <= cp_10_symbol; -- control passed to block
            cp_13_symbol  <= cp_12_start; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/$entry
            cp_15: Block -- fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/binary_12_inputs 
              signal cp_15_start: Boolean;
              signal cp_16_symbol: Boolean;
              signal cp_17_symbol: Boolean;
              -- 
            begin -- 
              cp_15_start <= cp_13_symbol; -- control passed to block
              cp_16_symbol  <= cp_15_start; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/binary_12_inputs/$entry
              cp_17_symbol <= cp_16_symbol; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/binary_12_inputs/$exit
              cp_15_symbol <= cp_17_symbol; -- control passed from block 
              -- 
            end Block; -- fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/binary_12_inputs
            cp_18_symbol <= cp_15_symbol; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/rr
            fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xrr_cp_to_dp <= cp_18_symbol; -- link to DP
            cp_19_symbol <= fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xra_dp_to_cp; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/ra
            cp_20_symbol <= cp_19_symbol; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/cr
            fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xcr_cp_to_dp <= cp_20_symbol; -- link to DP
            cp_21_symbol <= fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xca_dp_to_cp; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/ca
            cp_14_symbol <= cp_21_symbol; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12/$exit
            cp_12_symbol <= cp_14_symbol; -- control passed from block 
            -- 
          end Block; -- fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/binary_12
          cp_11_symbol <= cp_12_symbol; -- transition fork_block_stmt_7/series_block_stmt_8/assign_stmt_13/$exit
          cp_9_symbol <= cp_11_symbol; -- control passed from block 
          -- 
        end Block; -- fork_block_stmt_7/series_block_stmt_8/assign_stmt_13
        cp_8_symbol <= cp_9_symbol; -- transition fork_block_stmt_7/series_block_stmt_8/$exit
        cp_6_symbol <= cp_8_symbol; -- control passed from block 
        -- 
      end Block; -- fork_block_stmt_7/series_block_stmt_8
      cp_22: Block -- fork_block_stmt_7/series_block_stmt_15 
        signal cp_22_start: Boolean;
        signal cp_23_symbol: Boolean;
        signal cp_24_symbol: Boolean;
        signal cp_25_symbol : Boolean;
        -- 
      begin -- 
        cp_22_start <= cp_4_symbol; -- control passed to block
        cp_23_symbol  <= cp_22_start; -- transition fork_block_stmt_7/series_block_stmt_15/$entry
        cp_25: Block -- fork_block_stmt_7/series_block_stmt_15/assign_stmt_20 
          signal cp_25_start: Boolean;
          signal cp_26_symbol: Boolean;
          signal cp_27_symbol: Boolean;
          signal cp_28_symbol : Boolean;
          -- 
        begin -- 
          cp_25_start <= cp_23_symbol; -- control passed to block
          cp_26_symbol  <= cp_25_start; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/$entry
          cp_28: Block -- fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19 
            signal cp_28_start: Boolean;
            signal cp_29_symbol: Boolean;
            signal cp_30_symbol: Boolean;
            signal cp_31_symbol : Boolean;
            signal cp_34_symbol : Boolean;
            signal cp_35_symbol : Boolean;
            signal cp_36_symbol : Boolean;
            signal cp_37_symbol : Boolean;
            -- 
          begin -- 
            cp_28_start <= cp_26_symbol; -- control passed to block
            cp_29_symbol  <= cp_28_start; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/$entry
            cp_31: Block -- fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/binary_19_inputs 
              signal cp_31_start: Boolean;
              signal cp_32_symbol: Boolean;
              signal cp_33_symbol: Boolean;
              -- 
            begin -- 
              cp_31_start <= cp_29_symbol; -- control passed to block
              cp_32_symbol  <= cp_31_start; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/binary_19_inputs/$entry
              cp_33_symbol <= cp_32_symbol; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/binary_19_inputs/$exit
              cp_31_symbol <= cp_33_symbol; -- control passed from block 
              -- 
            end Block; -- fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/binary_19_inputs
            cp_34_symbol <= cp_31_symbol; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/rr
            fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xrr_cp_to_dp <= cp_34_symbol; -- link to DP
            cp_35_symbol <= fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xra_dp_to_cp; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/ra
            cp_36_symbol <= cp_35_symbol; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/cr
            fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xcr_cp_to_dp <= cp_36_symbol; -- link to DP
            cp_37_symbol <= fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xca_dp_to_cp; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/ca
            cp_30_symbol <= cp_37_symbol; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19/$exit
            cp_28_symbol <= cp_30_symbol; -- control passed from block 
            -- 
          end Block; -- fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/binary_19
          cp_27_symbol <= cp_28_symbol; -- transition fork_block_stmt_7/series_block_stmt_15/assign_stmt_20/$exit
          cp_25_symbol <= cp_27_symbol; -- control passed from block 
          -- 
        end Block; -- fork_block_stmt_7/series_block_stmt_15/assign_stmt_20
        cp_24_symbol <= cp_25_symbol; -- transition fork_block_stmt_7/series_block_stmt_15/$exit
        cp_22_symbol <= cp_24_symbol; -- control passed from block 
        -- 
      end Block; -- fork_block_stmt_7/series_block_stmt_15
      cp_38: Block -- fork_block_stmt_7/assign_stmt_27 
        signal cp_38_start: Boolean;
        signal cp_39_symbol: Boolean;
        signal cp_40_symbol: Boolean;
        signal cp_41_symbol : Boolean;
        -- 
      begin -- 
        cp_38_start <= cp_64_symbol; -- control passed to block
        cp_39_symbol  <= cp_38_start; -- transition fork_block_stmt_7/assign_stmt_27/$entry
        cp_41: Block -- fork_block_stmt_7/assign_stmt_27/binary_26 
          signal cp_41_start: Boolean;
          signal cp_42_symbol: Boolean;
          signal cp_43_symbol: Boolean;
          signal cp_44_symbol : Boolean;
          signal cp_47_symbol : Boolean;
          signal cp_48_symbol : Boolean;
          signal cp_49_symbol : Boolean;
          signal cp_50_symbol : Boolean;
          -- 
        begin -- 
          cp_41_start <= cp_39_symbol; -- control passed to block
          cp_42_symbol  <= cp_41_start; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/$entry
          cp_44: Block -- fork_block_stmt_7/assign_stmt_27/binary_26/binary_26_inputs 
            signal cp_44_start: Boolean;
            signal cp_45_symbol: Boolean;
            signal cp_46_symbol: Boolean;
            -- 
          begin -- 
            cp_44_start <= cp_42_symbol; -- control passed to block
            cp_45_symbol  <= cp_44_start; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/binary_26_inputs/$entry
            cp_46_symbol <= cp_45_symbol; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/binary_26_inputs/$exit
            cp_44_symbol <= cp_46_symbol; -- control passed from block 
            -- 
          end Block; -- fork_block_stmt_7/assign_stmt_27/binary_26/binary_26_inputs
          cp_47_symbol <= cp_44_symbol; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/rr
          fork_block_stmt_7Xassign_stmt_27Xbinary_26Xrr_cp_to_dp <= cp_47_symbol; -- link to DP
          cp_48_symbol <= fork_block_stmt_7Xassign_stmt_27Xbinary_26Xra_dp_to_cp; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/ra
          cp_49_symbol <= cp_48_symbol; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/cr
          fork_block_stmt_7Xassign_stmt_27Xbinary_26Xcr_cp_to_dp <= cp_49_symbol; -- link to DP
          cp_50_symbol <= fork_block_stmt_7Xassign_stmt_27Xbinary_26Xca_dp_to_cp; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/ca
          cp_43_symbol <= cp_50_symbol; -- transition fork_block_stmt_7/assign_stmt_27/binary_26/$exit
          cp_41_symbol <= cp_43_symbol; -- control passed from block 
          -- 
        end Block; -- fork_block_stmt_7/assign_stmt_27/binary_26
        cp_40_symbol <= cp_41_symbol; -- transition fork_block_stmt_7/assign_stmt_27/$exit
        cp_38_symbol <= cp_40_symbol; -- control passed from block 
        -- 
      end Block; -- fork_block_stmt_7/assign_stmt_27
      cp_51: Block -- fork_block_stmt_7/assign_stmt_32 
        signal cp_51_start: Boolean;
        signal cp_52_symbol: Boolean;
        signal cp_53_symbol: Boolean;
        signal cp_54_symbol : Boolean;
        -- 
      begin -- 
        cp_51_start <= cp_64_symbol; -- control passed to block
        cp_52_symbol  <= cp_51_start; -- transition fork_block_stmt_7/assign_stmt_32/$entry
        cp_54: Block -- fork_block_stmt_7/assign_stmt_32/binary_31 
          signal cp_54_start: Boolean;
          signal cp_55_symbol: Boolean;
          signal cp_56_symbol: Boolean;
          signal cp_57_symbol : Boolean;
          signal cp_60_symbol : Boolean;
          signal cp_61_symbol : Boolean;
          signal cp_62_symbol : Boolean;
          signal cp_63_symbol : Boolean;
          -- 
        begin -- 
          cp_54_start <= cp_52_symbol; -- control passed to block
          cp_55_symbol  <= cp_54_start; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/$entry
          cp_57: Block -- fork_block_stmt_7/assign_stmt_32/binary_31/binary_31_inputs 
            signal cp_57_start: Boolean;
            signal cp_58_symbol: Boolean;
            signal cp_59_symbol: Boolean;
            -- 
          begin -- 
            cp_57_start <= cp_55_symbol; -- control passed to block
            cp_58_symbol  <= cp_57_start; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/binary_31_inputs/$entry
            cp_59_symbol <= cp_58_symbol; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/binary_31_inputs/$exit
            cp_57_symbol <= cp_59_symbol; -- control passed from block 
            -- 
          end Block; -- fork_block_stmt_7/assign_stmt_32/binary_31/binary_31_inputs
          cp_60_symbol <= cp_57_symbol; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/rr
          fork_block_stmt_7Xassign_stmt_32Xbinary_31Xrr_cp_to_dp <= cp_60_symbol; -- link to DP
          cp_61_symbol <= fork_block_stmt_7Xassign_stmt_32Xbinary_31Xra_dp_to_cp; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/ra
          cp_62_symbol <= cp_61_symbol; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/cr
          fork_block_stmt_7Xassign_stmt_32Xbinary_31Xcr_cp_to_dp <= cp_62_symbol; -- link to DP
          cp_63_symbol <= fork_block_stmt_7Xassign_stmt_32Xbinary_31Xca_dp_to_cp; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/ca
          cp_56_symbol <= cp_63_symbol; -- transition fork_block_stmt_7/assign_stmt_32/binary_31/$exit
          cp_54_symbol <= cp_56_symbol; -- control passed from block 
          -- 
        end Block; -- fork_block_stmt_7/assign_stmt_32/binary_31
        cp_53_symbol <= cp_54_symbol; -- transition fork_block_stmt_7/assign_stmt_32/$exit
        cp_51_symbol <= cp_53_symbol; -- control passed from block 
        -- 
      end Block; -- fork_block_stmt_7/assign_stmt_32
      cp_64_block : Block -- non-trivial join transition fork_block_stmt_7/join_fork_stmt_22 
        signal cp_64_predecessors: BooleanArray(2 downto 0);
        signal cp_64_p0_pred: BooleanArray(0 downto 0);
        signal cp_64_p0_succ: BooleanArray(0 downto 0);
        signal cp_64_p1_pred: BooleanArray(0 downto 0);
        signal cp_64_p1_succ: BooleanArray(0 downto 0);
        signal cp_64_p2_pred: BooleanArray(0 downto 0);
        signal cp_64_p2_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        cp_64_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_64_p0_pred, cp_64_p0_succ, cp_64_predecessors(0), clk, reset-- 
          ); -- 
        cp_64_p0_succ(0) <=  cp_64_symbol;
        cp_64_p0_pred(0) <=  cp_6_symbol;
        cp_64_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_64_p1_pred, cp_64_p1_succ, cp_64_predecessors(1), clk, reset-- 
          ); -- 
        cp_64_p1_succ(0) <=  cp_64_symbol;
        cp_64_p1_pred(0) <=  cp_22_symbol;
        cp_64_2_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_64_p2_pred, cp_64_p2_succ, cp_64_predecessors(2), clk, reset-- 
          ); -- 
        cp_64_p2_succ(0) <=  cp_64_symbol;
        cp_64_p2_pred(0) <=  cp_4_symbol;
        cp_64_symbol <= AndReduce(cp_64_predecessors); 
        -- 
      end Block; -- non-trivial join transition fork_block_stmt_7/join_fork_stmt_22
      cp_5_block : Block -- non-trivial join transition fork_block_stmt_7/$exit 
        signal cp_5_predecessors: BooleanArray(3 downto 0);
        signal cp_5_p0_pred: BooleanArray(0 downto 0);
        signal cp_5_p0_succ: BooleanArray(0 downto 0);
        signal cp_5_p1_pred: BooleanArray(0 downto 0);
        signal cp_5_p1_succ: BooleanArray(0 downto 0);
        signal cp_5_p2_pred: BooleanArray(0 downto 0);
        signal cp_5_p2_succ: BooleanArray(0 downto 0);
        signal cp_5_p3_pred: BooleanArray(0 downto 0);
        signal cp_5_p3_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        cp_5_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_5_p0_pred, cp_5_p0_succ, cp_5_predecessors(0), clk, reset-- 
          ); -- 
        cp_5_p0_succ(0) <=  cp_5_symbol;
        cp_5_p0_pred(0) <=  cp_4_symbol;
        cp_5_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_5_p1_pred, cp_5_p1_succ, cp_5_predecessors(1), clk, reset-- 
          ); -- 
        cp_5_p1_succ(0) <=  cp_5_symbol;
        cp_5_p1_pred(0) <=  cp_38_symbol;
        cp_5_2_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_5_p2_pred, cp_5_p2_succ, cp_5_predecessors(2), clk, reset-- 
          ); -- 
        cp_5_p2_succ(0) <=  cp_5_symbol;
        cp_5_p2_pred(0) <=  cp_51_symbol;
        cp_5_3_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_5_p3_pred, cp_5_p3_succ, cp_5_predecessors(3), clk, reset-- 
          ); -- 
        cp_5_p3_succ(0) <=  cp_5_symbol;
        cp_5_p3_pred(0) <=  cp_64_symbol;
        cp_5_symbol <= AndReduce(cp_5_predecessors); 
        -- 
      end Block; -- non-trivial join transition fork_block_stmt_7/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- fork_block_stmt_7
    cp_65: Block -- assign_stmt_39 
      signal cp_65_start: Boolean;
      signal cp_66_symbol: Boolean;
      signal cp_67_symbol: Boolean;
      signal cp_68_symbol : Boolean;
      -- 
    begin -- 
      cp_65_start <= cp_3_symbol; -- control passed to block
      cp_66_symbol  <= cp_65_start; -- transition assign_stmt_39/$entry
      cp_68: Block -- assign_stmt_39/binary_38 
        signal cp_68_start: Boolean;
        signal cp_69_symbol: Boolean;
        signal cp_70_symbol: Boolean;
        signal cp_71_symbol : Boolean;
        signal cp_74_symbol : Boolean;
        signal cp_75_symbol : Boolean;
        signal cp_76_symbol : Boolean;
        signal cp_77_symbol : Boolean;
        -- 
      begin -- 
        cp_68_start <= cp_66_symbol; -- control passed to block
        cp_69_symbol  <= cp_68_start; -- transition assign_stmt_39/binary_38/$entry
        cp_71: Block -- assign_stmt_39/binary_38/binary_38_inputs 
          signal cp_71_start: Boolean;
          signal cp_72_symbol: Boolean;
          signal cp_73_symbol: Boolean;
          -- 
        begin -- 
          cp_71_start <= cp_69_symbol; -- control passed to block
          cp_72_symbol  <= cp_71_start; -- transition assign_stmt_39/binary_38/binary_38_inputs/$entry
          cp_73_symbol <= cp_72_symbol; -- transition assign_stmt_39/binary_38/binary_38_inputs/$exit
          cp_71_symbol <= cp_73_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_39/binary_38/binary_38_inputs
        cp_74_symbol <= cp_71_symbol; -- transition assign_stmt_39/binary_38/rr
        assign_stmt_39Xbinary_38Xrr_cp_to_dp <= cp_74_symbol; -- link to DP
        cp_75_symbol <= assign_stmt_39Xbinary_38Xra_dp_to_cp; -- transition assign_stmt_39/binary_38/ra
        cp_76_symbol <= cp_75_symbol; -- transition assign_stmt_39/binary_38/cr
        assign_stmt_39Xbinary_38Xcr_cp_to_dp <= cp_76_symbol; -- link to DP
        cp_77_symbol <= assign_stmt_39Xbinary_38Xca_dp_to_cp; -- transition assign_stmt_39/binary_38/ca
        cp_70_symbol <= cp_77_symbol; -- transition assign_stmt_39/binary_38/$exit
        cp_68_symbol <= cp_70_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_39/binary_38
      cp_67_symbol <= cp_68_symbol; -- transition assign_stmt_39/$exit
      cp_65_symbol <= cp_67_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_39
    cp_2_symbol <= cp_65_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal q_13 : std_logic_vector(9 downto 0);
    signal r_20 : std_logic_vector(9 downto 0);
    signal s_27 : std_logic_vector(9 downto 0);
    signal t_32 : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    -- shared split operator group (0) : binary_12_inst binary_31_inst binary_38_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(59 downto 0);
      signal data_out: std_logic_vector(29 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 2 downto 0);
      -- 
    begin -- 
      reqL(2) <= fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xrr_cp_to_dp;
      reqL(1) <= fork_block_stmt_7Xassign_stmt_32Xbinary_31Xrr_cp_to_dp;
      reqL(0) <= assign_stmt_39Xbinary_38Xrr_cp_to_dp;
      fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xra_dp_to_cp <= ackL(2);
      fork_block_stmt_7Xassign_stmt_32Xbinary_31Xra_dp_to_cp <= ackL(1);
      assign_stmt_39Xbinary_38Xra_dp_to_cp <= ackL(0);
      reqR(2) <= fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xcr_cp_to_dp;
      reqR(1) <= fork_block_stmt_7Xassign_stmt_32Xbinary_31Xcr_cp_to_dp;
      reqR(0) <= assign_stmt_39Xbinary_38Xcr_cp_to_dp;
      fork_block_stmt_7Xseries_block_stmt_8Xassign_stmt_13Xbinary_12Xca_dp_to_cp <= ackR(2);
      fork_block_stmt_7Xassign_stmt_32Xbinary_31Xca_dp_to_cp <= ackR(1);
      assign_stmt_39Xbinary_38Xca_dp_to_cp <= ackR(0);
      data_in <= a & b & q_13 & r_20 & s_27 & t_32;
      q_13 <= data_out(29 downto 20);
      t_32 <= data_out(19 downto 10);
      result <= data_out(9 downto 0);
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
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 3--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_19_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xrr_cp_to_dp;
      fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xra_dp_to_cp <= ackL(0);
      reqR(0) <= fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xcr_cp_to_dp;
      fork_block_stmt_7Xseries_block_stmt_15Xassign_stmt_20Xbinary_19Xca_dp_to_cp <= ackR(0);
      data_in <= c & d;
      r_20 <= data_out(9 downto 0);
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
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_26_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= fork_block_stmt_7Xassign_stmt_27Xbinary_26Xrr_cp_to_dp;
      fork_block_stmt_7Xassign_stmt_27Xbinary_26Xra_dp_to_cp <= ackL(0);
      reqR(0) <= fork_block_stmt_7Xassign_stmt_27Xbinary_26Xcr_cp_to_dp;
      fork_block_stmt_7Xassign_stmt_27Xbinary_26Xca_dp_to_cp <= ackR(0);
      data_in <= q_13 & r_20;
      s_27 <= data_out(9 downto 0);
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
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 2
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
    sum_mod_b : in  std_logic_vector(9 downto 0);
    sum_mod_c : in  std_logic_vector(9 downto 0);
    sum_mod_d : in  std_logic_vector(9 downto 0);
    sum_mod_result : out  std_logic_vector(9 downto 0);
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
      b : in  std_logic_vector(9 downto 0);
      c : in  std_logic_vector(9 downto 0);
      d : in  std_logic_vector(9 downto 0);
      result : out  std_logic_vector(9 downto 0);
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
      c => sum_mod_c,
      d => sum_mod_d,
      result => sum_mod_result,
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
      sum_mod_b : in  std_logic_vector(9 downto 0);
      sum_mod_c : in  std_logic_vector(9 downto 0);
      sum_mod_d : in  std_logic_vector(9 downto 0);
      sum_mod_result : out  std_logic_vector(9 downto 0);
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
  signal sum_mod_b :  std_logic_vector(9 downto 0);
  signal sum_mod_c :  std_logic_vector(9 downto 0);
  signal sum_mod_d :  std_logic_vector(9 downto 0);
  signal sum_mod_result :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= (0 => '1', 1 => '1', others => '0');
  sum_mod_b <= (0 => '0', 1 => '1', others => '0');
  sum_mod_c <= (0 => '1', 1 => '0', others => '0');
  sum_mod_d <= (0 => '0', 1 => '0', others => '0');
  process
  begin
	wait until clk = '1';
	reset <= '0'; 
	sum_mod_start <= '1';
	wait until clk = '1';
	sum_mod_start <= '0';
	while sum_mod_fin /= '0' loop
		wait until clk = '1';
	end loop;
  	wait;
  end process;

  test_system_instance: test_system -- 
    port map ( -- 
      sum_mod_a => sum_mod_a,
      sum_mod_b => sum_mod_b,
      sum_mod_c => sum_mod_c,
      sum_mod_d => sum_mod_d,
      sum_mod_result => sum_mod_result,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
