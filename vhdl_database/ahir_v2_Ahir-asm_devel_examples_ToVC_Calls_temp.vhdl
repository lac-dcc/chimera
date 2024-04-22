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
entity main is -- 
  port ( -- 
    a : in  std_logic_vector(9 downto 0);
    b : in  std_logic_vector(9 downto 0);
    c : out  std_logic_vector(9 downto 0);
    d : out  std_logic_vector(9 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    sum_mod_call_reqs : out  std_logic_vector(2 downto 0);
    sum_mod_call_acks : in   std_logic_vector(2 downto 0);
    sum_mod_call_data : out  std_logic_vector(59 downto 0);
    sum_mod_call_tag  :  out  std_logic_vector(2 downto 0);
    sum_mod_return_reqs : out  std_logic_vector(2 downto 0);
    sum_mod_return_acks : in   std_logic_vector(2 downto 0);
    sum_mod_return_data : in   std_logic_vector(29 downto 0);
    sum_mod_return_tag :  in   std_logic_vector(2 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity main;
architecture Default of main is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xccr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcca_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xccr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcca_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xccr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcca_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xcr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xca_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xcr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xca_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xccr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcca_dp_to_cp : boolean;
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
  cp_16: Block -- control-path 
    signal cp_16_start: Boolean;
    signal cp_17_symbol: Boolean;
    signal cp_18_symbol: Boolean;
    signal cp_19_symbol : Boolean;
    -- 
  begin -- 
    cp_16_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_17_symbol  <= cp_16_start; -- transition $entry
    cp_19: Block -- parallel_block_stmt_16 
      signal cp_19_start: Boolean;
      signal cp_20_symbol: Boolean;
      signal cp_21_symbol: Boolean;
      signal cp_22_symbol : Boolean;
      signal cp_67_symbol : Boolean;
      -- 
    begin -- 
      cp_19_start <= cp_17_symbol; -- control passed to block
      cp_20_symbol  <= cp_19_start; -- transition parallel_block_stmt_16/$entry
      cp_22: Block -- parallel_block_stmt_16/series_block_stmt_17 
        signal cp_22_start: Boolean;
        signal cp_23_symbol: Boolean;
        signal cp_24_symbol: Boolean;
        signal cp_25_symbol : Boolean;
        signal cp_54_symbol : Boolean;
        -- 
      begin -- 
        cp_22_start <= cp_20_symbol; -- control passed to block
        cp_23_symbol  <= cp_22_start; -- transition parallel_block_stmt_16/series_block_stmt_17/$entry
        cp_25: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18 
          signal cp_25_start: Boolean;
          signal cp_26_symbol: Boolean;
          signal cp_27_symbol: Boolean;
          signal cp_28_symbol : Boolean;
          signal cp_41_symbol : Boolean;
          -- 
        begin -- 
          cp_25_start <= cp_23_symbol; -- control passed to block
          cp_26_symbol  <= cp_25_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/$entry
          cp_28: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22 
            signal cp_28_start: Boolean;
            signal cp_29_symbol: Boolean;
            signal cp_30_symbol: Boolean;
            signal cp_31_symbol : Boolean;
            signal cp_34_symbol : Boolean;
            signal cp_35_symbol : Boolean;
            signal cp_36_symbol : Boolean;
            signal cp_37_symbol : Boolean;
            signal cp_38_symbol : Boolean;
            -- 
          begin -- 
            cp_28_start <= cp_26_symbol; -- control passed to block
            cp_29_symbol  <= cp_28_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/$entry
            cp_31: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_ 
              signal cp_31_start: Boolean;
              signal cp_32_symbol: Boolean;
              signal cp_33_symbol: Boolean;
              -- 
            begin -- 
              cp_31_start <= cp_29_symbol; -- control passed to block
              cp_32_symbol  <= cp_31_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_/$entry
              cp_33_symbol <= cp_32_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_/$exit
              cp_31_symbol <= cp_33_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_
            cp_34_symbol <= cp_31_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/crr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcrr_cp_to_dp <= cp_34_symbol; -- link to DP
            cp_35_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/cra
            cp_36_symbol <= cp_35_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/ccr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xccr_cp_to_dp <= cp_36_symbol; -- link to DP
            cp_37_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/cca
            cp_38: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_ 
              signal cp_38_start: Boolean;
              signal cp_39_symbol: Boolean;
              signal cp_40_symbol: Boolean;
              -- 
            begin -- 
              cp_38_start <= cp_37_symbol; -- control passed to block
              cp_39_symbol  <= cp_38_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_/$entry
              cp_40_symbol <= cp_39_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_/$exit
              cp_38_symbol <= cp_40_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_
            cp_30_symbol <= cp_38_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/$exit
            cp_28_symbol <= cp_30_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22
          cp_41: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26 
            signal cp_41_start: Boolean;
            signal cp_42_symbol: Boolean;
            signal cp_43_symbol: Boolean;
            signal cp_44_symbol : Boolean;
            signal cp_47_symbol : Boolean;
            signal cp_48_symbol : Boolean;
            signal cp_49_symbol : Boolean;
            signal cp_50_symbol : Boolean;
            signal cp_51_symbol : Boolean;
            -- 
          begin -- 
            cp_41_start <= cp_26_symbol; -- control passed to block
            cp_42_symbol  <= cp_41_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/$entry
            cp_44: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_ 
              signal cp_44_start: Boolean;
              signal cp_45_symbol: Boolean;
              signal cp_46_symbol: Boolean;
              -- 
            begin -- 
              cp_44_start <= cp_42_symbol; -- control passed to block
              cp_45_symbol  <= cp_44_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_/$entry
              cp_46_symbol <= cp_45_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_/$exit
              cp_44_symbol <= cp_46_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_
            cp_47_symbol <= cp_44_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/crr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcrr_cp_to_dp <= cp_47_symbol; -- link to DP
            cp_48_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/cra
            cp_49_symbol <= cp_48_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/ccr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xccr_cp_to_dp <= cp_49_symbol; -- link to DP
            cp_50_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/cca
            cp_51: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_ 
              signal cp_51_start: Boolean;
              signal cp_52_symbol: Boolean;
              signal cp_53_symbol: Boolean;
              -- 
            begin -- 
              cp_51_start <= cp_50_symbol; -- control passed to block
              cp_52_symbol  <= cp_51_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_/$entry
              cp_53_symbol <= cp_52_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_/$exit
              cp_51_symbol <= cp_53_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_
            cp_43_symbol <= cp_51_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/$exit
            cp_41_symbol <= cp_43_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26
          cp_27_block : Block -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/$exit 
            signal cp_27_predecessors: BooleanArray(1 downto 0);
            signal cp_27_p0_pred: BooleanArray(0 downto 0);
            signal cp_27_p0_succ: BooleanArray(0 downto 0);
            signal cp_27_p1_pred: BooleanArray(0 downto 0);
            signal cp_27_p1_succ: BooleanArray(0 downto 0);
            -- 
          begin -- 
            cp_27_0_place: Place -- 
              generic map(marking => false)
              port map( -- 
                cp_27_p0_pred, cp_27_p0_succ, cp_27_predecessors(0), clk, reset-- 
              ); -- 
            cp_27_p0_succ(0) <=  cp_27_symbol;
            cp_27_p0_pred(0) <=  cp_28_symbol;
            cp_27_1_place: Place -- 
              generic map(marking => false)
              port map( -- 
                cp_27_p1_pred, cp_27_p1_succ, cp_27_predecessors(1), clk, reset-- 
              ); -- 
            cp_27_p1_succ(0) <=  cp_27_symbol;
            cp_27_p1_pred(0) <=  cp_41_symbol;
            cp_27_symbol <= AndReduce(cp_27_predecessors); 
            -- 
          end Block; -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/$exit
          cp_25_symbol <= cp_27_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18
        cp_54: Block -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31 
          signal cp_54_start: Boolean;
          signal cp_55_symbol: Boolean;
          signal cp_56_symbol: Boolean;
          signal cp_57_symbol : Boolean;
          signal cp_60_symbol : Boolean;
          signal cp_61_symbol : Boolean;
          signal cp_62_symbol : Boolean;
          signal cp_63_symbol : Boolean;
          signal cp_64_symbol : Boolean;
          -- 
        begin -- 
          cp_54_start <= cp_25_symbol; -- control passed to block
          cp_55_symbol  <= cp_54_start; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/$entry
          cp_57: Block -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_ 
            signal cp_57_start: Boolean;
            signal cp_58_symbol: Boolean;
            signal cp_59_symbol: Boolean;
            -- 
          begin -- 
            cp_57_start <= cp_55_symbol; -- control passed to block
            cp_58_symbol  <= cp_57_start; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_/$entry
            cp_59_symbol <= cp_58_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_/$exit
            cp_57_symbol <= cp_59_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_
          cp_60_symbol <= cp_57_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/crr
          parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcrr_cp_to_dp <= cp_60_symbol; -- link to DP
          cp_61_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/cra
          cp_62_symbol <= cp_61_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/ccr
          parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xccr_cp_to_dp <= cp_62_symbol; -- link to DP
          cp_63_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/cca
          cp_64: Block -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_ 
            signal cp_64_start: Boolean;
            signal cp_65_symbol: Boolean;
            signal cp_66_symbol: Boolean;
            -- 
          begin -- 
            cp_64_start <= cp_63_symbol; -- control passed to block
            cp_65_symbol  <= cp_64_start; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_/$entry
            cp_66_symbol <= cp_65_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_/$exit
            cp_64_symbol <= cp_66_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_
          cp_56_symbol <= cp_64_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/$exit
          cp_54_symbol <= cp_56_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31
        cp_24_symbol <= cp_54_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/$exit
        cp_22_symbol <= cp_24_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_16/series_block_stmt_17
      cp_67: Block -- parallel_block_stmt_16/series_block_stmt_33 
        signal cp_67_start: Boolean;
        signal cp_68_symbol: Boolean;
        signal cp_69_symbol: Boolean;
        signal cp_70_symbol : Boolean;
        signal cp_99_symbol : Boolean;
        -- 
      begin -- 
        cp_67_start <= cp_20_symbol; -- control passed to block
        cp_68_symbol  <= cp_67_start; -- transition parallel_block_stmt_16/series_block_stmt_33/$entry
        cp_70: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34 
          signal cp_70_start: Boolean;
          signal cp_71_symbol: Boolean;
          signal cp_72_symbol: Boolean;
          signal cp_73_symbol : Boolean;
          signal cp_86_symbol : Boolean;
          -- 
        begin -- 
          cp_70_start <= cp_68_symbol; -- control passed to block
          cp_71_symbol  <= cp_70_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/$entry
          cp_73: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39 
            signal cp_73_start: Boolean;
            signal cp_74_symbol: Boolean;
            signal cp_75_symbol: Boolean;
            signal cp_76_symbol : Boolean;
            -- 
          begin -- 
            cp_73_start <= cp_71_symbol; -- control passed to block
            cp_74_symbol  <= cp_73_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/$entry
            cp_76: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38 
              signal cp_76_start: Boolean;
              signal cp_77_symbol: Boolean;
              signal cp_78_symbol: Boolean;
              signal cp_79_symbol : Boolean;
              signal cp_82_symbol : Boolean;
              signal cp_83_symbol : Boolean;
              signal cp_84_symbol : Boolean;
              signal cp_85_symbol : Boolean;
              -- 
            begin -- 
              cp_76_start <= cp_74_symbol; -- control passed to block
              cp_77_symbol  <= cp_76_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/$entry
              cp_79: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs 
                signal cp_79_start: Boolean;
                signal cp_80_symbol: Boolean;
                signal cp_81_symbol: Boolean;
                -- 
              begin -- 
                cp_79_start <= cp_77_symbol; -- control passed to block
                cp_80_symbol  <= cp_79_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs/$entry
                cp_81_symbol <= cp_80_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs/$exit
                cp_79_symbol <= cp_81_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs
              cp_82_symbol <= cp_79_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/rr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xrr_cp_to_dp <= cp_82_symbol; -- link to DP
              cp_83_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/ra
              cp_84_symbol <= cp_83_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/cr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xcr_cp_to_dp <= cp_84_symbol; -- link to DP
              cp_85_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/ca
              cp_78_symbol <= cp_85_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/$exit
              cp_76_symbol <= cp_78_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38
            cp_75_symbol <= cp_76_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/$exit
            cp_73_symbol <= cp_75_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39
          cp_86: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44 
            signal cp_86_start: Boolean;
            signal cp_87_symbol: Boolean;
            signal cp_88_symbol: Boolean;
            signal cp_89_symbol : Boolean;
            -- 
          begin -- 
            cp_86_start <= cp_71_symbol; -- control passed to block
            cp_87_symbol  <= cp_86_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/$entry
            cp_89: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43 
              signal cp_89_start: Boolean;
              signal cp_90_symbol: Boolean;
              signal cp_91_symbol: Boolean;
              signal cp_92_symbol : Boolean;
              signal cp_95_symbol : Boolean;
              signal cp_96_symbol : Boolean;
              signal cp_97_symbol : Boolean;
              signal cp_98_symbol : Boolean;
              -- 
            begin -- 
              cp_89_start <= cp_87_symbol; -- control passed to block
              cp_90_symbol  <= cp_89_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/$entry
              cp_92: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs 
                signal cp_92_start: Boolean;
                signal cp_93_symbol: Boolean;
                signal cp_94_symbol: Boolean;
                -- 
              begin -- 
                cp_92_start <= cp_90_symbol; -- control passed to block
                cp_93_symbol  <= cp_92_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs/$entry
                cp_94_symbol <= cp_93_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs/$exit
                cp_92_symbol <= cp_94_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs
              cp_95_symbol <= cp_92_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/rr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xrr_cp_to_dp <= cp_95_symbol; -- link to DP
              cp_96_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/ra
              cp_97_symbol <= cp_96_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/cr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xcr_cp_to_dp <= cp_97_symbol; -- link to DP
              cp_98_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/ca
              cp_91_symbol <= cp_98_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/$exit
              cp_89_symbol <= cp_91_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43
            cp_88_symbol <= cp_89_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/$exit
            cp_86_symbol <= cp_88_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44
          cp_72_block : Block -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/$exit 
            signal cp_72_predecessors: BooleanArray(1 downto 0);
            signal cp_72_p0_pred: BooleanArray(0 downto 0);
            signal cp_72_p0_succ: BooleanArray(0 downto 0);
            signal cp_72_p1_pred: BooleanArray(0 downto 0);
            signal cp_72_p1_succ: BooleanArray(0 downto 0);
            -- 
          begin -- 
            cp_72_0_place: Place -- 
              generic map(marking => false)
              port map( -- 
                cp_72_p0_pred, cp_72_p0_succ, cp_72_predecessors(0), clk, reset-- 
              ); -- 
            cp_72_p0_succ(0) <=  cp_72_symbol;
            cp_72_p0_pred(0) <=  cp_73_symbol;
            cp_72_1_place: Place -- 
              generic map(marking => false)
              port map( -- 
                cp_72_p1_pred, cp_72_p1_succ, cp_72_predecessors(1), clk, reset-- 
              ); -- 
            cp_72_p1_succ(0) <=  cp_72_symbol;
            cp_72_p1_pred(0) <=  cp_86_symbol;
            cp_72_symbol <= AndReduce(cp_72_predecessors); 
            -- 
          end Block; -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/$exit
          cp_70_symbol <= cp_72_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34
        cp_99: Block -- parallel_block_stmt_16/series_block_stmt_33/call_stmt_49 
          signal cp_99_start: Boolean;
          signal cp_100_symbol: Boolean;
          signal cp_101_symbol: Boolean;
          signal cp_102_symbol : Boolean;
          signal cp_105_symbol : Boolean;
          signal cp_106_symbol : Boolean;
          signal cp_107_symbol : Boolean;
          signal cp_108_symbol : Boolean;
          signal cp_109_symbol : Boolean;
          -- 
        begin -- 
          cp_99_start <= cp_70_symbol; -- control passed to block
          cp_100_symbol  <= cp_99_start; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/$entry
          cp_102: Block -- parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_in_args_ 
            signal cp_102_start: Boolean;
            signal cp_103_symbol: Boolean;
            signal cp_104_symbol: Boolean;
            -- 
          begin -- 
            cp_102_start <= cp_100_symbol; -- control passed to block
            cp_103_symbol  <= cp_102_start; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_in_args_/$entry
            cp_104_symbol <= cp_103_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_in_args_/$exit
            cp_102_symbol <= cp_104_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_in_args_
          cp_105_symbol <= cp_102_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/crr
          parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcrr_cp_to_dp <= cp_105_symbol; -- link to DP
          cp_106_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/cra
          cp_107_symbol <= cp_106_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/ccr
          parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xccr_cp_to_dp <= cp_107_symbol; -- link to DP
          cp_108_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/cca
          cp_109: Block -- parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_out_args_ 
            signal cp_109_start: Boolean;
            signal cp_110_symbol: Boolean;
            signal cp_111_symbol: Boolean;
            -- 
          begin -- 
            cp_109_start <= cp_108_symbol; -- control passed to block
            cp_110_symbol  <= cp_109_start; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_out_args_/$entry
            cp_111_symbol <= cp_110_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_out_args_/$exit
            cp_109_symbol <= cp_111_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/call_stmt_49_out_args_
          cp_101_symbol <= cp_109_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/call_stmt_49/$exit
          cp_99_symbol <= cp_101_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_33/call_stmt_49
        cp_69_symbol <= cp_99_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/$exit
        cp_67_symbol <= cp_69_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_16/series_block_stmt_33
      cp_21_block : Block -- non-trivial join transition parallel_block_stmt_16/$exit 
        signal cp_21_predecessors: BooleanArray(1 downto 0);
        signal cp_21_p0_pred: BooleanArray(0 downto 0);
        signal cp_21_p0_succ: BooleanArray(0 downto 0);
        signal cp_21_p1_pred: BooleanArray(0 downto 0);
        signal cp_21_p1_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        cp_21_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_21_p0_pred, cp_21_p0_succ, cp_21_predecessors(0), clk, reset-- 
          ); -- 
        cp_21_p0_succ(0) <=  cp_21_symbol;
        cp_21_p0_pred(0) <=  cp_22_symbol;
        cp_21_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_21_p1_pred, cp_21_p1_succ, cp_21_predecessors(1), clk, reset-- 
          ); -- 
        cp_21_p1_succ(0) <=  cp_21_symbol;
        cp_21_p1_pred(0) <=  cp_67_symbol;
        cp_21_symbol <= AndReduce(cp_21_predecessors); 
        -- 
      end Block; -- non-trivial join transition parallel_block_stmt_16/$exit
      cp_19_symbol <= cp_21_symbol; -- control passed from block 
      -- 
    end Block; -- parallel_block_stmt_16
    cp_18_symbol <= cp_19_symbol; -- transition $exit
    fin  <=  '1' when cp_18_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal s_22 : std_logic_vector(9 downto 0);
    signal s_39 : std_logic_vector(9 downto 0);
    signal t_26 : std_logic_vector(9 downto 0);
    signal t_44 : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    -- shared split operator group (0) : binary_38_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xrr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xra_dp_to_cp <= ackL(0);
      reqR(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xcr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xca_dp_to_cp <= ackR(0);
      data_in <= a & a;
      s_39 <= data_out(9 downto 0);
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
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_43_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xrr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xra_dp_to_cp <= ackL(0);
      reqR(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xcr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xca_dp_to_cp <= ackR(0);
      data_in <= b & b;
      t_44 <= data_out(9 downto 0);
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
    -- shared call operator group (0) : call_stmt_22_call call_stmt_31_call 
    CallGroup0: Block -- 
      signal data_in: std_logic_vector(39 downto 0);
      signal data_out: std_logic_vector(19 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      -- 
    begin -- 
      reqL(1) <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcrr_cp_to_dp;
      reqL(0) <= parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcrr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcra_dp_to_cp <= ackL(1);
      parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcra_dp_to_cp <= ackL(0);
      reqR(1) <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xccr_cp_to_dp;
      reqR(0) <= parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xccr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcca_dp_to_cp <= ackR(1);
      parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcca_dp_to_cp <= ackR(0);
      data_in <= a & a & s_22 & t_26;
      s_22 <= data_out(19 downto 10);
      c <= data_out(9 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 40, owidth => 20, twidth => 1, nreqs => 2,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => sum_mod_call_reqs(2),
          ackR => sum_mod_call_acks(2),
          dataR => sum_mod_call_data(59 downto 40),
          tagR => sum_mod_call_tag(2 downto 2),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 10, owidth => 20, twidth => 1, nreqs => 2,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => sum_mod_return_acks(2), -- cross-over
          ackL => sum_mod_return_reqs(2), -- cross-over
          dataL => sum_mod_return_data(29 downto 20),
          tagL => sum_mod_return_tag(2 downto 2),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- shared call operator group (1) : call_stmt_26_call 
    CallGroup1: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcrr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcra_dp_to_cp <= ackL(0);
      reqR(0) <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xccr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcca_dp_to_cp <= ackR(0);
      data_in <= b & b;
      t_26 <= data_out(9 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 20, owidth => 20, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => sum_mod_call_reqs(1),
          ackR => sum_mod_call_acks(1),
          dataR => sum_mod_call_data(39 downto 20),
          tagR => sum_mod_call_tag(1 downto 1),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 10, owidth => 10, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => sum_mod_return_acks(1), -- cross-over
          ackL => sum_mod_return_reqs(1), -- cross-over
          dataL => sum_mod_return_data(19 downto 10),
          tagL => sum_mod_return_tag(1 downto 1),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 1
    -- shared call operator group (2) : call_stmt_49_call 
    CallGroup2: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcrr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcra_dp_to_cp <= ackL(0);
      reqR(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xccr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xcall_stmt_49Xcca_dp_to_cp <= ackR(0);
      data_in <= s_39 & t_44;
      d <= data_out(9 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 20, owidth => 20, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => sum_mod_call_reqs(0),
          ackR => sum_mod_call_acks(0),
          dataR => sum_mod_call_data(19 downto 0),
          tagR => sum_mod_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 10, owidth => 10, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => sum_mod_return_acks(0), -- cross-over
          ackL => sum_mod_return_reqs(0), -- cross-over
          dataL => sum_mod_return_data(9 downto 0),
          tagL => sum_mod_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 2
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
entity sum_mod is -- 
  port ( -- 
    a : in  std_logic_vector(9 downto 0);
    b : in  std_logic_vector(9 downto 0);
    c : out  std_logic_vector(9 downto 0);
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
  signal assign_stmt_9Xbinary_8Xrr_cp_to_dp : boolean;
  signal assign_stmt_9Xbinary_8Xra_dp_to_cp : boolean;
  signal assign_stmt_9Xbinary_8Xcr_cp_to_dp : boolean;
  signal assign_stmt_9Xbinary_8Xca_dp_to_cp : boolean;
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
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- assign_stmt_9 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition assign_stmt_9/$entry
      cp_6: Block -- assign_stmt_9/binary_8 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        signal cp_12_symbol : Boolean;
        signal cp_13_symbol : Boolean;
        signal cp_14_symbol : Boolean;
        signal cp_15_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition assign_stmt_9/binary_8/$entry
        cp_9: Block -- assign_stmt_9/binary_8/binary_8_inputs 
          signal cp_9_start: Boolean;
          signal cp_10_symbol: Boolean;
          signal cp_11_symbol: Boolean;
          -- 
        begin -- 
          cp_9_start <= cp_7_symbol; -- control passed to block
          cp_10_symbol  <= cp_9_start; -- transition assign_stmt_9/binary_8/binary_8_inputs/$entry
          cp_11_symbol <= cp_10_symbol; -- transition assign_stmt_9/binary_8/binary_8_inputs/$exit
          cp_9_symbol <= cp_11_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_9/binary_8/binary_8_inputs
        cp_12_symbol <= cp_9_symbol; -- transition assign_stmt_9/binary_8/rr
        assign_stmt_9Xbinary_8Xrr_cp_to_dp <= cp_12_symbol; -- link to DP
        cp_13_symbol <= assign_stmt_9Xbinary_8Xra_dp_to_cp; -- transition assign_stmt_9/binary_8/ra
        cp_14_symbol <= cp_13_symbol; -- transition assign_stmt_9/binary_8/cr
        assign_stmt_9Xbinary_8Xcr_cp_to_dp <= cp_14_symbol; -- link to DP
        cp_15_symbol <= assign_stmt_9Xbinary_8Xca_dp_to_cp; -- transition assign_stmt_9/binary_8/ca
        cp_8_symbol <= cp_15_symbol; -- transition assign_stmt_9/binary_8/$exit
        cp_6_symbol <= cp_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_9/binary_8
      cp_5_symbol <= cp_6_symbol; -- transition assign_stmt_9/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_9
    cp_2_symbol <= cp_3_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    -- 
  begin -- 
    -- shared split operator group (0) : binary_8_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_9Xbinary_8Xrr_cp_to_dp;
      assign_stmt_9Xbinary_8Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_9Xbinary_8Xcr_cp_to_dp;
      assign_stmt_9Xbinary_8Xca_dp_to_cp <= ackR(0);
      data_in <= a & b;
      c <= data_out(9 downto 0);
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
    end Block; -- split operator group 0
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
    main_a : in  std_logic_vector(9 downto 0);
    main_b : in  std_logic_vector(9 downto 0);
    main_c : out  std_logic_vector(9 downto 0);
    main_d : out  std_logic_vector(9 downto 0);
    main_tag_in: in std_logic_vector(0 downto 0);
    main_tag_out: out std_logic_vector(0 downto 0);
    main_start : in std_logic;
    main_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module main
  component main is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : in  std_logic_vector(9 downto 0);
      c : out  std_logic_vector(9 downto 0);
      d : out  std_logic_vector(9 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      sum_mod_call_reqs : out  std_logic_vector(2 downto 0);
      sum_mod_call_acks : in   std_logic_vector(2 downto 0);
      sum_mod_call_data : out  std_logic_vector(59 downto 0);
      sum_mod_call_tag  :  out  std_logic_vector(2 downto 0);
      sum_mod_return_reqs : out  std_logic_vector(2 downto 0);
      sum_mod_return_acks : in   std_logic_vector(2 downto 0);
      sum_mod_return_data : in   std_logic_vector(29 downto 0);
      sum_mod_return_tag :  in   std_logic_vector(2 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- declarations related to module sum_mod
  component sum_mod is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : in  std_logic_vector(9 downto 0);
      c : out  std_logic_vector(9 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module sum_mod
  signal sum_mod_a :  std_logic_vector(9 downto 0);
  signal sum_mod_b :  std_logic_vector(9 downto 0);
  signal sum_mod_c :  std_logic_vector(9 downto 0);
  signal sum_mod_in_args    : std_logic_vector(19 downto 0);
  signal sum_mod_out_args   : std_logic_vector(9 downto 0);
  signal sum_mod_tag_in    : std_logic_vector(0 downto 0);
  signal sum_mod_tag_out   : std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic;
  signal sum_mod_fin   : std_logic;
  -- caller side aggregated signals for module sum_mod
  signal sum_mod_call_reqs: std_logic_vector(2 downto 0);
  signal sum_mod_call_acks: std_logic_vector(2 downto 0);
  signal sum_mod_return_reqs: std_logic_vector(2 downto 0);
  signal sum_mod_return_acks: std_logic_vector(2 downto 0);
  signal sum_mod_call_data: std_logic_vector(59 downto 0);
  signal sum_mod_call_tag: std_logic_vector(2 downto 0);
  signal sum_mod_return_data: std_logic_vector(29 downto 0);
  signal sum_mod_return_tag: std_logic_vector(2 downto 0);
  -- 
begin -- 
  -- module main
  main_instance:main-- 
    port map(-- 
      a => main_a,
      b => main_b,
      c => main_c,
      d => main_d,
      start => main_start,
      fin => main_fin,
      clk => clk,
      reset => reset,
      sum_mod_call_reqs => sum_mod_call_reqs(2 downto 0),
      sum_mod_call_acks => sum_mod_call_acks(2 downto 0),
      sum_mod_call_data => sum_mod_call_data(59 downto 0),
      sum_mod_call_tag => sum_mod_call_tag(2 downto 0),
      sum_mod_return_reqs => sum_mod_return_reqs(2 downto 0),
      sum_mod_return_acks => sum_mod_return_acks(2 downto 0),
      sum_mod_return_data => sum_mod_return_data(29 downto 0),
      sum_mod_return_tag => sum_mod_return_tag(2 downto 0),
      tag_in => main_tag_in,
      tag_out => main_tag_out-- 
    ); -- 
  -- module sum_mod
  sum_mod_a <= sum_mod_in_args(19 downto 10);
  sum_mod_b <= sum_mod_in_args(9 downto 0);
  sum_mod_out_args <= sum_mod_c ;
  -- call arbiter for module sum_mod
  sum_mod_arbiter: CallArbiterUnitary -- 
    generic map( --
      num_reqs => 3,
      call_data_width => 20,
      return_data_width => 10,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => sum_mod_call_reqs,
      call_acks => sum_mod_call_acks,
      return_reqs => sum_mod_return_reqs,
      return_acks => sum_mod_return_acks,
      call_data  => sum_mod_call_data,
      call_tag  => sum_mod_call_tag,
      return_tag  => sum_mod_return_tag,
      call_in_tag => sum_mod_tag_in,
      call_out_tag => sum_mod_tag_out,
      return_data =>sum_mod_return_data,
      call_start => sum_mod_start,
      call_fin => sum_mod_fin,
      call_in_args => sum_mod_in_args,
      call_out_args => sum_mod_out_args,
      clk => clk, 
      reset => reset --
    ); --
  sum_mod_instance:sum_mod-- 
    port map(-- 
      a => sum_mod_a,
      b => sum_mod_b,
      c => sum_mod_c,
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
      main_a : in  std_logic_vector(9 downto 0);
      main_b : in  std_logic_vector(9 downto 0);
      main_c : out  std_logic_vector(9 downto 0);
      main_d : out  std_logic_vector(9 downto 0);
      main_tag_in: in std_logic_vector(0 downto 0);
      main_tag_out: out std_logic_vector(0 downto 0);
      main_start : in std_logic;
      main_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal main_a :  std_logic_vector(9 downto 0);
  signal main_b :  std_logic_vector(9 downto 0);
  signal main_c :   std_logic_vector(9 downto 0);
  signal main_d :   std_logic_vector(9 downto 0);
  signal main_tag_in: std_logic_vector(0 downto 0);
  signal main_tag_out: std_logic_vector(0 downto 0);
  signal main_start : std_logic := '0';
  signal main_fin   : std_logic := '0';
  -- 
begin --

  clk <= not clk after 5 ns;
  main_a <= (0 => '1', others => '0');
  main_b <= (9 => '0', 8 => '0', others => '1');

  process 
  begin
	wait until clk = '1';
	reset <= '0'; main_start <= '1';
	wait until clk = '1';
	main_start <= '0';
	while main_fin /= '1' loop
		wait until clk = '1';
	end loop;
	wait;
  end process;

  test_system_instance: test_system -- 
    port map ( -- 
      main_a => main_a,
      main_b => main_b,
      main_c => main_c,
      main_d => main_d,
      main_tag_in => main_tag_in,
      main_tag_out => main_tag_out,
      main_start => main_start,
      main_fin  => main_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
