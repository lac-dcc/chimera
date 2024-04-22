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
    sum_mod_call_reqs : out  std_logic_vector(1 downto 0);
    sum_mod_call_acks : in   std_logic_vector(1 downto 0);
    sum_mod_call_data : out  std_logic_vector(39 downto 0);
    sum_mod_call_tag  :  out  std_logic_vector(3 downto 0);
    sum_mod_return_reqs : out  std_logic_vector(1 downto 0);
    sum_mod_return_acks : in   std_logic_vector(1 downto 0);
    sum_mod_return_data : in   std_logic_vector(19 downto 0);
    sum_mod_return_tag :  in   std_logic_vector(3 downto 0);
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
  signal parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xrr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xra_dp_to_cp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xcr_cp_to_dp : boolean;
  signal parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xca_dp_to_cp : boolean;
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
  main_CP_16: Block -- control-path 
    signal main_CP_16_start: Boolean;
    signal Xentry_17_symbol: Boolean;
    signal Xexit_18_symbol: Boolean;
    signal parallel_block_stmt_16_19_symbol : Boolean;
    -- 
  begin -- 
    main_CP_16_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_17_symbol  <= main_CP_16_start; -- transition $entry
    parallel_block_stmt_16_19: Block -- parallel_block_stmt_16 
      signal parallel_block_stmt_16_19_start: Boolean;
      signal Xentry_20_symbol: Boolean;
      signal Xexit_21_symbol: Boolean;
      signal series_block_stmt_17_22_symbol : Boolean;
      signal series_block_stmt_33_67_symbol : Boolean;
      -- 
    begin -- 
      parallel_block_stmt_16_19_start <= Xentry_17_symbol; -- control passed to block
      Xentry_20_symbol  <= parallel_block_stmt_16_19_start; -- transition parallel_block_stmt_16/$entry
      series_block_stmt_17_22: Block -- parallel_block_stmt_16/series_block_stmt_17 
        signal series_block_stmt_17_22_start: Boolean;
        signal Xentry_23_symbol: Boolean;
        signal Xexit_24_symbol: Boolean;
        signal parallel_block_stmt_18_25_symbol : Boolean;
        signal call_stmt_31_54_symbol : Boolean;
        -- 
      begin -- 
        series_block_stmt_17_22_start <= Xentry_20_symbol; -- control passed to block
        Xentry_23_symbol  <= series_block_stmt_17_22_start; -- transition parallel_block_stmt_16/series_block_stmt_17/$entry
        parallel_block_stmt_18_25: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18 
          signal parallel_block_stmt_18_25_start: Boolean;
          signal Xentry_26_symbol: Boolean;
          signal Xexit_27_symbol: Boolean;
          signal call_stmt_22_28_symbol : Boolean;
          signal call_stmt_26_41_symbol : Boolean;
          -- 
        begin -- 
          parallel_block_stmt_18_25_start <= Xentry_23_symbol; -- control passed to block
          Xentry_26_symbol  <= parallel_block_stmt_18_25_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/$entry
          call_stmt_22_28: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22 
            signal call_stmt_22_28_start: Boolean;
            signal Xentry_29_symbol: Boolean;
            signal Xexit_30_symbol: Boolean;
            signal call_stmt_22_in_args_x_x31_symbol : Boolean;
            signal crr_34_symbol : Boolean;
            signal cra_35_symbol : Boolean;
            signal ccr_36_symbol : Boolean;
            signal cca_37_symbol : Boolean;
            signal call_stmt_22_out_args_x_x38_symbol : Boolean;
            -- 
          begin -- 
            call_stmt_22_28_start <= Xentry_26_symbol; -- control passed to block
            Xentry_29_symbol  <= call_stmt_22_28_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/$entry
            call_stmt_22_in_args_x_x31: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_ 
              signal call_stmt_22_in_args_x_x31_start: Boolean;
              signal Xentry_32_symbol: Boolean;
              signal Xexit_33_symbol: Boolean;
              -- 
            begin -- 
              call_stmt_22_in_args_x_x31_start <= Xentry_29_symbol; -- control passed to block
              Xentry_32_symbol  <= call_stmt_22_in_args_x_x31_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_/$entry
              Xexit_33_symbol <= Xentry_32_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_/$exit
              call_stmt_22_in_args_x_x31_symbol <= Xexit_33_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_in_args_
            crr_34_symbol <= call_stmt_22_in_args_x_x31_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/crr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcrr_cp_to_dp <= crr_34_symbol; -- link to DP
            cra_35_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/cra
            ccr_36_symbol <= cra_35_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/ccr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xccr_cp_to_dp <= ccr_36_symbol; -- link to DP
            cca_37_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_22Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/cca
            call_stmt_22_out_args_x_x38: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_ 
              signal call_stmt_22_out_args_x_x38_start: Boolean;
              signal Xentry_39_symbol: Boolean;
              signal Xexit_40_symbol: Boolean;
              -- 
            begin -- 
              call_stmt_22_out_args_x_x38_start <= cca_37_symbol; -- control passed to block
              Xentry_39_symbol  <= call_stmt_22_out_args_x_x38_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_/$entry
              Xexit_40_symbol <= Xentry_39_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_/$exit
              call_stmt_22_out_args_x_x38_symbol <= Xexit_40_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/call_stmt_22_out_args_
            Xexit_30_symbol <= call_stmt_22_out_args_x_x38_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22/$exit
            call_stmt_22_28_symbol <= Xexit_30_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_22
          call_stmt_26_41: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26 
            signal call_stmt_26_41_start: Boolean;
            signal Xentry_42_symbol: Boolean;
            signal Xexit_43_symbol: Boolean;
            signal call_stmt_26_in_args_x_x44_symbol : Boolean;
            signal crr_47_symbol : Boolean;
            signal cra_48_symbol : Boolean;
            signal ccr_49_symbol : Boolean;
            signal cca_50_symbol : Boolean;
            signal call_stmt_26_out_args_x_x51_symbol : Boolean;
            -- 
          begin -- 
            call_stmt_26_41_start <= Xentry_26_symbol; -- control passed to block
            Xentry_42_symbol  <= call_stmt_26_41_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/$entry
            call_stmt_26_in_args_x_x44: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_ 
              signal call_stmt_26_in_args_x_x44_start: Boolean;
              signal Xentry_45_symbol: Boolean;
              signal Xexit_46_symbol: Boolean;
              -- 
            begin -- 
              call_stmt_26_in_args_x_x44_start <= Xentry_42_symbol; -- control passed to block
              Xentry_45_symbol  <= call_stmt_26_in_args_x_x44_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_/$entry
              Xexit_46_symbol <= Xentry_45_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_/$exit
              call_stmt_26_in_args_x_x44_symbol <= Xexit_46_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_in_args_
            crr_47_symbol <= call_stmt_26_in_args_x_x44_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/crr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcrr_cp_to_dp <= crr_47_symbol; -- link to DP
            cra_48_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/cra
            ccr_49_symbol <= cra_48_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/ccr
            parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xccr_cp_to_dp <= ccr_49_symbol; -- link to DP
            cca_50_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xparallel_block_stmt_18Xcall_stmt_26Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/cca
            call_stmt_26_out_args_x_x51: Block -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_ 
              signal call_stmt_26_out_args_x_x51_start: Boolean;
              signal Xentry_52_symbol: Boolean;
              signal Xexit_53_symbol: Boolean;
              -- 
            begin -- 
              call_stmt_26_out_args_x_x51_start <= cca_50_symbol; -- control passed to block
              Xentry_52_symbol  <= call_stmt_26_out_args_x_x51_start; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_/$entry
              Xexit_53_symbol <= Xentry_52_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_/$exit
              call_stmt_26_out_args_x_x51_symbol <= Xexit_53_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/call_stmt_26_out_args_
            Xexit_43_symbol <= call_stmt_26_out_args_x_x51_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26/$exit
            call_stmt_26_41_symbol <= Xexit_43_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/call_stmt_26
          Xexit_27_block : Block -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/$exit 
            signal Xexit_27_predecessors: BooleanArray(1 downto 0);
            signal Xexit_27_p0_pred: BooleanArray(0 downto 0);
            signal Xexit_27_p0_succ: BooleanArray(0 downto 0);
            signal Xexit_27_p1_pred: BooleanArray(0 downto 0);
            signal Xexit_27_p1_succ: BooleanArray(0 downto 0);
            -- 
          begin -- 
            Xexit_27_0_place: Place -- 
              generic map(marking => false)
              port map( -- 
                Xexit_27_p0_pred, Xexit_27_p0_succ, Xexit_27_predecessors(0), clk, reset-- 
              ); -- 
            Xexit_27_p0_succ(0) <=  Xexit_27_symbol;
            Xexit_27_p0_pred(0) <=  call_stmt_22_28_symbol;
            Xexit_27_1_place: Place -- 
              generic map(marking => false)
              port map( -- 
                Xexit_27_p1_pred, Xexit_27_p1_succ, Xexit_27_predecessors(1), clk, reset-- 
              ); -- 
            Xexit_27_p1_succ(0) <=  Xexit_27_symbol;
            Xexit_27_p1_pred(0) <=  call_stmt_26_41_symbol;
            Xexit_27_symbol <= AndReduce(Xexit_27_predecessors); 
            -- 
          end Block; -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18/$exit
          parallel_block_stmt_18_25_symbol <= Xexit_27_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_17/parallel_block_stmt_18
        call_stmt_31_54: Block -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31 
          signal call_stmt_31_54_start: Boolean;
          signal Xentry_55_symbol: Boolean;
          signal Xexit_56_symbol: Boolean;
          signal call_stmt_31_in_args_x_x57_symbol : Boolean;
          signal crr_60_symbol : Boolean;
          signal cra_61_symbol : Boolean;
          signal ccr_62_symbol : Boolean;
          signal cca_63_symbol : Boolean;
          signal call_stmt_31_out_args_x_x64_symbol : Boolean;
          -- 
        begin -- 
          call_stmt_31_54_start <= parallel_block_stmt_18_25_symbol; -- control passed to block
          Xentry_55_symbol  <= call_stmt_31_54_start; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/$entry
          call_stmt_31_in_args_x_x57: Block -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_ 
            signal call_stmt_31_in_args_x_x57_start: Boolean;
            signal Xentry_58_symbol: Boolean;
            signal Xexit_59_symbol: Boolean;
            -- 
          begin -- 
            call_stmt_31_in_args_x_x57_start <= Xentry_55_symbol; -- control passed to block
            Xentry_58_symbol  <= call_stmt_31_in_args_x_x57_start; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_/$entry
            Xexit_59_symbol <= Xentry_58_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_/$exit
            call_stmt_31_in_args_x_x57_symbol <= Xexit_59_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_in_args_
          crr_60_symbol <= call_stmt_31_in_args_x_x57_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/crr
          parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcrr_cp_to_dp <= crr_60_symbol; -- link to DP
          cra_61_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/cra
          ccr_62_symbol <= cra_61_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/ccr
          parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xccr_cp_to_dp <= ccr_62_symbol; -- link to DP
          cca_63_symbol <= parallel_block_stmt_16Xseries_block_stmt_17Xcall_stmt_31Xcca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/cca
          call_stmt_31_out_args_x_x64: Block -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_ 
            signal call_stmt_31_out_args_x_x64_start: Boolean;
            signal Xentry_65_symbol: Boolean;
            signal Xexit_66_symbol: Boolean;
            -- 
          begin -- 
            call_stmt_31_out_args_x_x64_start <= cca_63_symbol; -- control passed to block
            Xentry_65_symbol  <= call_stmt_31_out_args_x_x64_start; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_/$entry
            Xexit_66_symbol <= Xentry_65_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_/$exit
            call_stmt_31_out_args_x_x64_symbol <= Xexit_66_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/call_stmt_31_out_args_
          Xexit_56_symbol <= call_stmt_31_out_args_x_x64_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/call_stmt_31/$exit
          call_stmt_31_54_symbol <= Xexit_56_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_17/call_stmt_31
        Xexit_24_symbol <= call_stmt_31_54_symbol; -- transition parallel_block_stmt_16/series_block_stmt_17/$exit
        series_block_stmt_17_22_symbol <= Xexit_24_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_16/series_block_stmt_17
      series_block_stmt_33_67: Block -- parallel_block_stmt_16/series_block_stmt_33 
        signal series_block_stmt_33_67_start: Boolean;
        signal Xentry_68_symbol: Boolean;
        signal Xexit_69_symbol: Boolean;
        signal parallel_block_stmt_34_70_symbol : Boolean;
        signal assign_stmt_50_99_symbol : Boolean;
        -- 
      begin -- 
        series_block_stmt_33_67_start <= Xentry_20_symbol; -- control passed to block
        Xentry_68_symbol  <= series_block_stmt_33_67_start; -- transition parallel_block_stmt_16/series_block_stmt_33/$entry
        parallel_block_stmt_34_70: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34 
          signal parallel_block_stmt_34_70_start: Boolean;
          signal Xentry_71_symbol: Boolean;
          signal Xexit_72_symbol: Boolean;
          signal assign_stmt_39_73_symbol : Boolean;
          signal assign_stmt_44_86_symbol : Boolean;
          -- 
        begin -- 
          parallel_block_stmt_34_70_start <= Xentry_68_symbol; -- control passed to block
          Xentry_71_symbol  <= parallel_block_stmt_34_70_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/$entry
          assign_stmt_39_73: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39 
            signal assign_stmt_39_73_start: Boolean;
            signal Xentry_74_symbol: Boolean;
            signal Xexit_75_symbol: Boolean;
            signal binary_38_76_symbol : Boolean;
            -- 
          begin -- 
            assign_stmt_39_73_start <= Xentry_71_symbol; -- control passed to block
            Xentry_74_symbol  <= assign_stmt_39_73_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/$entry
            binary_38_76: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38 
              signal binary_38_76_start: Boolean;
              signal Xentry_77_symbol: Boolean;
              signal Xexit_78_symbol: Boolean;
              signal binary_38_inputs_79_symbol : Boolean;
              signal rr_82_symbol : Boolean;
              signal ra_83_symbol : Boolean;
              signal cr_84_symbol : Boolean;
              signal ca_85_symbol : Boolean;
              -- 
            begin -- 
              binary_38_76_start <= Xentry_74_symbol; -- control passed to block
              Xentry_77_symbol  <= binary_38_76_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/$entry
              binary_38_inputs_79: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs 
                signal binary_38_inputs_79_start: Boolean;
                signal Xentry_80_symbol: Boolean;
                signal Xexit_81_symbol: Boolean;
                -- 
              begin -- 
                binary_38_inputs_79_start <= Xentry_77_symbol; -- control passed to block
                Xentry_80_symbol  <= binary_38_inputs_79_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs/$entry
                Xexit_81_symbol <= Xentry_80_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs/$exit
                binary_38_inputs_79_symbol <= Xexit_81_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/binary_38_inputs
              rr_82_symbol <= binary_38_inputs_79_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/rr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xrr_cp_to_dp <= rr_82_symbol; -- link to DP
              ra_83_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/ra
              cr_84_symbol <= ra_83_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/cr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xcr_cp_to_dp <= cr_84_symbol; -- link to DP
              ca_85_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/ca
              Xexit_78_symbol <= ca_85_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38/$exit
              binary_38_76_symbol <= Xexit_78_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/binary_38
            Xexit_75_symbol <= binary_38_76_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39/$exit
            assign_stmt_39_73_symbol <= Xexit_75_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_39
          assign_stmt_44_86: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44 
            signal assign_stmt_44_86_start: Boolean;
            signal Xentry_87_symbol: Boolean;
            signal Xexit_88_symbol: Boolean;
            signal binary_43_89_symbol : Boolean;
            -- 
          begin -- 
            assign_stmt_44_86_start <= Xentry_71_symbol; -- control passed to block
            Xentry_87_symbol  <= assign_stmt_44_86_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/$entry
            binary_43_89: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43 
              signal binary_43_89_start: Boolean;
              signal Xentry_90_symbol: Boolean;
              signal Xexit_91_symbol: Boolean;
              signal binary_43_inputs_92_symbol : Boolean;
              signal rr_95_symbol : Boolean;
              signal ra_96_symbol : Boolean;
              signal cr_97_symbol : Boolean;
              signal ca_98_symbol : Boolean;
              -- 
            begin -- 
              binary_43_89_start <= Xentry_87_symbol; -- control passed to block
              Xentry_90_symbol  <= binary_43_89_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/$entry
              binary_43_inputs_92: Block -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs 
                signal binary_43_inputs_92_start: Boolean;
                signal Xentry_93_symbol: Boolean;
                signal Xexit_94_symbol: Boolean;
                -- 
              begin -- 
                binary_43_inputs_92_start <= Xentry_90_symbol; -- control passed to block
                Xentry_93_symbol  <= binary_43_inputs_92_start; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs/$entry
                Xexit_94_symbol <= Xentry_93_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs/$exit
                binary_43_inputs_92_symbol <= Xexit_94_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/binary_43_inputs
              rr_95_symbol <= binary_43_inputs_92_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/rr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xrr_cp_to_dp <= rr_95_symbol; -- link to DP
              ra_96_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/ra
              cr_97_symbol <= ra_96_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/cr
              parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xcr_cp_to_dp <= cr_97_symbol; -- link to DP
              ca_98_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_44Xbinary_43Xca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/ca
              Xexit_91_symbol <= ca_98_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43/$exit
              binary_43_89_symbol <= Xexit_91_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/binary_43
            Xexit_88_symbol <= binary_43_89_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44/$exit
            assign_stmt_44_86_symbol <= Xexit_88_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/assign_stmt_44
          Xexit_72_block : Block -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/$exit 
            signal Xexit_72_predecessors: BooleanArray(1 downto 0);
            signal Xexit_72_p0_pred: BooleanArray(0 downto 0);
            signal Xexit_72_p0_succ: BooleanArray(0 downto 0);
            signal Xexit_72_p1_pred: BooleanArray(0 downto 0);
            signal Xexit_72_p1_succ: BooleanArray(0 downto 0);
            -- 
          begin -- 
            Xexit_72_0_place: Place -- 
              generic map(marking => false)
              port map( -- 
                Xexit_72_p0_pred, Xexit_72_p0_succ, Xexit_72_predecessors(0), clk, reset-- 
              ); -- 
            Xexit_72_p0_succ(0) <=  Xexit_72_symbol;
            Xexit_72_p0_pred(0) <=  assign_stmt_39_73_symbol;
            Xexit_72_1_place: Place -- 
              generic map(marking => false)
              port map( -- 
                Xexit_72_p1_pred, Xexit_72_p1_succ, Xexit_72_predecessors(1), clk, reset-- 
              ); -- 
            Xexit_72_p1_succ(0) <=  Xexit_72_symbol;
            Xexit_72_p1_pred(0) <=  assign_stmt_44_86_symbol;
            Xexit_72_symbol <= AndReduce(Xexit_72_predecessors); 
            -- 
          end Block; -- non-trivial join transition parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34/$exit
          parallel_block_stmt_34_70_symbol <= Xexit_72_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_33/parallel_block_stmt_34
        assign_stmt_50_99: Block -- parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50 
          signal assign_stmt_50_99_start: Boolean;
          signal Xentry_100_symbol: Boolean;
          signal Xexit_101_symbol: Boolean;
          signal binary_49_102_symbol : Boolean;
          -- 
        begin -- 
          assign_stmt_50_99_start <= parallel_block_stmt_34_70_symbol; -- control passed to block
          Xentry_100_symbol  <= assign_stmt_50_99_start; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/$entry
          binary_49_102: Block -- parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49 
            signal binary_49_102_start: Boolean;
            signal Xentry_103_symbol: Boolean;
            signal Xexit_104_symbol: Boolean;
            signal binary_49_inputs_105_symbol : Boolean;
            signal rr_108_symbol : Boolean;
            signal ra_109_symbol : Boolean;
            signal cr_110_symbol : Boolean;
            signal ca_111_symbol : Boolean;
            -- 
          begin -- 
            binary_49_102_start <= Xentry_100_symbol; -- control passed to block
            Xentry_103_symbol  <= binary_49_102_start; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/$entry
            binary_49_inputs_105: Block -- parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/binary_49_inputs 
              signal binary_49_inputs_105_start: Boolean;
              signal Xentry_106_symbol: Boolean;
              signal Xexit_107_symbol: Boolean;
              -- 
            begin -- 
              binary_49_inputs_105_start <= Xentry_103_symbol; -- control passed to block
              Xentry_106_symbol  <= binary_49_inputs_105_start; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/binary_49_inputs/$entry
              Xexit_107_symbol <= Xentry_106_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/binary_49_inputs/$exit
              binary_49_inputs_105_symbol <= Xexit_107_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/binary_49_inputs
            rr_108_symbol <= binary_49_inputs_105_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/rr
            parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xrr_cp_to_dp <= rr_108_symbol; -- link to DP
            ra_109_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xra_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/ra
            cr_110_symbol <= ra_109_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/cr
            parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xcr_cp_to_dp <= cr_110_symbol; -- link to DP
            ca_111_symbol <= parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xca_dp_to_cp; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/ca
            Xexit_104_symbol <= ca_111_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49/$exit
            binary_49_102_symbol <= Xexit_104_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/binary_49
          Xexit_101_symbol <= binary_49_102_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50/$exit
          assign_stmt_50_99_symbol <= Xexit_101_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_16/series_block_stmt_33/assign_stmt_50
        Xexit_69_symbol <= assign_stmt_50_99_symbol; -- transition parallel_block_stmt_16/series_block_stmt_33/$exit
        series_block_stmt_33_67_symbol <= Xexit_69_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_16/series_block_stmt_33
      Xexit_21_block : Block -- non-trivial join transition parallel_block_stmt_16/$exit 
        signal Xexit_21_predecessors: BooleanArray(1 downto 0);
        signal Xexit_21_p0_pred: BooleanArray(0 downto 0);
        signal Xexit_21_p0_succ: BooleanArray(0 downto 0);
        signal Xexit_21_p1_pred: BooleanArray(0 downto 0);
        signal Xexit_21_p1_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        Xexit_21_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_21_p0_pred, Xexit_21_p0_succ, Xexit_21_predecessors(0), clk, reset-- 
          ); -- 
        Xexit_21_p0_succ(0) <=  Xexit_21_symbol;
        Xexit_21_p0_pred(0) <=  series_block_stmt_17_22_symbol;
        Xexit_21_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_21_p1_pred, Xexit_21_p1_succ, Xexit_21_predecessors(1), clk, reset-- 
          ); -- 
        Xexit_21_p1_succ(0) <=  Xexit_21_symbol;
        Xexit_21_p1_pred(0) <=  series_block_stmt_33_67_symbol;
        Xexit_21_symbol <= AndReduce(Xexit_21_predecessors); 
        -- 
      end Block; -- non-trivial join transition parallel_block_stmt_16/$exit
      parallel_block_stmt_16_19_symbol <= Xexit_21_symbol; -- control passed from block 
      -- 
    end Block; -- parallel_block_stmt_16
    Xexit_18_symbol <= parallel_block_stmt_16_19_symbol; -- transition $exit
    fin  <=  '1' when Xexit_18_symbol else '0'; -- fin symbol when control-path exits
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
    -- shared split operator group (0) : binary_38_inst binary_49_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(39 downto 0);
      signal data_out: std_logic_vector(19 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      -- 
    begin -- 
      reqL(1) <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xrr_cp_to_dp;
      reqL(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xrr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xra_dp_to_cp <= ackL(1);
      parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xra_dp_to_cp <= ackL(0);
      reqR(1) <= parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xcr_cp_to_dp;
      reqR(0) <= parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xcr_cp_to_dp;
      parallel_block_stmt_16Xseries_block_stmt_33Xparallel_block_stmt_34Xassign_stmt_39Xbinary_38Xca_dp_to_cp <= ackR(1);
      parallel_block_stmt_16Xseries_block_stmt_33Xassign_stmt_50Xbinary_49Xca_dp_to_cp <= ackR(0);
      data_in <= a & a & s_39 & t_44;
      s_39 <= data_out(19 downto 10);
      d <= data_out(9 downto 0);
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
          num_reqs => 2--
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
        generic map (iwidth => 40, owidth => 20, twidth => 2, nreqs => 2,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => sum_mod_call_reqs(1),
          ackR => sum_mod_call_acks(1),
          dataR => sum_mod_call_data(39 downto 20),
          tagR => sum_mod_call_tag(3 downto 2),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 10, owidth => 20, twidth => 2, nreqs => 2,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => sum_mod_return_acks(1), -- cross-over
          ackL => sum_mod_return_reqs(1), -- cross-over
          dataL => sum_mod_return_data(19 downto 10),
          tagL => sum_mod_return_tag(3 downto 2),
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
        generic map (iwidth => 20, owidth => 20, twidth => 2, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => sum_mod_call_reqs(0),
          ackR => sum_mod_call_acks(0),
          dataR => sum_mod_call_data(19 downto 0),
          tagR => sum_mod_call_tag(1 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 10, owidth => 10, twidth => 2, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => sum_mod_return_acks(0), -- cross-over
          ackL => sum_mod_return_reqs(0), -- cross-over
          dataL => sum_mod_return_data(9 downto 0),
          tagL => sum_mod_return_tag(1 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 1
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
    tag_in: in std_logic_vector(1 downto 0);
    tag_out: out std_logic_vector(1 downto 0)-- 
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
  sum_mod_CP_0: Block -- control-path 
    signal sum_mod_CP_0_start: Boolean;
    signal Xentry_1_symbol: Boolean;
    signal Xexit_2_symbol: Boolean;
    signal assign_stmt_9_3_symbol : Boolean;
    -- 
  begin -- 
    sum_mod_CP_0_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_1_symbol  <= sum_mod_CP_0_start; -- transition $entry
    assign_stmt_9_3: Block -- assign_stmt_9 
      signal assign_stmt_9_3_start: Boolean;
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal binary_8_6_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_9_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= assign_stmt_9_3_start; -- transition assign_stmt_9/$entry
      binary_8_6: Block -- assign_stmt_9/binary_8 
        signal binary_8_6_start: Boolean;
        signal Xentry_7_symbol: Boolean;
        signal Xexit_8_symbol: Boolean;
        signal binary_8_inputs_9_symbol : Boolean;
        signal rr_12_symbol : Boolean;
        signal ra_13_symbol : Boolean;
        signal cr_14_symbol : Boolean;
        signal ca_15_symbol : Boolean;
        -- 
      begin -- 
        binary_8_6_start <= Xentry_4_symbol; -- control passed to block
        Xentry_7_symbol  <= binary_8_6_start; -- transition assign_stmt_9/binary_8/$entry
        binary_8_inputs_9: Block -- assign_stmt_9/binary_8/binary_8_inputs 
          signal binary_8_inputs_9_start: Boolean;
          signal Xentry_10_symbol: Boolean;
          signal Xexit_11_symbol: Boolean;
          -- 
        begin -- 
          binary_8_inputs_9_start <= Xentry_7_symbol; -- control passed to block
          Xentry_10_symbol  <= binary_8_inputs_9_start; -- transition assign_stmt_9/binary_8/binary_8_inputs/$entry
          Xexit_11_symbol <= Xentry_10_symbol; -- transition assign_stmt_9/binary_8/binary_8_inputs/$exit
          binary_8_inputs_9_symbol <= Xexit_11_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_9/binary_8/binary_8_inputs
        rr_12_symbol <= binary_8_inputs_9_symbol; -- transition assign_stmt_9/binary_8/rr
        assign_stmt_9Xbinary_8Xrr_cp_to_dp <= rr_12_symbol; -- link to DP
        ra_13_symbol <= assign_stmt_9Xbinary_8Xra_dp_to_cp; -- transition assign_stmt_9/binary_8/ra
        cr_14_symbol <= ra_13_symbol; -- transition assign_stmt_9/binary_8/cr
        assign_stmt_9Xbinary_8Xcr_cp_to_dp <= cr_14_symbol; -- link to DP
        ca_15_symbol <= assign_stmt_9Xbinary_8Xca_dp_to_cp; -- transition assign_stmt_9/binary_8/ca
        Xexit_8_symbol <= ca_15_symbol; -- transition assign_stmt_9/binary_8/$exit
        binary_8_6_symbol <= Xexit_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_9/binary_8
      Xexit_5_symbol <= binary_8_6_symbol; -- transition assign_stmt_9/$exit
      assign_stmt_9_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_9
    Xexit_2_symbol <= assign_stmt_9_3_symbol; -- transition $exit
    fin  <=  '1' when Xexit_2_symbol else '0'; -- fin symbol when control-path exits
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
      sum_mod_call_reqs : out  std_logic_vector(1 downto 0);
      sum_mod_call_acks : in   std_logic_vector(1 downto 0);
      sum_mod_call_data : out  std_logic_vector(39 downto 0);
      sum_mod_call_tag  :  out  std_logic_vector(3 downto 0);
      sum_mod_return_reqs : out  std_logic_vector(1 downto 0);
      sum_mod_return_acks : in   std_logic_vector(1 downto 0);
      sum_mod_return_data : in   std_logic_vector(19 downto 0);
      sum_mod_return_tag :  in   std_logic_vector(3 downto 0);
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
      tag_in: in std_logic_vector(1 downto 0);
      tag_out: out std_logic_vector(1 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module sum_mod
  signal sum_mod_a :  std_logic_vector(9 downto 0);
  signal sum_mod_b :  std_logic_vector(9 downto 0);
  signal sum_mod_c :  std_logic_vector(9 downto 0);
  signal sum_mod_in_args    : std_logic_vector(19 downto 0);
  signal sum_mod_out_args   : std_logic_vector(9 downto 0);
  signal sum_mod_tag_in    : std_logic_vector(1 downto 0);
  signal sum_mod_tag_out   : std_logic_vector(1 downto 0);
  signal sum_mod_start : std_logic;
  signal sum_mod_fin   : std_logic;
  -- caller side aggregated signals for module sum_mod
  signal sum_mod_call_reqs: std_logic_vector(1 downto 0);
  signal sum_mod_call_acks: std_logic_vector(1 downto 0);
  signal sum_mod_return_reqs: std_logic_vector(1 downto 0);
  signal sum_mod_return_acks: std_logic_vector(1 downto 0);
  signal sum_mod_call_data: std_logic_vector(39 downto 0);
  signal sum_mod_call_tag: std_logic_vector(3 downto 0);
  signal sum_mod_return_data: std_logic_vector(19 downto 0);
  signal sum_mod_return_tag: std_logic_vector(3 downto 0);
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
      sum_mod_call_reqs => sum_mod_call_reqs(1 downto 0),
      sum_mod_call_acks => sum_mod_call_acks(1 downto 0),
      sum_mod_call_data => sum_mod_call_data(39 downto 0),
      sum_mod_call_tag => sum_mod_call_tag(3 downto 0),
      sum_mod_return_reqs => sum_mod_return_reqs(1 downto 0),
      sum_mod_return_acks => sum_mod_return_acks(1 downto 0),
      sum_mod_return_data => sum_mod_return_data(19 downto 0),
      sum_mod_return_tag => sum_mod_return_tag(3 downto 0),
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
      num_reqs => 2,
      call_data_width => 20,
      return_data_width => 10,
      callee_tag_length => 2,
      caller_tag_length => 2--
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
