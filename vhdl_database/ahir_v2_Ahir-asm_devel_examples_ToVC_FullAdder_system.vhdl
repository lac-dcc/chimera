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
    a : in  std_logic_vector(0 downto 0);
    b : in  std_logic_vector(0 downto 0);
    cin : in  std_logic_vector(0 downto 0);
    sum : out  std_logic_vector(0 downto 0);
    cout : out  std_logic_vector(0 downto 0);
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
  signal binary_11_inst_req_0 : boolean;
  signal binary_11_inst_ack_0 : boolean;
  signal binary_11_inst_req_1 : boolean;
  signal binary_11_inst_ack_1 : boolean;
  signal binary_19_inst_req_0 : boolean;
  signal binary_19_inst_ack_0 : boolean;
  signal binary_19_inst_req_1 : boolean;
  signal binary_19_inst_ack_1 : boolean;
  signal binary_20_inst_req_0 : boolean;
  signal binary_20_inst_ack_0 : boolean;
  signal binary_20_inst_req_1 : boolean;
  signal binary_20_inst_ack_1 : boolean;
  signal binary_13_inst_req_0 : boolean;
  signal binary_13_inst_ack_0 : boolean;
  signal binary_13_inst_req_1 : boolean;
  signal binary_13_inst_ack_1 : boolean;
  signal binary_23_inst_req_0 : boolean;
  signal binary_23_inst_ack_0 : boolean;
  signal binary_23_inst_req_1 : boolean;
  signal binary_23_inst_ack_1 : boolean;
  signal binary_24_inst_req_0 : boolean;
  signal binary_24_inst_ack_0 : boolean;
  signal binary_24_inst_req_1 : boolean;
  signal binary_24_inst_ack_1 : boolean;
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
    signal parallel_block_stmt_7_3_symbol : Boolean;
    -- 
  begin -- 
    sum_mod_CP_0_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_1_symbol  <= sum_mod_CP_0_start; -- transition $entry
    parallel_block_stmt_7_3: Block -- parallel_block_stmt_7 
      signal parallel_block_stmt_7_3_start: Boolean;
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal assign_stmt_14_6_symbol : Boolean;
      signal assign_stmt_25_29_symbol : Boolean;
      -- 
    begin -- 
      parallel_block_stmt_7_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= parallel_block_stmt_7_3_start; -- transition parallel_block_stmt_7/$entry
      assign_stmt_14_6: Block -- parallel_block_stmt_7/assign_stmt_14 
        signal assign_stmt_14_6_start: Boolean;
        signal Xentry_7_symbol: Boolean;
        signal Xexit_8_symbol: Boolean;
        signal binary_13_9_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_14_6_start <= Xentry_4_symbol; -- control passed to block
        Xentry_7_symbol  <= assign_stmt_14_6_start; -- transition parallel_block_stmt_7/assign_stmt_14/$entry
        binary_13_9: Block -- parallel_block_stmt_7/assign_stmt_14/binary_13 
          signal binary_13_9_start: Boolean;
          signal Xentry_10_symbol: Boolean;
          signal Xexit_11_symbol: Boolean;
          signal binary_13_inputs_12_symbol : Boolean;
          signal rr_25_symbol : Boolean;
          signal ra_26_symbol : Boolean;
          signal cr_27_symbol : Boolean;
          signal ca_28_symbol : Boolean;
          -- 
        begin -- 
          binary_13_9_start <= Xentry_7_symbol; -- control passed to block
          Xentry_10_symbol  <= binary_13_9_start; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/$entry
          binary_13_inputs_12: Block -- parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs 
            signal binary_13_inputs_12_start: Boolean;
            signal Xentry_13_symbol: Boolean;
            signal Xexit_14_symbol: Boolean;
            signal binary_11_15_symbol : Boolean;
            -- 
          begin -- 
            binary_13_inputs_12_start <= Xentry_10_symbol; -- control passed to block
            Xentry_13_symbol  <= binary_13_inputs_12_start; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/$entry
            binary_11_15: Block -- parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11 
              signal binary_11_15_start: Boolean;
              signal Xentry_16_symbol: Boolean;
              signal Xexit_17_symbol: Boolean;
              signal binary_11_inputs_18_symbol : Boolean;
              signal rr_21_symbol : Boolean;
              signal ra_22_symbol : Boolean;
              signal cr_23_symbol : Boolean;
              signal ca_24_symbol : Boolean;
              -- 
            begin -- 
              binary_11_15_start <= Xentry_13_symbol; -- control passed to block
              Xentry_16_symbol  <= binary_11_15_start; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/$entry
              binary_11_inputs_18: Block -- parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/binary_11_inputs 
                signal binary_11_inputs_18_start: Boolean;
                signal Xentry_19_symbol: Boolean;
                signal Xexit_20_symbol: Boolean;
                -- 
              begin -- 
                binary_11_inputs_18_start <= Xentry_16_symbol; -- control passed to block
                Xentry_19_symbol  <= binary_11_inputs_18_start; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/binary_11_inputs/$entry
                Xexit_20_symbol <= Xentry_19_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/binary_11_inputs/$exit
                binary_11_inputs_18_symbol <= Xexit_20_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/binary_11_inputs
              rr_21_symbol <= binary_11_inputs_18_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/rr
              binary_11_inst_req_0 <= rr_21_symbol; -- link to DP
              ra_22_symbol <= binary_11_inst_ack_0; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/ra
              cr_23_symbol <= ra_22_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/cr
              binary_11_inst_req_1 <= cr_23_symbol; -- link to DP
              ca_24_symbol <= binary_11_inst_ack_1; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/ca
              Xexit_17_symbol <= ca_24_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11/$exit
              binary_11_15_symbol <= Xexit_17_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/binary_11
            Xexit_14_symbol <= binary_11_15_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs/$exit
            binary_13_inputs_12_symbol <= Xexit_14_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_7/assign_stmt_14/binary_13/binary_13_inputs
          rr_25_symbol <= binary_13_inputs_12_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/rr
          binary_13_inst_req_0 <= rr_25_symbol; -- link to DP
          ra_26_symbol <= binary_13_inst_ack_0; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/ra
          cr_27_symbol <= ra_26_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/cr
          binary_13_inst_req_1 <= cr_27_symbol; -- link to DP
          ca_28_symbol <= binary_13_inst_ack_1; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/ca
          Xexit_11_symbol <= ca_28_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/binary_13/$exit
          binary_13_9_symbol <= Xexit_11_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_7/assign_stmt_14/binary_13
        Xexit_8_symbol <= binary_13_9_symbol; -- transition parallel_block_stmt_7/assign_stmt_14/$exit
        assign_stmt_14_6_symbol <= Xexit_8_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_7/assign_stmt_14
      assign_stmt_25_29: Block -- parallel_block_stmt_7/assign_stmt_25 
        signal assign_stmt_25_29_start: Boolean;
        signal Xentry_30_symbol: Boolean;
        signal Xexit_31_symbol: Boolean;
        signal binary_24_32_symbol : Boolean;
        -- 
      begin -- 
        assign_stmt_25_29_start <= Xentry_4_symbol; -- control passed to block
        Xentry_30_symbol  <= assign_stmt_25_29_start; -- transition parallel_block_stmt_7/assign_stmt_25/$entry
        binary_24_32: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24 
          signal binary_24_32_start: Boolean;
          signal Xentry_33_symbol: Boolean;
          signal Xexit_34_symbol: Boolean;
          signal binary_24_inputs_35_symbol : Boolean;
          signal rr_68_symbol : Boolean;
          signal ra_69_symbol : Boolean;
          signal cr_70_symbol : Boolean;
          signal ca_71_symbol : Boolean;
          -- 
        begin -- 
          binary_24_32_start <= Xentry_30_symbol; -- control passed to block
          Xentry_33_symbol  <= binary_24_32_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/$entry
          binary_24_inputs_35: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs 
            signal binary_24_inputs_35_start: Boolean;
            signal Xentry_36_symbol: Boolean;
            signal Xexit_37_symbol: Boolean;
            signal binary_20_38_symbol : Boolean;
            signal binary_23_58_symbol : Boolean;
            -- 
          begin -- 
            binary_24_inputs_35_start <= Xentry_33_symbol; -- control passed to block
            Xentry_36_symbol  <= binary_24_inputs_35_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/$entry
            binary_20_38: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20 
              signal binary_20_38_start: Boolean;
              signal Xentry_39_symbol: Boolean;
              signal Xexit_40_symbol: Boolean;
              signal binary_20_inputs_41_symbol : Boolean;
              signal rr_54_symbol : Boolean;
              signal ra_55_symbol : Boolean;
              signal cr_56_symbol : Boolean;
              signal ca_57_symbol : Boolean;
              -- 
            begin -- 
              binary_20_38_start <= Xentry_36_symbol; -- control passed to block
              Xentry_39_symbol  <= binary_20_38_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/$entry
              binary_20_inputs_41: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs 
                signal binary_20_inputs_41_start: Boolean;
                signal Xentry_42_symbol: Boolean;
                signal Xexit_43_symbol: Boolean;
                signal binary_19_44_symbol : Boolean;
                -- 
              begin -- 
                binary_20_inputs_41_start <= Xentry_39_symbol; -- control passed to block
                Xentry_42_symbol  <= binary_20_inputs_41_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/$entry
                binary_19_44: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19 
                  signal binary_19_44_start: Boolean;
                  signal Xentry_45_symbol: Boolean;
                  signal Xexit_46_symbol: Boolean;
                  signal binary_19_inputs_47_symbol : Boolean;
                  signal rr_50_symbol : Boolean;
                  signal ra_51_symbol : Boolean;
                  signal cr_52_symbol : Boolean;
                  signal ca_53_symbol : Boolean;
                  -- 
                begin -- 
                  binary_19_44_start <= Xentry_42_symbol; -- control passed to block
                  Xentry_45_symbol  <= binary_19_44_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/$entry
                  binary_19_inputs_47: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/binary_19_inputs 
                    signal binary_19_inputs_47_start: Boolean;
                    signal Xentry_48_symbol: Boolean;
                    signal Xexit_49_symbol: Boolean;
                    -- 
                  begin -- 
                    binary_19_inputs_47_start <= Xentry_45_symbol; -- control passed to block
                    Xentry_48_symbol  <= binary_19_inputs_47_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/binary_19_inputs/$entry
                    Xexit_49_symbol <= Xentry_48_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/binary_19_inputs/$exit
                    binary_19_inputs_47_symbol <= Xexit_49_symbol; -- control passed from block 
                    -- 
                  end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/binary_19_inputs
                  rr_50_symbol <= binary_19_inputs_47_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/rr
                  binary_19_inst_req_0 <= rr_50_symbol; -- link to DP
                  ra_51_symbol <= binary_19_inst_ack_0; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/ra
                  cr_52_symbol <= ra_51_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/cr
                  binary_19_inst_req_1 <= cr_52_symbol; -- link to DP
                  ca_53_symbol <= binary_19_inst_ack_1; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/ca
                  Xexit_46_symbol <= ca_53_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19/$exit
                  binary_19_44_symbol <= Xexit_46_symbol; -- control passed from block 
                  -- 
                end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/binary_19
                Xexit_43_symbol <= binary_19_44_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs/$exit
                binary_20_inputs_41_symbol <= Xexit_43_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/binary_20_inputs
              rr_54_symbol <= binary_20_inputs_41_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/rr
              binary_20_inst_req_0 <= rr_54_symbol; -- link to DP
              ra_55_symbol <= binary_20_inst_ack_0; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/ra
              cr_56_symbol <= ra_55_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/cr
              binary_20_inst_req_1 <= cr_56_symbol; -- link to DP
              ca_57_symbol <= binary_20_inst_ack_1; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/ca
              Xexit_40_symbol <= ca_57_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20/$exit
              binary_20_38_symbol <= Xexit_40_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_20
            binary_23_58: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23 
              signal binary_23_58_start: Boolean;
              signal Xentry_59_symbol: Boolean;
              signal Xexit_60_symbol: Boolean;
              signal binary_23_inputs_61_symbol : Boolean;
              signal rr_64_symbol : Boolean;
              signal ra_65_symbol : Boolean;
              signal cr_66_symbol : Boolean;
              signal ca_67_symbol : Boolean;
              -- 
            begin -- 
              binary_23_58_start <= Xentry_36_symbol; -- control passed to block
              Xentry_59_symbol  <= binary_23_58_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/$entry
              binary_23_inputs_61: Block -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/binary_23_inputs 
                signal binary_23_inputs_61_start: Boolean;
                signal Xentry_62_symbol: Boolean;
                signal Xexit_63_symbol: Boolean;
                -- 
              begin -- 
                binary_23_inputs_61_start <= Xentry_59_symbol; -- control passed to block
                Xentry_62_symbol  <= binary_23_inputs_61_start; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/binary_23_inputs/$entry
                Xexit_63_symbol <= Xentry_62_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/binary_23_inputs/$exit
                binary_23_inputs_61_symbol <= Xexit_63_symbol; -- control passed from block 
                -- 
              end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/binary_23_inputs
              rr_64_symbol <= binary_23_inputs_61_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/rr
              binary_23_inst_req_0 <= rr_64_symbol; -- link to DP
              ra_65_symbol <= binary_23_inst_ack_0; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/ra
              cr_66_symbol <= ra_65_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/cr
              binary_23_inst_req_1 <= cr_66_symbol; -- link to DP
              ca_67_symbol <= binary_23_inst_ack_1; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/ca
              Xexit_60_symbol <= ca_67_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23/$exit
              binary_23_58_symbol <= Xexit_60_symbol; -- control passed from block 
              -- 
            end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/binary_23
            Xexit_37_block : Block -- non-trivial join transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/$exit 
              signal Xexit_37_predecessors: BooleanArray(1 downto 0);
              signal Xexit_37_p0_pred: BooleanArray(0 downto 0);
              signal Xexit_37_p0_succ: BooleanArray(0 downto 0);
              signal Xexit_37_p1_pred: BooleanArray(0 downto 0);
              signal Xexit_37_p1_succ: BooleanArray(0 downto 0);
              -- 
            begin -- 
              Xexit_37_0_place: Place -- 
                generic map(marking => false)
                port map( -- 
                  Xexit_37_p0_pred, Xexit_37_p0_succ, Xexit_37_predecessors(0), clk, reset-- 
                ); -- 
              Xexit_37_p0_succ(0) <=  Xexit_37_symbol;
              Xexit_37_p0_pred(0) <=  binary_20_38_symbol;
              Xexit_37_1_place: Place -- 
                generic map(marking => false)
                port map( -- 
                  Xexit_37_p1_pred, Xexit_37_p1_succ, Xexit_37_predecessors(1), clk, reset-- 
                ); -- 
              Xexit_37_p1_succ(0) <=  Xexit_37_symbol;
              Xexit_37_p1_pred(0) <=  binary_23_58_symbol;
              Xexit_37_symbol <= AndReduce(Xexit_37_predecessors); 
              -- 
            end Block; -- non-trivial join transition parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs/$exit
            binary_24_inputs_35_symbol <= Xexit_37_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24/binary_24_inputs
          rr_68_symbol <= binary_24_inputs_35_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/rr
          binary_24_inst_req_0 <= rr_68_symbol; -- link to DP
          ra_69_symbol <= binary_24_inst_ack_0; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/ra
          cr_70_symbol <= ra_69_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/cr
          binary_24_inst_req_1 <= cr_70_symbol; -- link to DP
          ca_71_symbol <= binary_24_inst_ack_1; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/ca
          Xexit_34_symbol <= ca_71_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/binary_24/$exit
          binary_24_32_symbol <= Xexit_34_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_7/assign_stmt_25/binary_24
        Xexit_31_symbol <= binary_24_32_symbol; -- transition parallel_block_stmt_7/assign_stmt_25/$exit
        assign_stmt_25_29_symbol <= Xexit_31_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_7/assign_stmt_25
      Xexit_5_block : Block -- non-trivial join transition parallel_block_stmt_7/$exit 
        signal Xexit_5_predecessors: BooleanArray(1 downto 0);
        signal Xexit_5_p0_pred: BooleanArray(0 downto 0);
        signal Xexit_5_p0_succ: BooleanArray(0 downto 0);
        signal Xexit_5_p1_pred: BooleanArray(0 downto 0);
        signal Xexit_5_p1_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        Xexit_5_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_5_p0_pred, Xexit_5_p0_succ, Xexit_5_predecessors(0), clk, reset-- 
          ); -- 
        Xexit_5_p0_succ(0) <=  Xexit_5_symbol;
        Xexit_5_p0_pred(0) <=  assign_stmt_14_6_symbol;
        Xexit_5_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            Xexit_5_p1_pred, Xexit_5_p1_succ, Xexit_5_predecessors(1), clk, reset-- 
          ); -- 
        Xexit_5_p1_succ(0) <=  Xexit_5_symbol;
        Xexit_5_p1_pred(0) <=  assign_stmt_25_29_symbol;
        Xexit_5_symbol <= AndReduce(Xexit_5_predecessors); 
        -- 
      end Block; -- non-trivial join transition parallel_block_stmt_7/$exit
      parallel_block_stmt_7_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- parallel_block_stmt_7
    Xexit_2_symbol <= parallel_block_stmt_7_3_symbol; -- transition $exit
    fin  <=  '1' when Xexit_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal binary_11_wire : std_logic_vector(0 downto 0);
    signal binary_19_wire : std_logic_vector(0 downto 0);
    signal binary_20_wire : std_logic_vector(0 downto 0);
    signal binary_23_wire : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    -- shared split operator group (0) : binary_11_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= a & b;
      binary_11_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntXor",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_11_inst_req_0,
          ackL => binary_11_inst_ack_0,
          reqR => binary_11_inst_req_1,
          ackR => binary_11_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_13_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_11_wire & cin;
      sum <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntXor",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_13_inst_req_0,
          ackL => binary_13_inst_ack_0,
          reqR => binary_13_inst_req_1,
          ackR => binary_13_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_19_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= a & b;
      binary_19_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_19_inst_req_0,
          ackL => binary_19_inst_ack_0,
          reqR => binary_19_inst_req_1,
          ackR => binary_19_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 2
    -- shared split operator group (3) : binary_20_inst 
    SplitOperatorGroup3: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= cin & binary_19_wire;
      binary_20_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_20_inst_req_0,
          ackL => binary_20_inst_ack_0,
          reqR => binary_20_inst_req_1,
          ackR => binary_20_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 3
    -- shared split operator group (4) : binary_23_inst 
    SplitOperatorGroup4: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= a & b;
      binary_23_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAnd",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => true--
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
    end Block; -- split operator group 4
    -- shared split operator group (5) : binary_24_inst 
    SplitOperatorGroup5: Block -- 
      signal data_in: std_logic_vector(1 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_20_wire & binary_23_wire;
      cout <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 1, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_24_inst_req_0,
          ackL => binary_24_inst_ack_0,
          reqR => binary_24_inst_req_1,
          ackR => binary_24_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 5
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
    sum_mod_a : in  std_logic_vector(0 downto 0);
    sum_mod_b : in  std_logic_vector(0 downto 0);
    sum_mod_cin : in  std_logic_vector(0 downto 0);
    sum_mod_sum : out  std_logic_vector(0 downto 0);
    sum_mod_cout : out  std_logic_vector(0 downto 0);
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
      a : in  std_logic_vector(0 downto 0);
      b : in  std_logic_vector(0 downto 0);
      cin : in  std_logic_vector(0 downto 0);
      sum : out  std_logic_vector(0 downto 0);
      cout : out  std_logic_vector(0 downto 0);
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
      cin => sum_mod_cin,
      sum => sum_mod_sum,
      cout => sum_mod_cout,
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
      sum_mod_a : in  std_logic_vector(0 downto 0);
      sum_mod_b : in  std_logic_vector(0 downto 0);
      sum_mod_cin : in  std_logic_vector(0 downto 0);
      sum_mod_sum : out  std_logic_vector(0 downto 0);
      sum_mod_cout : out  std_logic_vector(0 downto 0);
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
  signal sum_mod_a :  std_logic_vector(0 downto 0);
  signal sum_mod_b :  std_logic_vector(0 downto 0);
  signal sum_mod_cin :  std_logic_vector(0 downto 0);
  signal sum_mod_sum :   std_logic_vector(0 downto 0);
  signal sum_mod_cout :   std_logic_vector(0 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= "1";
  sum_mod_b <= "1";
  sum_mod_cin <= "1";

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
      sum_mod_cin => sum_mod_cin,
      sum_mod_sum => sum_mod_sum,
      sum_mod_cout => sum_mod_cout,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
