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
entity shift_and_add_multiplier is -- 
  port ( -- 
    a : in  std_logic_vector(9 downto 0);
    b : in  std_logic_vector(9 downto 0);
    aXb : out  std_logic_vector(19 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity shift_and_add_multiplier;
architecture Default of shift_and_add_multiplier is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal binary_57_inst_req_0 : boolean;
  signal binary_57_inst_ack_0 : boolean;
  signal binary_57_inst_req_1 : boolean;
  signal binary_47_inst_req_0 : boolean;
  signal binary_47_inst_ack_0 : boolean;
  signal binary_47_inst_req_1 : boolean;
  signal binary_47_inst_ack_1 : boolean;
  signal binary_50_inst_req_0 : boolean;
  signal binary_50_inst_ack_0 : boolean;
  signal binary_50_inst_req_1 : boolean;
  signal binary_50_inst_ack_1 : boolean;
  signal binary_52_inst_req_0 : boolean;
  signal binary_52_inst_ack_0 : boolean;
  signal binary_52_inst_req_1 : boolean;
  signal binary_52_inst_ack_1 : boolean;
  signal binary_54_inst_req_0 : boolean;
  signal binary_54_inst_ack_0 : boolean;
  signal binary_54_inst_req_1 : boolean;
  signal binary_54_inst_ack_1 : boolean;
  signal binary_57_inst_ack_1 : boolean;
  signal binary_59_inst_req_0 : boolean;
  signal binary_59_inst_ack_0 : boolean;
  signal binary_59_inst_req_1 : boolean;
  signal binary_59_inst_ack_1 : boolean;
  signal ternary_60_inst_req_0 : boolean;
  signal ternary_60_inst_ack_0 : boolean;
  signal binary_62_inst_req_0 : boolean;
  signal binary_62_inst_ack_0 : boolean;
  signal binary_62_inst_req_1 : boolean;
  signal binary_62_inst_ack_1 : boolean;
  signal binary_64_inst_req_0 : boolean;
  signal binary_64_inst_ack_0 : boolean;
  signal binary_64_inst_req_1 : boolean;
  signal binary_64_inst_ack_1 : boolean;
  signal binary_66_inst_req_0 : boolean;
  signal binary_66_inst_ack_0 : boolean;
  signal binary_66_inst_req_1 : boolean;
  signal binary_66_inst_ack_1 : boolean;
  signal type_cast_70_inst_req_0 : boolean;
  signal type_cast_70_inst_ack_0 : boolean;
  signal binary_77_inst_req_0 : boolean;
  signal binary_77_inst_ack_0 : boolean;
  signal binary_77_inst_req_1 : boolean;
  signal binary_77_inst_ack_1 : boolean;
  signal binary_80_inst_req_0 : boolean;
  signal binary_80_inst_ack_0 : boolean;
  signal binary_80_inst_req_1 : boolean;
  signal binary_80_inst_ack_1 : boolean;
  signal binary_82_inst_req_0 : boolean;
  signal binary_82_inst_ack_0 : boolean;
  signal binary_82_inst_req_1 : boolean;
  signal binary_82_inst_ack_1 : boolean;
  signal binary_84_inst_req_0 : boolean;
  signal binary_84_inst_ack_0 : boolean;
  signal binary_84_inst_req_1 : boolean;
  signal binary_84_inst_ack_1 : boolean;
  signal binary_117_inst_req_1 : boolean;
  signal binary_117_inst_ack_1 : boolean;
  signal binary_87_inst_req_0 : boolean;
  signal binary_87_inst_ack_0 : boolean;
  signal binary_87_inst_req_1 : boolean;
  signal binary_87_inst_ack_1 : boolean;
  signal binary_89_inst_req_0 : boolean;
  signal binary_89_inst_ack_0 : boolean;
  signal binary_89_inst_req_1 : boolean;
  signal binary_89_inst_ack_1 : boolean;
  signal ternary_90_inst_req_0 : boolean;
  signal ternary_90_inst_ack_0 : boolean;
  signal binary_95_inst_req_0 : boolean;
  signal binary_95_inst_ack_0 : boolean;
  signal binary_95_inst_req_1 : boolean;
  signal binary_95_inst_ack_1 : boolean;
  signal type_cast_96_inst_req_0 : boolean;
  signal type_cast_96_inst_ack_0 : boolean;
  signal binary_102_inst_req_0 : boolean;
  signal binary_102_inst_ack_0 : boolean;
  signal binary_102_inst_req_1 : boolean;
  signal binary_102_inst_ack_1 : boolean;
  signal binary_108_inst_req_0 : boolean;
  signal binary_108_inst_ack_0 : boolean;
  signal binary_108_inst_req_1 : boolean;
  signal binary_108_inst_ack_1 : boolean;
  signal if_stmt_105_branch_req_0 : boolean;
  signal if_stmt_105_branch_ack_1 : boolean;
  signal if_stmt_105_branch_ack_0 : boolean;
  signal phi_stmt_23_req_0 : boolean;
  signal phi_stmt_27_req_0 : boolean;
  signal phi_stmt_31_req_0 : boolean;
  signal phi_stmt_37_req_0 : boolean;
  signal phi_stmt_23_req_1 : boolean;
  signal phi_stmt_27_req_1 : boolean;
  signal binary_36_inst_req_0 : boolean;
  signal binary_36_inst_ack_0 : boolean;
  signal binary_36_inst_req_1 : boolean;
  signal binary_36_inst_ack_1 : boolean;
  signal phi_stmt_31_req_1 : boolean;
  signal phi_stmt_37_req_1 : boolean;
  signal phi_stmt_23_ack_0 : boolean;
  signal phi_stmt_27_ack_0 : boolean;
  signal phi_stmt_31_ack_0 : boolean;
  signal phi_stmt_37_ack_0 : boolean;
  signal binary_117_inst_req_0 : boolean;
  signal binary_117_inst_ack_0 : boolean;
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
  shift_and_add_multiplier_CP_0: Block -- control-path 
    signal shift_and_add_multiplier_CP_0_start: Boolean;
    signal Xentry_1_symbol: Boolean;
    signal Xexit_2_symbol: Boolean;
    signal branch_block_stmt_21_3_symbol : Boolean;
    signal assign_stmt_118_327_symbol : Boolean;
    -- 
  begin -- 
    shift_and_add_multiplier_CP_0_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_1_symbol  <= shift_and_add_multiplier_CP_0_start; -- transition $entry
    branch_block_stmt_21_3: Block -- branch_block_stmt_21 
      signal branch_block_stmt_21_3_start: Boolean;
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal branch_block_stmt_21_x_xentry_x_xx_x6_symbol : Boolean;
      signal branch_block_stmt_21_x_xexit_x_xx_x7_symbol : Boolean;
      signal merge_stmt_22_x_xexit_x_xx_x8_symbol : Boolean;
      signal parallel_block_stmt_42_x_xentry_x_xx_x9_symbol : Boolean;
      signal parallel_block_stmt_42_x_xexit_x_xx_x10_symbol : Boolean;
      signal if_stmt_105_x_xentry_x_xx_x11_symbol : Boolean;
      signal parallel_block_stmt_42_12_symbol : Boolean;
      signal if_stmt_105_eval_test_232_symbol : Boolean;
      signal binary_108_place_246_symbol : Boolean;
      signal if_stmt_105_if_link_247_symbol : Boolean;
      signal if_stmt_105_else_link_251_symbol : Boolean;
      signal stmt_109_x_xentry_x_xx_x255_symbol : Boolean;
      signal stmt_109_x_xexit_x_xx_x256_symbol : Boolean;
      signal stmt_109_257_symbol : Boolean;
      signal loopback_260_symbol : Boolean;
      signal branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261_symbol : Boolean;
      signal loopback_PhiReq_290_symbol : Boolean;
      signal merge_stmt_22_PhiReqMerge_319_symbol : Boolean;
      signal merge_stmt_22_PhiAck_320_symbol : Boolean;
      -- 
    begin -- 
      branch_block_stmt_21_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= branch_block_stmt_21_3_start; -- transition branch_block_stmt_21/$entry
      branch_block_stmt_21_x_xentry_x_xx_x6_symbol  <=  Xentry_4_symbol; -- place branch_block_stmt_21/branch_block_stmt_21__entry__ (optimized away) 
      branch_block_stmt_21_x_xexit_x_xx_x7_symbol  <=  stmt_109_x_xexit_x_xx_x256_symbol; -- place branch_block_stmt_21/branch_block_stmt_21__exit__ (optimized away) 
      merge_stmt_22_x_xexit_x_xx_x8_symbol  <=  merge_stmt_22_PhiAck_320_symbol; -- place branch_block_stmt_21/merge_stmt_22__exit__ (optimized away) 
      parallel_block_stmt_42_x_xentry_x_xx_x9_symbol  <=  merge_stmt_22_x_xexit_x_xx_x8_symbol; -- place branch_block_stmt_21/parallel_block_stmt_42__entry__ (optimized away) 
      parallel_block_stmt_42_x_xexit_x_xx_x10_symbol  <=  parallel_block_stmt_42_12_symbol; -- place branch_block_stmt_21/parallel_block_stmt_42__exit__ (optimized away) 
      if_stmt_105_x_xentry_x_xx_x11_symbol  <=  parallel_block_stmt_42_x_xexit_x_xx_x10_symbol; -- place branch_block_stmt_21/if_stmt_105__entry__ (optimized away) 
      parallel_block_stmt_42_12: Block -- branch_block_stmt_21/parallel_block_stmt_42 
        signal parallel_block_stmt_42_12_start: Boolean;
        signal Xentry_13_symbol: Boolean;
        signal Xexit_14_symbol: Boolean;
        signal series_block_stmt_43_15_symbol : Boolean;
        signal series_block_stmt_73_127_symbol : Boolean;
        signal assign_stmt_103_219_symbol : Boolean;
        -- 
      begin -- 
        parallel_block_stmt_42_12_start <= parallel_block_stmt_42_x_xentry_x_xx_x9_symbol; -- control passed to block
        Xentry_13_symbol  <= parallel_block_stmt_42_12_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/$entry
        series_block_stmt_43_15: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43 
          signal series_block_stmt_43_15_start: Boolean;
          signal Xentry_16_symbol: Boolean;
          signal Xexit_17_symbol: Boolean;
          signal assign_stmt_67_18_symbol : Boolean;
          signal assign_stmt_71_119_symbol : Boolean;
          -- 
        begin -- 
          series_block_stmt_43_15_start <= Xentry_13_symbol; -- control passed to block
          Xentry_16_symbol  <= series_block_stmt_43_15_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/$entry
          assign_stmt_67_18: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67 
            signal assign_stmt_67_18_start: Boolean;
            signal Xentry_19_symbol: Boolean;
            signal Xexit_20_symbol: Boolean;
            signal binary_66_21_symbol : Boolean;
            -- 
          begin -- 
            assign_stmt_67_18_start <= Xentry_16_symbol; -- control passed to block
            Xentry_19_symbol  <= assign_stmt_67_18_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/$entry
            binary_66_21: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66 
              signal binary_66_21_start: Boolean;
              signal Xentry_22_symbol: Boolean;
              signal Xexit_23_symbol: Boolean;
              signal binary_66_inputs_24_symbol : Boolean;
              signal rr_115_symbol : Boolean;
              signal ra_116_symbol : Boolean;
              signal cr_117_symbol : Boolean;
              signal ca_118_symbol : Boolean;
              -- 
            begin -- 
              binary_66_21_start <= Xentry_19_symbol; -- control passed to block
              Xentry_22_symbol  <= binary_66_21_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/$entry
              binary_66_inputs_24: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs 
                signal binary_66_inputs_24_start: Boolean;
                signal Xentry_25_symbol: Boolean;
                signal Xexit_26_symbol: Boolean;
                signal binary_64_27_symbol : Boolean;
                -- 
              begin -- 
                binary_66_inputs_24_start <= Xentry_22_symbol; -- control passed to block
                Xentry_25_symbol  <= binary_66_inputs_24_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/$entry
                binary_64_27: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64 
                  signal binary_64_27_start: Boolean;
                  signal Xentry_28_symbol: Boolean;
                  signal Xexit_29_symbol: Boolean;
                  signal binary_64_inputs_30_symbol : Boolean;
                  signal rr_111_symbol : Boolean;
                  signal ra_112_symbol : Boolean;
                  signal cr_113_symbol : Boolean;
                  signal ca_114_symbol : Boolean;
                  -- 
                begin -- 
                  binary_64_27_start <= Xentry_25_symbol; -- control passed to block
                  Xentry_28_symbol  <= binary_64_27_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/$entry
                  binary_64_inputs_30: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs 
                    signal binary_64_inputs_30_start: Boolean;
                    signal Xentry_31_symbol: Boolean;
                    signal Xexit_32_symbol: Boolean;
                    signal binary_62_33_symbol : Boolean;
                    -- 
                  begin -- 
                    binary_64_inputs_30_start <= Xentry_28_symbol; -- control passed to block
                    Xentry_31_symbol  <= binary_64_inputs_30_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/$entry
                    binary_62_33: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62 
                      signal binary_62_33_start: Boolean;
                      signal Xentry_34_symbol: Boolean;
                      signal Xexit_35_symbol: Boolean;
                      signal binary_62_inputs_36_symbol : Boolean;
                      signal rr_107_symbol : Boolean;
                      signal ra_108_symbol : Boolean;
                      signal cr_109_symbol : Boolean;
                      signal ca_110_symbol : Boolean;
                      -- 
                    begin -- 
                      binary_62_33_start <= Xentry_31_symbol; -- control passed to block
                      Xentry_34_symbol  <= binary_62_33_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/$entry
                      binary_62_inputs_36: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs 
                        signal binary_62_inputs_36_start: Boolean;
                        signal Xentry_37_symbol: Boolean;
                        signal Xexit_38_symbol: Boolean;
                        signal ternary_60_39_symbol : Boolean;
                        -- 
                      begin -- 
                        binary_62_inputs_36_start <= Xentry_34_symbol; -- control passed to block
                        Xentry_37_symbol  <= binary_62_inputs_36_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/$entry
                        ternary_60_39: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60 
                          signal ternary_60_39_start: Boolean;
                          signal Xentry_40_symbol: Boolean;
                          signal Xexit_41_symbol: Boolean;
                          signal ternary_60_inputs_42_symbol : Boolean;
                          signal req_105_symbol : Boolean;
                          signal ack_106_symbol : Boolean;
                          -- 
                        begin -- 
                          ternary_60_39_start <= Xentry_37_symbol; -- control passed to block
                          Xentry_40_symbol  <= ternary_60_39_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/$entry
                          ternary_60_inputs_42: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs 
                            signal ternary_60_inputs_42_start: Boolean;
                            signal Xentry_43_symbol: Boolean;
                            signal Xexit_44_symbol: Boolean;
                            signal binary_47_45_symbol : Boolean;
                            signal binary_54_55_symbol : Boolean;
                            signal binary_59_85_symbol : Boolean;
                            -- 
                          begin -- 
                            ternary_60_inputs_42_start <= Xentry_40_symbol; -- control passed to block
                            Xentry_43_symbol  <= ternary_60_inputs_42_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/$entry
                            binary_47_45: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47 
                              signal binary_47_45_start: Boolean;
                              signal Xentry_46_symbol: Boolean;
                              signal Xexit_47_symbol: Boolean;
                              signal binary_47_inputs_48_symbol : Boolean;
                              signal rr_51_symbol : Boolean;
                              signal ra_52_symbol : Boolean;
                              signal cr_53_symbol : Boolean;
                              signal ca_54_symbol : Boolean;
                              -- 
                            begin -- 
                              binary_47_45_start <= Xentry_43_symbol; -- control passed to block
                              Xentry_46_symbol  <= binary_47_45_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/$entry
                              binary_47_inputs_48: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/binary_47_inputs 
                                signal binary_47_inputs_48_start: Boolean;
                                signal Xentry_49_symbol: Boolean;
                                signal Xexit_50_symbol: Boolean;
                                -- 
                              begin -- 
                                binary_47_inputs_48_start <= Xentry_46_symbol; -- control passed to block
                                Xentry_49_symbol  <= binary_47_inputs_48_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/binary_47_inputs/$entry
                                Xexit_50_symbol <= Xentry_49_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/binary_47_inputs/$exit
                                binary_47_inputs_48_symbol <= Xexit_50_symbol; -- control passed from block 
                                -- 
                              end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/binary_47_inputs
                              rr_51_symbol <= binary_47_inputs_48_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/rr
                              binary_47_inst_req_0 <= rr_51_symbol; -- link to DP
                              ra_52_symbol <= binary_47_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/ra
                              cr_53_symbol <= ra_52_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/cr
                              binary_47_inst_req_1 <= cr_53_symbol; -- link to DP
                              ca_54_symbol <= binary_47_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/ca
                              Xexit_47_symbol <= ca_54_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47/$exit
                              binary_47_45_symbol <= Xexit_47_symbol; -- control passed from block 
                              -- 
                            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_47
                            binary_54_55: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54 
                              signal binary_54_55_start: Boolean;
                              signal Xentry_56_symbol: Boolean;
                              signal Xexit_57_symbol: Boolean;
                              signal binary_54_inputs_58_symbol : Boolean;
                              signal rr_81_symbol : Boolean;
                              signal ra_82_symbol : Boolean;
                              signal cr_83_symbol : Boolean;
                              signal ca_84_symbol : Boolean;
                              -- 
                            begin -- 
                              binary_54_55_start <= Xentry_43_symbol; -- control passed to block
                              Xentry_56_symbol  <= binary_54_55_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/$entry
                              binary_54_inputs_58: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs 
                                signal binary_54_inputs_58_start: Boolean;
                                signal Xentry_59_symbol: Boolean;
                                signal Xexit_60_symbol: Boolean;
                                signal binary_52_61_symbol : Boolean;
                                -- 
                              begin -- 
                                binary_54_inputs_58_start <= Xentry_56_symbol; -- control passed to block
                                Xentry_59_symbol  <= binary_54_inputs_58_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/$entry
                                binary_52_61: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52 
                                  signal binary_52_61_start: Boolean;
                                  signal Xentry_62_symbol: Boolean;
                                  signal Xexit_63_symbol: Boolean;
                                  signal binary_52_inputs_64_symbol : Boolean;
                                  signal rr_77_symbol : Boolean;
                                  signal ra_78_symbol : Boolean;
                                  signal cr_79_symbol : Boolean;
                                  signal ca_80_symbol : Boolean;
                                  -- 
                                begin -- 
                                  binary_52_61_start <= Xentry_59_symbol; -- control passed to block
                                  Xentry_62_symbol  <= binary_52_61_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/$entry
                                  binary_52_inputs_64: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs 
                                    signal binary_52_inputs_64_start: Boolean;
                                    signal Xentry_65_symbol: Boolean;
                                    signal Xexit_66_symbol: Boolean;
                                    signal binary_50_67_symbol : Boolean;
                                    -- 
                                  begin -- 
                                    binary_52_inputs_64_start <= Xentry_62_symbol; -- control passed to block
                                    Xentry_65_symbol  <= binary_52_inputs_64_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/$entry
                                    binary_50_67: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50 
                                      signal binary_50_67_start: Boolean;
                                      signal Xentry_68_symbol: Boolean;
                                      signal Xexit_69_symbol: Boolean;
                                      signal binary_50_inputs_70_symbol : Boolean;
                                      signal rr_73_symbol : Boolean;
                                      signal ra_74_symbol : Boolean;
                                      signal cr_75_symbol : Boolean;
                                      signal ca_76_symbol : Boolean;
                                      -- 
                                    begin -- 
                                      binary_50_67_start <= Xentry_65_symbol; -- control passed to block
                                      Xentry_68_symbol  <= binary_50_67_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/$entry
                                      binary_50_inputs_70: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/binary_50_inputs 
                                        signal binary_50_inputs_70_start: Boolean;
                                        signal Xentry_71_symbol: Boolean;
                                        signal Xexit_72_symbol: Boolean;
                                        -- 
                                      begin -- 
                                        binary_50_inputs_70_start <= Xentry_68_symbol; -- control passed to block
                                        Xentry_71_symbol  <= binary_50_inputs_70_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/binary_50_inputs/$entry
                                        Xexit_72_symbol <= Xentry_71_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/binary_50_inputs/$exit
                                        binary_50_inputs_70_symbol <= Xexit_72_symbol; -- control passed from block 
                                        -- 
                                      end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/binary_50_inputs
                                      rr_73_symbol <= binary_50_inputs_70_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/rr
                                      binary_50_inst_req_0 <= rr_73_symbol; -- link to DP
                                      ra_74_symbol <= binary_50_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/ra
                                      cr_75_symbol <= ra_74_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/cr
                                      binary_50_inst_req_1 <= cr_75_symbol; -- link to DP
                                      ca_76_symbol <= binary_50_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/ca
                                      Xexit_69_symbol <= ca_76_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50/$exit
                                      binary_50_67_symbol <= Xexit_69_symbol; -- control passed from block 
                                      -- 
                                    end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/binary_50
                                    Xexit_66_symbol <= binary_50_67_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs/$exit
                                    binary_52_inputs_64_symbol <= Xexit_66_symbol; -- control passed from block 
                                    -- 
                                  end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/binary_52_inputs
                                  rr_77_symbol <= binary_52_inputs_64_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/rr
                                  binary_52_inst_req_0 <= rr_77_symbol; -- link to DP
                                  ra_78_symbol <= binary_52_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/ra
                                  cr_79_symbol <= ra_78_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/cr
                                  binary_52_inst_req_1 <= cr_79_symbol; -- link to DP
                                  ca_80_symbol <= binary_52_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/ca
                                  Xexit_63_symbol <= ca_80_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52/$exit
                                  binary_52_61_symbol <= Xexit_63_symbol; -- control passed from block 
                                  -- 
                                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/binary_52
                                Xexit_60_symbol <= binary_52_61_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs/$exit
                                binary_54_inputs_58_symbol <= Xexit_60_symbol; -- control passed from block 
                                -- 
                              end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/binary_54_inputs
                              rr_81_symbol <= binary_54_inputs_58_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/rr
                              binary_54_inst_req_0 <= rr_81_symbol; -- link to DP
                              ra_82_symbol <= binary_54_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/ra
                              cr_83_symbol <= ra_82_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/cr
                              binary_54_inst_req_1 <= cr_83_symbol; -- link to DP
                              ca_84_symbol <= binary_54_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/ca
                              Xexit_57_symbol <= ca_84_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54/$exit
                              binary_54_55_symbol <= Xexit_57_symbol; -- control passed from block 
                              -- 
                            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_54
                            binary_59_85: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59 
                              signal binary_59_85_start: Boolean;
                              signal Xentry_86_symbol: Boolean;
                              signal Xexit_87_symbol: Boolean;
                              signal binary_59_inputs_88_symbol : Boolean;
                              signal rr_101_symbol : Boolean;
                              signal ra_102_symbol : Boolean;
                              signal cr_103_symbol : Boolean;
                              signal ca_104_symbol : Boolean;
                              -- 
                            begin -- 
                              binary_59_85_start <= Xentry_43_symbol; -- control passed to block
                              Xentry_86_symbol  <= binary_59_85_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/$entry
                              binary_59_inputs_88: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs 
                                signal binary_59_inputs_88_start: Boolean;
                                signal Xentry_89_symbol: Boolean;
                                signal Xexit_90_symbol: Boolean;
                                signal binary_57_91_symbol : Boolean;
                                -- 
                              begin -- 
                                binary_59_inputs_88_start <= Xentry_86_symbol; -- control passed to block
                                Xentry_89_symbol  <= binary_59_inputs_88_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/$entry
                                binary_57_91: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57 
                                  signal binary_57_91_start: Boolean;
                                  signal Xentry_92_symbol: Boolean;
                                  signal Xexit_93_symbol: Boolean;
                                  signal binary_57_inputs_94_symbol : Boolean;
                                  signal rr_97_symbol : Boolean;
                                  signal ra_98_symbol : Boolean;
                                  signal cr_99_symbol : Boolean;
                                  signal ca_100_symbol : Boolean;
                                  -- 
                                begin -- 
                                  binary_57_91_start <= Xentry_89_symbol; -- control passed to block
                                  Xentry_92_symbol  <= binary_57_91_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/$entry
                                  binary_57_inputs_94: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/binary_57_inputs 
                                    signal binary_57_inputs_94_start: Boolean;
                                    signal Xentry_95_symbol: Boolean;
                                    signal Xexit_96_symbol: Boolean;
                                    -- 
                                  begin -- 
                                    binary_57_inputs_94_start <= Xentry_92_symbol; -- control passed to block
                                    Xentry_95_symbol  <= binary_57_inputs_94_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/binary_57_inputs/$entry
                                    Xexit_96_symbol <= Xentry_95_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/binary_57_inputs/$exit
                                    binary_57_inputs_94_symbol <= Xexit_96_symbol; -- control passed from block 
                                    -- 
                                  end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/binary_57_inputs
                                  rr_97_symbol <= binary_57_inputs_94_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/rr
                                  binary_57_inst_req_0 <= rr_97_symbol; -- link to DP
                                  ra_98_symbol <= binary_57_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/ra
                                  cr_99_symbol <= ra_98_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/cr
                                  binary_57_inst_req_1 <= cr_99_symbol; -- link to DP
                                  ca_100_symbol <= binary_57_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/ca
                                  Xexit_93_symbol <= ca_100_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57/$exit
                                  binary_57_91_symbol <= Xexit_93_symbol; -- control passed from block 
                                  -- 
                                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/binary_57
                                Xexit_90_symbol <= binary_57_91_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs/$exit
                                binary_59_inputs_88_symbol <= Xexit_90_symbol; -- control passed from block 
                                -- 
                              end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/binary_59_inputs
                              rr_101_symbol <= binary_59_inputs_88_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/rr
                              binary_59_inst_req_0 <= rr_101_symbol; -- link to DP
                              ra_102_symbol <= binary_59_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/ra
                              cr_103_symbol <= ra_102_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/cr
                              binary_59_inst_req_1 <= cr_103_symbol; -- link to DP
                              ca_104_symbol <= binary_59_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/ca
                              Xexit_87_symbol <= ca_104_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59/$exit
                              binary_59_85_symbol <= Xexit_87_symbol; -- control passed from block 
                              -- 
                            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/binary_59
                            Xexit_44_block : Block -- non-trivial join transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/$exit 
                              signal Xexit_44_predecessors: BooleanArray(2 downto 0);
                              signal Xexit_44_p0_pred: BooleanArray(0 downto 0);
                              signal Xexit_44_p0_succ: BooleanArray(0 downto 0);
                              signal Xexit_44_p1_pred: BooleanArray(0 downto 0);
                              signal Xexit_44_p1_succ: BooleanArray(0 downto 0);
                              signal Xexit_44_p2_pred: BooleanArray(0 downto 0);
                              signal Xexit_44_p2_succ: BooleanArray(0 downto 0);
                              -- 
                            begin -- 
                              Xexit_44_0_place: Place -- 
                                generic map(marking => false)
                                port map( -- 
                                  Xexit_44_p0_pred, Xexit_44_p0_succ, Xexit_44_predecessors(0), clk, reset-- 
                                ); -- 
                              Xexit_44_p0_succ(0) <=  Xexit_44_symbol;
                              Xexit_44_p0_pred(0) <=  binary_47_45_symbol;
                              Xexit_44_1_place: Place -- 
                                generic map(marking => false)
                                port map( -- 
                                  Xexit_44_p1_pred, Xexit_44_p1_succ, Xexit_44_predecessors(1), clk, reset-- 
                                ); -- 
                              Xexit_44_p1_succ(0) <=  Xexit_44_symbol;
                              Xexit_44_p1_pred(0) <=  binary_54_55_symbol;
                              Xexit_44_2_place: Place -- 
                                generic map(marking => false)
                                port map( -- 
                                  Xexit_44_p2_pred, Xexit_44_p2_succ, Xexit_44_predecessors(2), clk, reset-- 
                                ); -- 
                              Xexit_44_p2_succ(0) <=  Xexit_44_symbol;
                              Xexit_44_p2_pred(0) <=  binary_59_85_symbol;
                              Xexit_44_symbol <= AndReduce(Xexit_44_predecessors); 
                              -- 
                            end Block; -- non-trivial join transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs/$exit
                            ternary_60_inputs_42_symbol <= Xexit_44_symbol; -- control passed from block 
                            -- 
                          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ternary_60_inputs
                          req_105_symbol <= ternary_60_inputs_42_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/req
                          ternary_60_inst_req_0 <= req_105_symbol; -- link to DP
                          ack_106_symbol <= ternary_60_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/ack
                          Xexit_41_symbol <= ack_106_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60/$exit
                          ternary_60_39_symbol <= Xexit_41_symbol; -- control passed from block 
                          -- 
                        end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/ternary_60
                        Xexit_38_symbol <= ternary_60_39_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs/$exit
                        binary_62_inputs_36_symbol <= Xexit_38_symbol; -- control passed from block 
                        -- 
                      end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/binary_62_inputs
                      rr_107_symbol <= binary_62_inputs_36_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/rr
                      binary_62_inst_req_0 <= rr_107_symbol; -- link to DP
                      ra_108_symbol <= binary_62_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/ra
                      cr_109_symbol <= ra_108_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/cr
                      binary_62_inst_req_1 <= cr_109_symbol; -- link to DP
                      ca_110_symbol <= binary_62_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/ca
                      Xexit_35_symbol <= ca_110_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62/$exit
                      binary_62_33_symbol <= Xexit_35_symbol; -- control passed from block 
                      -- 
                    end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/binary_62
                    Xexit_32_symbol <= binary_62_33_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs/$exit
                    binary_64_inputs_30_symbol <= Xexit_32_symbol; -- control passed from block 
                    -- 
                  end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/binary_64_inputs
                  rr_111_symbol <= binary_64_inputs_30_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/rr
                  binary_64_inst_req_0 <= rr_111_symbol; -- link to DP
                  ra_112_symbol <= binary_64_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/ra
                  cr_113_symbol <= ra_112_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/cr
                  binary_64_inst_req_1 <= cr_113_symbol; -- link to DP
                  ca_114_symbol <= binary_64_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/ca
                  Xexit_29_symbol <= ca_114_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64/$exit
                  binary_64_27_symbol <= Xexit_29_symbol; -- control passed from block 
                  -- 
                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/binary_64
                Xexit_26_symbol <= binary_64_27_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs/$exit
                binary_66_inputs_24_symbol <= Xexit_26_symbol; -- control passed from block 
                -- 
              end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/binary_66_inputs
              rr_115_symbol <= binary_66_inputs_24_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/rr
              binary_66_inst_req_0 <= rr_115_symbol; -- link to DP
              ra_116_symbol <= binary_66_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/ra
              cr_117_symbol <= ra_116_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/cr
              binary_66_inst_req_1 <= cr_117_symbol; -- link to DP
              ca_118_symbol <= binary_66_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/ca
              Xexit_23_symbol <= ca_118_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66/$exit
              binary_66_21_symbol <= Xexit_23_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/binary_66
            Xexit_20_symbol <= binary_66_21_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67/$exit
            assign_stmt_67_18_symbol <= Xexit_20_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_67
          assign_stmt_71_119: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71 
            signal assign_stmt_71_119_start: Boolean;
            signal Xentry_120_symbol: Boolean;
            signal Xexit_121_symbol: Boolean;
            signal type_cast_70_122_symbol : Boolean;
            -- 
          begin -- 
            assign_stmt_71_119_start <= assign_stmt_67_18_symbol; -- control passed to block
            Xentry_120_symbol  <= assign_stmt_71_119_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/$entry
            type_cast_70_122: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/type_cast_70 
              signal type_cast_70_122_start: Boolean;
              signal Xentry_123_symbol: Boolean;
              signal Xexit_124_symbol: Boolean;
              signal req_125_symbol : Boolean;
              signal ack_126_symbol : Boolean;
              -- 
            begin -- 
              type_cast_70_122_start <= Xentry_120_symbol; -- control passed to block
              Xentry_123_symbol  <= type_cast_70_122_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/type_cast_70/$entry
              req_125_symbol <= Xentry_123_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/type_cast_70/req
              type_cast_70_inst_req_0 <= req_125_symbol; -- link to DP
              ack_126_symbol <= type_cast_70_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/type_cast_70/ack
              Xexit_124_symbol <= ack_126_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/type_cast_70/$exit
              type_cast_70_122_symbol <= Xexit_124_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/type_cast_70
            Xexit_121_symbol <= type_cast_70_122_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71/$exit
            assign_stmt_71_119_symbol <= Xexit_121_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/assign_stmt_71
          Xexit_17_symbol <= assign_stmt_71_119_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43/$exit
          series_block_stmt_43_15_symbol <= Xexit_17_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_43
        series_block_stmt_73_127: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73 
          signal series_block_stmt_73_127_start: Boolean;
          signal Xentry_128_symbol: Boolean;
          signal Xexit_129_symbol: Boolean;
          signal assign_stmt_91_130_symbol : Boolean;
          signal assign_stmt_97_201_symbol : Boolean;
          -- 
        begin -- 
          series_block_stmt_73_127_start <= Xentry_13_symbol; -- control passed to block
          Xentry_128_symbol  <= series_block_stmt_73_127_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/$entry
          assign_stmt_91_130: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91 
            signal assign_stmt_91_130_start: Boolean;
            signal Xentry_131_symbol: Boolean;
            signal Xexit_132_symbol: Boolean;
            signal ternary_90_133_symbol : Boolean;
            -- 
          begin -- 
            assign_stmt_91_130_start <= Xentry_128_symbol; -- control passed to block
            Xentry_131_symbol  <= assign_stmt_91_130_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/$entry
            ternary_90_133: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90 
              signal ternary_90_133_start: Boolean;
              signal Xentry_134_symbol: Boolean;
              signal Xexit_135_symbol: Boolean;
              signal ternary_90_inputs_136_symbol : Boolean;
              signal req_199_symbol : Boolean;
              signal ack_200_symbol : Boolean;
              -- 
            begin -- 
              ternary_90_133_start <= Xentry_131_symbol; -- control passed to block
              Xentry_134_symbol  <= ternary_90_133_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/$entry
              ternary_90_inputs_136: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs 
                signal ternary_90_inputs_136_start: Boolean;
                signal Xentry_137_symbol: Boolean;
                signal Xexit_138_symbol: Boolean;
                signal binary_77_139_symbol : Boolean;
                signal binary_84_149_symbol : Boolean;
                signal binary_89_179_symbol : Boolean;
                -- 
              begin -- 
                ternary_90_inputs_136_start <= Xentry_134_symbol; -- control passed to block
                Xentry_137_symbol  <= ternary_90_inputs_136_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/$entry
                binary_77_139: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77 
                  signal binary_77_139_start: Boolean;
                  signal Xentry_140_symbol: Boolean;
                  signal Xexit_141_symbol: Boolean;
                  signal binary_77_inputs_142_symbol : Boolean;
                  signal rr_145_symbol : Boolean;
                  signal ra_146_symbol : Boolean;
                  signal cr_147_symbol : Boolean;
                  signal ca_148_symbol : Boolean;
                  -- 
                begin -- 
                  binary_77_139_start <= Xentry_137_symbol; -- control passed to block
                  Xentry_140_symbol  <= binary_77_139_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/$entry
                  binary_77_inputs_142: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/binary_77_inputs 
                    signal binary_77_inputs_142_start: Boolean;
                    signal Xentry_143_symbol: Boolean;
                    signal Xexit_144_symbol: Boolean;
                    -- 
                  begin -- 
                    binary_77_inputs_142_start <= Xentry_140_symbol; -- control passed to block
                    Xentry_143_symbol  <= binary_77_inputs_142_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/binary_77_inputs/$entry
                    Xexit_144_symbol <= Xentry_143_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/binary_77_inputs/$exit
                    binary_77_inputs_142_symbol <= Xexit_144_symbol; -- control passed from block 
                    -- 
                  end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/binary_77_inputs
                  rr_145_symbol <= binary_77_inputs_142_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/rr
                  binary_77_inst_req_0 <= rr_145_symbol; -- link to DP
                  ra_146_symbol <= binary_77_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/ra
                  cr_147_symbol <= ra_146_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/cr
                  binary_77_inst_req_1 <= cr_147_symbol; -- link to DP
                  ca_148_symbol <= binary_77_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/ca
                  Xexit_141_symbol <= ca_148_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77/$exit
                  binary_77_139_symbol <= Xexit_141_symbol; -- control passed from block 
                  -- 
                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_77
                binary_84_149: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84 
                  signal binary_84_149_start: Boolean;
                  signal Xentry_150_symbol: Boolean;
                  signal Xexit_151_symbol: Boolean;
                  signal binary_84_inputs_152_symbol : Boolean;
                  signal rr_175_symbol : Boolean;
                  signal ra_176_symbol : Boolean;
                  signal cr_177_symbol : Boolean;
                  signal ca_178_symbol : Boolean;
                  -- 
                begin -- 
                  binary_84_149_start <= Xentry_137_symbol; -- control passed to block
                  Xentry_150_symbol  <= binary_84_149_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/$entry
                  binary_84_inputs_152: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs 
                    signal binary_84_inputs_152_start: Boolean;
                    signal Xentry_153_symbol: Boolean;
                    signal Xexit_154_symbol: Boolean;
                    signal binary_82_155_symbol : Boolean;
                    -- 
                  begin -- 
                    binary_84_inputs_152_start <= Xentry_150_symbol; -- control passed to block
                    Xentry_153_symbol  <= binary_84_inputs_152_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/$entry
                    binary_82_155: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82 
                      signal binary_82_155_start: Boolean;
                      signal Xentry_156_symbol: Boolean;
                      signal Xexit_157_symbol: Boolean;
                      signal binary_82_inputs_158_symbol : Boolean;
                      signal rr_171_symbol : Boolean;
                      signal ra_172_symbol : Boolean;
                      signal cr_173_symbol : Boolean;
                      signal ca_174_symbol : Boolean;
                      -- 
                    begin -- 
                      binary_82_155_start <= Xentry_153_symbol; -- control passed to block
                      Xentry_156_symbol  <= binary_82_155_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/$entry
                      binary_82_inputs_158: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs 
                        signal binary_82_inputs_158_start: Boolean;
                        signal Xentry_159_symbol: Boolean;
                        signal Xexit_160_symbol: Boolean;
                        signal binary_80_161_symbol : Boolean;
                        -- 
                      begin -- 
                        binary_82_inputs_158_start <= Xentry_156_symbol; -- control passed to block
                        Xentry_159_symbol  <= binary_82_inputs_158_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/$entry
                        binary_80_161: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80 
                          signal binary_80_161_start: Boolean;
                          signal Xentry_162_symbol: Boolean;
                          signal Xexit_163_symbol: Boolean;
                          signal binary_80_inputs_164_symbol : Boolean;
                          signal rr_167_symbol : Boolean;
                          signal ra_168_symbol : Boolean;
                          signal cr_169_symbol : Boolean;
                          signal ca_170_symbol : Boolean;
                          -- 
                        begin -- 
                          binary_80_161_start <= Xentry_159_symbol; -- control passed to block
                          Xentry_162_symbol  <= binary_80_161_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/$entry
                          binary_80_inputs_164: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/binary_80_inputs 
                            signal binary_80_inputs_164_start: Boolean;
                            signal Xentry_165_symbol: Boolean;
                            signal Xexit_166_symbol: Boolean;
                            -- 
                          begin -- 
                            binary_80_inputs_164_start <= Xentry_162_symbol; -- control passed to block
                            Xentry_165_symbol  <= binary_80_inputs_164_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/binary_80_inputs/$entry
                            Xexit_166_symbol <= Xentry_165_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/binary_80_inputs/$exit
                            binary_80_inputs_164_symbol <= Xexit_166_symbol; -- control passed from block 
                            -- 
                          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/binary_80_inputs
                          rr_167_symbol <= binary_80_inputs_164_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/rr
                          binary_80_inst_req_0 <= rr_167_symbol; -- link to DP
                          ra_168_symbol <= binary_80_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/ra
                          cr_169_symbol <= ra_168_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/cr
                          binary_80_inst_req_1 <= cr_169_symbol; -- link to DP
                          ca_170_symbol <= binary_80_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/ca
                          Xexit_163_symbol <= ca_170_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80/$exit
                          binary_80_161_symbol <= Xexit_163_symbol; -- control passed from block 
                          -- 
                        end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/binary_80
                        Xexit_160_symbol <= binary_80_161_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs/$exit
                        binary_82_inputs_158_symbol <= Xexit_160_symbol; -- control passed from block 
                        -- 
                      end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/binary_82_inputs
                      rr_171_symbol <= binary_82_inputs_158_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/rr
                      binary_82_inst_req_0 <= rr_171_symbol; -- link to DP
                      ra_172_symbol <= binary_82_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/ra
                      cr_173_symbol <= ra_172_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/cr
                      binary_82_inst_req_1 <= cr_173_symbol; -- link to DP
                      ca_174_symbol <= binary_82_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/ca
                      Xexit_157_symbol <= ca_174_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82/$exit
                      binary_82_155_symbol <= Xexit_157_symbol; -- control passed from block 
                      -- 
                    end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/binary_82
                    Xexit_154_symbol <= binary_82_155_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs/$exit
                    binary_84_inputs_152_symbol <= Xexit_154_symbol; -- control passed from block 
                    -- 
                  end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/binary_84_inputs
                  rr_175_symbol <= binary_84_inputs_152_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/rr
                  binary_84_inst_req_0 <= rr_175_symbol; -- link to DP
                  ra_176_symbol <= binary_84_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/ra
                  cr_177_symbol <= ra_176_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/cr
                  binary_84_inst_req_1 <= cr_177_symbol; -- link to DP
                  ca_178_symbol <= binary_84_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/ca
                  Xexit_151_symbol <= ca_178_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84/$exit
                  binary_84_149_symbol <= Xexit_151_symbol; -- control passed from block 
                  -- 
                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_84
                binary_89_179: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89 
                  signal binary_89_179_start: Boolean;
                  signal Xentry_180_symbol: Boolean;
                  signal Xexit_181_symbol: Boolean;
                  signal binary_89_inputs_182_symbol : Boolean;
                  signal rr_195_symbol : Boolean;
                  signal ra_196_symbol : Boolean;
                  signal cr_197_symbol : Boolean;
                  signal ca_198_symbol : Boolean;
                  -- 
                begin -- 
                  binary_89_179_start <= Xentry_137_symbol; -- control passed to block
                  Xentry_180_symbol  <= binary_89_179_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/$entry
                  binary_89_inputs_182: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs 
                    signal binary_89_inputs_182_start: Boolean;
                    signal Xentry_183_symbol: Boolean;
                    signal Xexit_184_symbol: Boolean;
                    signal binary_87_185_symbol : Boolean;
                    -- 
                  begin -- 
                    binary_89_inputs_182_start <= Xentry_180_symbol; -- control passed to block
                    Xentry_183_symbol  <= binary_89_inputs_182_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/$entry
                    binary_87_185: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87 
                      signal binary_87_185_start: Boolean;
                      signal Xentry_186_symbol: Boolean;
                      signal Xexit_187_symbol: Boolean;
                      signal binary_87_inputs_188_symbol : Boolean;
                      signal rr_191_symbol : Boolean;
                      signal ra_192_symbol : Boolean;
                      signal cr_193_symbol : Boolean;
                      signal ca_194_symbol : Boolean;
                      -- 
                    begin -- 
                      binary_87_185_start <= Xentry_183_symbol; -- control passed to block
                      Xentry_186_symbol  <= binary_87_185_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/$entry
                      binary_87_inputs_188: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/binary_87_inputs 
                        signal binary_87_inputs_188_start: Boolean;
                        signal Xentry_189_symbol: Boolean;
                        signal Xexit_190_symbol: Boolean;
                        -- 
                      begin -- 
                        binary_87_inputs_188_start <= Xentry_186_symbol; -- control passed to block
                        Xentry_189_symbol  <= binary_87_inputs_188_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/binary_87_inputs/$entry
                        Xexit_190_symbol <= Xentry_189_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/binary_87_inputs/$exit
                        binary_87_inputs_188_symbol <= Xexit_190_symbol; -- control passed from block 
                        -- 
                      end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/binary_87_inputs
                      rr_191_symbol <= binary_87_inputs_188_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/rr
                      binary_87_inst_req_0 <= rr_191_symbol; -- link to DP
                      ra_192_symbol <= binary_87_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/ra
                      cr_193_symbol <= ra_192_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/cr
                      binary_87_inst_req_1 <= cr_193_symbol; -- link to DP
                      ca_194_symbol <= binary_87_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/ca
                      Xexit_187_symbol <= ca_194_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87/$exit
                      binary_87_185_symbol <= Xexit_187_symbol; -- control passed from block 
                      -- 
                    end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/binary_87
                    Xexit_184_symbol <= binary_87_185_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs/$exit
                    binary_89_inputs_182_symbol <= Xexit_184_symbol; -- control passed from block 
                    -- 
                  end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/binary_89_inputs
                  rr_195_symbol <= binary_89_inputs_182_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/rr
                  binary_89_inst_req_0 <= rr_195_symbol; -- link to DP
                  ra_196_symbol <= binary_89_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/ra
                  cr_197_symbol <= ra_196_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/cr
                  binary_89_inst_req_1 <= cr_197_symbol; -- link to DP
                  ca_198_symbol <= binary_89_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/ca
                  Xexit_181_symbol <= ca_198_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89/$exit
                  binary_89_179_symbol <= Xexit_181_symbol; -- control passed from block 
                  -- 
                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/binary_89
                Xexit_138_block : Block -- non-trivial join transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/$exit 
                  signal Xexit_138_predecessors: BooleanArray(2 downto 0);
                  signal Xexit_138_p0_pred: BooleanArray(0 downto 0);
                  signal Xexit_138_p0_succ: BooleanArray(0 downto 0);
                  signal Xexit_138_p1_pred: BooleanArray(0 downto 0);
                  signal Xexit_138_p1_succ: BooleanArray(0 downto 0);
                  signal Xexit_138_p2_pred: BooleanArray(0 downto 0);
                  signal Xexit_138_p2_succ: BooleanArray(0 downto 0);
                  -- 
                begin -- 
                  Xexit_138_0_place: Place -- 
                    generic map(marking => false)
                    port map( -- 
                      Xexit_138_p0_pred, Xexit_138_p0_succ, Xexit_138_predecessors(0), clk, reset-- 
                    ); -- 
                  Xexit_138_p0_succ(0) <=  Xexit_138_symbol;
                  Xexit_138_p0_pred(0) <=  binary_77_139_symbol;
                  Xexit_138_1_place: Place -- 
                    generic map(marking => false)
                    port map( -- 
                      Xexit_138_p1_pred, Xexit_138_p1_succ, Xexit_138_predecessors(1), clk, reset-- 
                    ); -- 
                  Xexit_138_p1_succ(0) <=  Xexit_138_symbol;
                  Xexit_138_p1_pred(0) <=  binary_84_149_symbol;
                  Xexit_138_2_place: Place -- 
                    generic map(marking => false)
                    port map( -- 
                      Xexit_138_p2_pred, Xexit_138_p2_succ, Xexit_138_predecessors(2), clk, reset-- 
                    ); -- 
                  Xexit_138_p2_succ(0) <=  Xexit_138_symbol;
                  Xexit_138_p2_pred(0) <=  binary_89_179_symbol;
                  Xexit_138_symbol <= AndReduce(Xexit_138_predecessors); 
                  -- 
                end Block; -- non-trivial join transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs/$exit
                ternary_90_inputs_136_symbol <= Xexit_138_symbol; -- control passed from block 
                -- 
              end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ternary_90_inputs
              req_199_symbol <= ternary_90_inputs_136_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/req
              ternary_90_inst_req_0 <= req_199_symbol; -- link to DP
              ack_200_symbol <= ternary_90_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/ack
              Xexit_135_symbol <= ack_200_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90/$exit
              ternary_90_133_symbol <= Xexit_135_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/ternary_90
            Xexit_132_symbol <= ternary_90_133_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91/$exit
            assign_stmt_91_130_symbol <= Xexit_132_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_91
          assign_stmt_97_201: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97 
            signal assign_stmt_97_201_start: Boolean;
            signal Xentry_202_symbol: Boolean;
            signal Xexit_203_symbol: Boolean;
            signal type_cast_96_204_symbol : Boolean;
            -- 
          begin -- 
            assign_stmt_97_201_start <= assign_stmt_91_130_symbol; -- control passed to block
            Xentry_202_symbol  <= assign_stmt_97_201_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/$entry
            type_cast_96_204: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96 
              signal type_cast_96_204_start: Boolean;
              signal Xentry_205_symbol: Boolean;
              signal Xexit_206_symbol: Boolean;
              signal binary_95_207_symbol : Boolean;
              signal req_217_symbol : Boolean;
              signal ack_218_symbol : Boolean;
              -- 
            begin -- 
              type_cast_96_204_start <= Xentry_202_symbol; -- control passed to block
              Xentry_205_symbol  <= type_cast_96_204_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/$entry
              binary_95_207: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95 
                signal binary_95_207_start: Boolean;
                signal Xentry_208_symbol: Boolean;
                signal Xexit_209_symbol: Boolean;
                signal binary_95_inputs_210_symbol : Boolean;
                signal rr_213_symbol : Boolean;
                signal ra_214_symbol : Boolean;
                signal cr_215_symbol : Boolean;
                signal ca_216_symbol : Boolean;
                -- 
              begin -- 
                binary_95_207_start <= Xentry_205_symbol; -- control passed to block
                Xentry_208_symbol  <= binary_95_207_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/$entry
                binary_95_inputs_210: Block -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/binary_95_inputs 
                  signal binary_95_inputs_210_start: Boolean;
                  signal Xentry_211_symbol: Boolean;
                  signal Xexit_212_symbol: Boolean;
                  -- 
                begin -- 
                  binary_95_inputs_210_start <= Xentry_208_symbol; -- control passed to block
                  Xentry_211_symbol  <= binary_95_inputs_210_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/binary_95_inputs/$entry
                  Xexit_212_symbol <= Xentry_211_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/binary_95_inputs/$exit
                  binary_95_inputs_210_symbol <= Xexit_212_symbol; -- control passed from block 
                  -- 
                end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/binary_95_inputs
                rr_213_symbol <= binary_95_inputs_210_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/rr
                binary_95_inst_req_0 <= rr_213_symbol; -- link to DP
                ra_214_symbol <= binary_95_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/ra
                cr_215_symbol <= ra_214_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/cr
                binary_95_inst_req_1 <= cr_215_symbol; -- link to DP
                ca_216_symbol <= binary_95_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/ca
                Xexit_209_symbol <= ca_216_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95/$exit
                binary_95_207_symbol <= Xexit_209_symbol; -- control passed from block 
                -- 
              end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/binary_95
              req_217_symbol <= binary_95_207_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/req
              type_cast_96_inst_req_0 <= req_217_symbol; -- link to DP
              ack_218_symbol <= type_cast_96_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/ack
              Xexit_206_symbol <= ack_218_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96/$exit
              type_cast_96_204_symbol <= Xexit_206_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/type_cast_96
            Xexit_203_symbol <= type_cast_96_204_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97/$exit
            assign_stmt_97_201_symbol <= Xexit_203_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/assign_stmt_97
          Xexit_129_symbol <= assign_stmt_97_201_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73/$exit
          series_block_stmt_73_127_symbol <= Xexit_129_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/parallel_block_stmt_42/series_block_stmt_73
        assign_stmt_103_219: Block -- branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103 
          signal assign_stmt_103_219_start: Boolean;
          signal Xentry_220_symbol: Boolean;
          signal Xexit_221_symbol: Boolean;
          signal binary_102_222_symbol : Boolean;
          -- 
        begin -- 
          assign_stmt_103_219_start <= Xentry_13_symbol; -- control passed to block
          Xentry_220_symbol  <= assign_stmt_103_219_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/$entry
          binary_102_222: Block -- branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102 
            signal binary_102_222_start: Boolean;
            signal Xentry_223_symbol: Boolean;
            signal Xexit_224_symbol: Boolean;
            signal binary_102_inputs_225_symbol : Boolean;
            signal rr_228_symbol : Boolean;
            signal ra_229_symbol : Boolean;
            signal cr_230_symbol : Boolean;
            signal ca_231_symbol : Boolean;
            -- 
          begin -- 
            binary_102_222_start <= Xentry_220_symbol; -- control passed to block
            Xentry_223_symbol  <= binary_102_222_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/$entry
            binary_102_inputs_225: Block -- branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/binary_102_inputs 
              signal binary_102_inputs_225_start: Boolean;
              signal Xentry_226_symbol: Boolean;
              signal Xexit_227_symbol: Boolean;
              -- 
            begin -- 
              binary_102_inputs_225_start <= Xentry_223_symbol; -- control passed to block
              Xentry_226_symbol  <= binary_102_inputs_225_start; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/binary_102_inputs/$entry
              Xexit_227_symbol <= Xentry_226_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/binary_102_inputs/$exit
              binary_102_inputs_225_symbol <= Xexit_227_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/binary_102_inputs
            rr_228_symbol <= binary_102_inputs_225_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/rr
            binary_102_inst_req_0 <= rr_228_symbol; -- link to DP
            ra_229_symbol <= binary_102_inst_ack_0; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/ra
            cr_230_symbol <= ra_229_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/cr
            binary_102_inst_req_1 <= cr_230_symbol; -- link to DP
            ca_231_symbol <= binary_102_inst_ack_1; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/ca
            Xexit_224_symbol <= ca_231_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102/$exit
            binary_102_222_symbol <= Xexit_224_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/binary_102
          Xexit_221_symbol <= binary_102_222_symbol; -- transition branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103/$exit
          assign_stmt_103_219_symbol <= Xexit_221_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/parallel_block_stmt_42/assign_stmt_103
        Xexit_14_block : Block -- non-trivial join transition branch_block_stmt_21/parallel_block_stmt_42/$exit 
          signal Xexit_14_predecessors: BooleanArray(2 downto 0);
          signal Xexit_14_p0_pred: BooleanArray(0 downto 0);
          signal Xexit_14_p0_succ: BooleanArray(0 downto 0);
          signal Xexit_14_p1_pred: BooleanArray(0 downto 0);
          signal Xexit_14_p1_succ: BooleanArray(0 downto 0);
          signal Xexit_14_p2_pred: BooleanArray(0 downto 0);
          signal Xexit_14_p2_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          Xexit_14_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_14_p0_pred, Xexit_14_p0_succ, Xexit_14_predecessors(0), clk, reset-- 
            ); -- 
          Xexit_14_p0_succ(0) <=  Xexit_14_symbol;
          Xexit_14_p0_pred(0) <=  series_block_stmt_43_15_symbol;
          Xexit_14_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_14_p1_pred, Xexit_14_p1_succ, Xexit_14_predecessors(1), clk, reset-- 
            ); -- 
          Xexit_14_p1_succ(0) <=  Xexit_14_symbol;
          Xexit_14_p1_pred(0) <=  series_block_stmt_73_127_symbol;
          Xexit_14_2_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_14_p2_pred, Xexit_14_p2_succ, Xexit_14_predecessors(2), clk, reset-- 
            ); -- 
          Xexit_14_p2_succ(0) <=  Xexit_14_symbol;
          Xexit_14_p2_pred(0) <=  assign_stmt_103_219_symbol;
          Xexit_14_symbol <= AndReduce(Xexit_14_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_21/parallel_block_stmt_42/$exit
        parallel_block_stmt_42_12_symbol <= Xexit_14_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/parallel_block_stmt_42
      if_stmt_105_eval_test_232: Block -- branch_block_stmt_21/if_stmt_105_eval_test 
        signal if_stmt_105_eval_test_232_start: Boolean;
        signal Xentry_233_symbol: Boolean;
        signal Xexit_234_symbol: Boolean;
        signal binary_108_235_symbol : Boolean;
        signal branch_req_245_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_105_eval_test_232_start <= if_stmt_105_x_xentry_x_xx_x11_symbol; -- control passed to block
        Xentry_233_symbol  <= if_stmt_105_eval_test_232_start; -- transition branch_block_stmt_21/if_stmt_105_eval_test/$entry
        binary_108_235: Block -- branch_block_stmt_21/if_stmt_105_eval_test/binary_108 
          signal binary_108_235_start: Boolean;
          signal Xentry_236_symbol: Boolean;
          signal Xexit_237_symbol: Boolean;
          signal binary_108_inputs_238_symbol : Boolean;
          signal rr_241_symbol : Boolean;
          signal ra_242_symbol : Boolean;
          signal cr_243_symbol : Boolean;
          signal ca_244_symbol : Boolean;
          -- 
        begin -- 
          binary_108_235_start <= Xentry_233_symbol; -- control passed to block
          Xentry_236_symbol  <= binary_108_235_start; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/$entry
          binary_108_inputs_238: Block -- branch_block_stmt_21/if_stmt_105_eval_test/binary_108/binary_108_inputs 
            signal binary_108_inputs_238_start: Boolean;
            signal Xentry_239_symbol: Boolean;
            signal Xexit_240_symbol: Boolean;
            -- 
          begin -- 
            binary_108_inputs_238_start <= Xentry_236_symbol; -- control passed to block
            Xentry_239_symbol  <= binary_108_inputs_238_start; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/binary_108_inputs/$entry
            Xexit_240_symbol <= Xentry_239_symbol; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/binary_108_inputs/$exit
            binary_108_inputs_238_symbol <= Xexit_240_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/if_stmt_105_eval_test/binary_108/binary_108_inputs
          rr_241_symbol <= binary_108_inputs_238_symbol; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/rr
          binary_108_inst_req_0 <= rr_241_symbol; -- link to DP
          ra_242_symbol <= binary_108_inst_ack_0; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/ra
          cr_243_symbol <= ra_242_symbol; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/cr
          binary_108_inst_req_1 <= cr_243_symbol; -- link to DP
          ca_244_symbol <= binary_108_inst_ack_1; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/ca
          Xexit_237_symbol <= ca_244_symbol; -- transition branch_block_stmt_21/if_stmt_105_eval_test/binary_108/$exit
          binary_108_235_symbol <= Xexit_237_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/if_stmt_105_eval_test/binary_108
        branch_req_245_symbol <= binary_108_235_symbol; -- transition branch_block_stmt_21/if_stmt_105_eval_test/branch_req
        if_stmt_105_branch_req_0 <= branch_req_245_symbol; -- link to DP
        Xexit_234_symbol <= branch_req_245_symbol; -- transition branch_block_stmt_21/if_stmt_105_eval_test/$exit
        if_stmt_105_eval_test_232_symbol <= Xexit_234_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/if_stmt_105_eval_test
      binary_108_place_246_symbol  <=  if_stmt_105_eval_test_232_symbol; -- place branch_block_stmt_21/binary_108_place (optimized away) 
      if_stmt_105_if_link_247: Block -- branch_block_stmt_21/if_stmt_105_if_link 
        signal if_stmt_105_if_link_247_start: Boolean;
        signal Xentry_248_symbol: Boolean;
        signal Xexit_249_symbol: Boolean;
        signal if_choice_transition_250_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_105_if_link_247_start <= binary_108_place_246_symbol; -- control passed to block
        Xentry_248_symbol  <= if_stmt_105_if_link_247_start; -- transition branch_block_stmt_21/if_stmt_105_if_link/$entry
        if_choice_transition_250_symbol <= if_stmt_105_branch_ack_1; -- transition branch_block_stmt_21/if_stmt_105_if_link/if_choice_transition
        Xexit_249_symbol <= if_choice_transition_250_symbol; -- transition branch_block_stmt_21/if_stmt_105_if_link/$exit
        if_stmt_105_if_link_247_symbol <= Xexit_249_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/if_stmt_105_if_link
      if_stmt_105_else_link_251: Block -- branch_block_stmt_21/if_stmt_105_else_link 
        signal if_stmt_105_else_link_251_start: Boolean;
        signal Xentry_252_symbol: Boolean;
        signal Xexit_253_symbol: Boolean;
        signal else_choice_transition_254_symbol : Boolean;
        -- 
      begin -- 
        if_stmt_105_else_link_251_start <= binary_108_place_246_symbol; -- control passed to block
        Xentry_252_symbol  <= if_stmt_105_else_link_251_start; -- transition branch_block_stmt_21/if_stmt_105_else_link/$entry
        else_choice_transition_254_symbol <= if_stmt_105_branch_ack_0; -- transition branch_block_stmt_21/if_stmt_105_else_link/else_choice_transition
        Xexit_253_symbol <= else_choice_transition_254_symbol; -- transition branch_block_stmt_21/if_stmt_105_else_link/$exit
        if_stmt_105_else_link_251_symbol <= Xexit_253_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/if_stmt_105_else_link
      stmt_109_x_xentry_x_xx_x255_symbol  <=  if_stmt_105_if_link_247_symbol; -- place branch_block_stmt_21/stmt_109__entry__ (optimized away) 
      stmt_109_x_xexit_x_xx_x256_symbol  <=  stmt_109_257_symbol; -- place branch_block_stmt_21/stmt_109__exit__ (optimized away) 
      stmt_109_257: Block -- branch_block_stmt_21/stmt_109 
        signal stmt_109_257_start: Boolean;
        signal Xentry_258_symbol: Boolean;
        signal Xexit_259_symbol: Boolean;
        -- 
      begin -- 
        stmt_109_257_start <= stmt_109_x_xentry_x_xx_x255_symbol; -- control passed to block
        Xentry_258_symbol  <= stmt_109_257_start; -- transition branch_block_stmt_21/stmt_109/$entry
        Xexit_259_symbol <= Xentry_258_symbol; -- transition branch_block_stmt_21/stmt_109/$exit
        stmt_109_257_symbol <= Xexit_259_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/stmt_109
      loopback_260_symbol  <=  if_stmt_105_else_link_251_symbol; -- place branch_block_stmt_21/loopback (optimized away) 
      branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq 
        signal branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261_start: Boolean;
        signal Xentry_262_symbol: Boolean;
        signal Xexit_263_symbol: Boolean;
        signal phi_stmt_23_264_symbol : Boolean;
        signal phi_stmt_27_268_symbol : Boolean;
        signal phi_stmt_31_272_symbol : Boolean;
        signal phi_stmt_37_286_symbol : Boolean;
        -- 
      begin -- 
        branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261_start <= branch_block_stmt_21_x_xentry_x_xx_x6_symbol; -- control passed to block
        Xentry_262_symbol  <= branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/$entry
        phi_stmt_23_264: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_23 
          signal phi_stmt_23_264_start: Boolean;
          signal Xentry_265_symbol: Boolean;
          signal Xexit_266_symbol: Boolean;
          signal phi_stmt_23_req_267_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_23_264_start <= Xentry_262_symbol; -- control passed to block
          Xentry_265_symbol  <= phi_stmt_23_264_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_23/$entry
          phi_stmt_23_req_267_symbol <= Xentry_265_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_23/phi_stmt_23_req
          phi_stmt_23_req_0 <= phi_stmt_23_req_267_symbol; -- link to DP
          Xexit_266_symbol <= phi_stmt_23_req_267_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_23/$exit
          phi_stmt_23_264_symbol <= Xexit_266_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_23
        phi_stmt_27_268: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_27 
          signal phi_stmt_27_268_start: Boolean;
          signal Xentry_269_symbol: Boolean;
          signal Xexit_270_symbol: Boolean;
          signal phi_stmt_27_req_271_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_27_268_start <= Xentry_262_symbol; -- control passed to block
          Xentry_269_symbol  <= phi_stmt_27_268_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_27/$entry
          phi_stmt_27_req_271_symbol <= Xentry_269_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_27/phi_stmt_27_req
          phi_stmt_27_req_0 <= phi_stmt_27_req_271_symbol; -- link to DP
          Xexit_270_symbol <= phi_stmt_27_req_271_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_27/$exit
          phi_stmt_27_268_symbol <= Xexit_270_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_27
        phi_stmt_31_272: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31 
          signal phi_stmt_31_272_start: Boolean;
          signal Xentry_273_symbol: Boolean;
          signal Xexit_274_symbol: Boolean;
          signal binary_36_275_symbol : Boolean;
          signal phi_stmt_31_req_285_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_31_272_start <= Xentry_262_symbol; -- control passed to block
          Xentry_273_symbol  <= phi_stmt_31_272_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/$entry
          binary_36_275: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36 
            signal binary_36_275_start: Boolean;
            signal Xentry_276_symbol: Boolean;
            signal Xexit_277_symbol: Boolean;
            signal binary_36_inputs_278_symbol : Boolean;
            signal rr_281_symbol : Boolean;
            signal ra_282_symbol : Boolean;
            signal cr_283_symbol : Boolean;
            signal ca_284_symbol : Boolean;
            -- 
          begin -- 
            binary_36_275_start <= Xentry_273_symbol; -- control passed to block
            Xentry_276_symbol  <= binary_36_275_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/$entry
            binary_36_inputs_278: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/binary_36_inputs 
              signal binary_36_inputs_278_start: Boolean;
              signal Xentry_279_symbol: Boolean;
              signal Xexit_280_symbol: Boolean;
              -- 
            begin -- 
              binary_36_inputs_278_start <= Xentry_276_symbol; -- control passed to block
              Xentry_279_symbol  <= binary_36_inputs_278_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/binary_36_inputs/$entry
              Xexit_280_symbol <= Xentry_279_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/binary_36_inputs/$exit
              binary_36_inputs_278_symbol <= Xexit_280_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/binary_36_inputs
            rr_281_symbol <= binary_36_inputs_278_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/rr
            ra_282_symbol <= rr_281_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/ra
            cr_283_symbol <= ra_282_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/cr
            ca_284_symbol <= cr_283_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/ca
            Xexit_277_symbol <= ca_284_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36/$exit
            binary_36_275_symbol <= Xexit_277_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/binary_36
          phi_stmt_31_req_285_symbol <= binary_36_275_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/phi_stmt_31_req
          phi_stmt_31_req_0 <= phi_stmt_31_req_285_symbol; -- link to DP
          Xexit_274_symbol <= phi_stmt_31_req_285_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31/$exit
          phi_stmt_31_272_symbol <= Xexit_274_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_31
        phi_stmt_37_286: Block -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_37 
          signal phi_stmt_37_286_start: Boolean;
          signal Xentry_287_symbol: Boolean;
          signal Xexit_288_symbol: Boolean;
          signal phi_stmt_37_req_289_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_37_286_start <= Xentry_262_symbol; -- control passed to block
          Xentry_287_symbol  <= phi_stmt_37_286_start; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_37/$entry
          phi_stmt_37_req_289_symbol <= Xentry_287_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_37/phi_stmt_37_req
          phi_stmt_37_req_0 <= phi_stmt_37_req_289_symbol; -- link to DP
          Xexit_288_symbol <= phi_stmt_37_req_289_symbol; -- transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_37/$exit
          phi_stmt_37_286_symbol <= Xexit_288_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/phi_stmt_37
        Xexit_263_block : Block -- non-trivial join transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/$exit 
          signal Xexit_263_predecessors: BooleanArray(3 downto 0);
          signal Xexit_263_p0_pred: BooleanArray(0 downto 0);
          signal Xexit_263_p0_succ: BooleanArray(0 downto 0);
          signal Xexit_263_p1_pred: BooleanArray(0 downto 0);
          signal Xexit_263_p1_succ: BooleanArray(0 downto 0);
          signal Xexit_263_p2_pred: BooleanArray(0 downto 0);
          signal Xexit_263_p2_succ: BooleanArray(0 downto 0);
          signal Xexit_263_p3_pred: BooleanArray(0 downto 0);
          signal Xexit_263_p3_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          Xexit_263_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_263_p0_pred, Xexit_263_p0_succ, Xexit_263_predecessors(0), clk, reset-- 
            ); -- 
          Xexit_263_p0_succ(0) <=  Xexit_263_symbol;
          Xexit_263_p0_pred(0) <=  phi_stmt_23_264_symbol;
          Xexit_263_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_263_p1_pred, Xexit_263_p1_succ, Xexit_263_predecessors(1), clk, reset-- 
            ); -- 
          Xexit_263_p1_succ(0) <=  Xexit_263_symbol;
          Xexit_263_p1_pred(0) <=  phi_stmt_27_268_symbol;
          Xexit_263_2_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_263_p2_pred, Xexit_263_p2_succ, Xexit_263_predecessors(2), clk, reset-- 
            ); -- 
          Xexit_263_p2_succ(0) <=  Xexit_263_symbol;
          Xexit_263_p2_pred(0) <=  phi_stmt_31_272_symbol;
          Xexit_263_3_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_263_p3_pred, Xexit_263_p3_succ, Xexit_263_predecessors(3), clk, reset-- 
            ); -- 
          Xexit_263_p3_succ(0) <=  Xexit_263_symbol;
          Xexit_263_p3_pred(0) <=  phi_stmt_37_286_symbol;
          Xexit_263_symbol <= AndReduce(Xexit_263_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq/$exit
        branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261_symbol <= Xexit_263_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/branch_block_stmt_21__entry___PhiReq
      loopback_PhiReq_290: Block -- branch_block_stmt_21/loopback_PhiReq 
        signal loopback_PhiReq_290_start: Boolean;
        signal Xentry_291_symbol: Boolean;
        signal Xexit_292_symbol: Boolean;
        signal phi_stmt_23_293_symbol : Boolean;
        signal phi_stmt_27_297_symbol : Boolean;
        signal phi_stmt_31_301_symbol : Boolean;
        signal phi_stmt_37_315_symbol : Boolean;
        -- 
      begin -- 
        loopback_PhiReq_290_start <= loopback_260_symbol; -- control passed to block
        Xentry_291_symbol  <= loopback_PhiReq_290_start; -- transition branch_block_stmt_21/loopback_PhiReq/$entry
        phi_stmt_23_293: Block -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_23 
          signal phi_stmt_23_293_start: Boolean;
          signal Xentry_294_symbol: Boolean;
          signal Xexit_295_symbol: Boolean;
          signal phi_stmt_23_req_296_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_23_293_start <= Xentry_291_symbol; -- control passed to block
          Xentry_294_symbol  <= phi_stmt_23_293_start; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_23/$entry
          phi_stmt_23_req_296_symbol <= Xentry_294_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_23/phi_stmt_23_req
          phi_stmt_23_req_1 <= phi_stmt_23_req_296_symbol; -- link to DP
          Xexit_295_symbol <= phi_stmt_23_req_296_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_23/$exit
          phi_stmt_23_293_symbol <= Xexit_295_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_23
        phi_stmt_27_297: Block -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_27 
          signal phi_stmt_27_297_start: Boolean;
          signal Xentry_298_symbol: Boolean;
          signal Xexit_299_symbol: Boolean;
          signal phi_stmt_27_req_300_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_27_297_start <= Xentry_291_symbol; -- control passed to block
          Xentry_298_symbol  <= phi_stmt_27_297_start; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_27/$entry
          phi_stmt_27_req_300_symbol <= Xentry_298_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_27/phi_stmt_27_req
          phi_stmt_27_req_1 <= phi_stmt_27_req_300_symbol; -- link to DP
          Xexit_299_symbol <= phi_stmt_27_req_300_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_27/$exit
          phi_stmt_27_297_symbol <= Xexit_299_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_27
        phi_stmt_31_301: Block -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_31 
          signal phi_stmt_31_301_start: Boolean;
          signal Xentry_302_symbol: Boolean;
          signal Xexit_303_symbol: Boolean;
          signal binary_36_304_symbol : Boolean;
          signal phi_stmt_31_req_314_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_31_301_start <= Xentry_291_symbol; -- control passed to block
          Xentry_302_symbol  <= phi_stmt_31_301_start; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/$entry
          binary_36_304: Block -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36 
            signal binary_36_304_start: Boolean;
            signal Xentry_305_symbol: Boolean;
            signal Xexit_306_symbol: Boolean;
            signal binary_36_inputs_307_symbol : Boolean;
            signal rr_310_symbol : Boolean;
            signal ra_311_symbol : Boolean;
            signal cr_312_symbol : Boolean;
            signal ca_313_symbol : Boolean;
            -- 
          begin -- 
            binary_36_304_start <= Xentry_302_symbol; -- control passed to block
            Xentry_305_symbol  <= binary_36_304_start; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/$entry
            binary_36_inputs_307: Block -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/binary_36_inputs 
              signal binary_36_inputs_307_start: Boolean;
              signal Xentry_308_symbol: Boolean;
              signal Xexit_309_symbol: Boolean;
              -- 
            begin -- 
              binary_36_inputs_307_start <= Xentry_305_symbol; -- control passed to block
              Xentry_308_symbol  <= binary_36_inputs_307_start; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/binary_36_inputs/$entry
              Xexit_309_symbol <= Xentry_308_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/binary_36_inputs/$exit
              binary_36_inputs_307_symbol <= Xexit_309_symbol; -- control passed from block 
              -- 
            end Block; -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/binary_36_inputs
            rr_310_symbol <= binary_36_inputs_307_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/rr
            binary_36_inst_req_0 <= rr_310_symbol; -- link to DP
            ra_311_symbol <= binary_36_inst_ack_0; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/ra
            cr_312_symbol <= ra_311_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/cr
            binary_36_inst_req_1 <= cr_312_symbol; -- link to DP
            ca_313_symbol <= binary_36_inst_ack_1; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/ca
            Xexit_306_symbol <= ca_313_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36/$exit
            binary_36_304_symbol <= Xexit_306_symbol; -- control passed from block 
            -- 
          end Block; -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/binary_36
          phi_stmt_31_req_314_symbol <= binary_36_304_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/phi_stmt_31_req
          phi_stmt_31_req_1 <= phi_stmt_31_req_314_symbol; -- link to DP
          Xexit_303_symbol <= phi_stmt_31_req_314_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_31/$exit
          phi_stmt_31_301_symbol <= Xexit_303_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_31
        phi_stmt_37_315: Block -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_37 
          signal phi_stmt_37_315_start: Boolean;
          signal Xentry_316_symbol: Boolean;
          signal Xexit_317_symbol: Boolean;
          signal phi_stmt_37_req_318_symbol : Boolean;
          -- 
        begin -- 
          phi_stmt_37_315_start <= Xentry_291_symbol; -- control passed to block
          Xentry_316_symbol  <= phi_stmt_37_315_start; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_37/$entry
          phi_stmt_37_req_318_symbol <= Xentry_316_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_37/phi_stmt_37_req
          phi_stmt_37_req_1 <= phi_stmt_37_req_318_symbol; -- link to DP
          Xexit_317_symbol <= phi_stmt_37_req_318_symbol; -- transition branch_block_stmt_21/loopback_PhiReq/phi_stmt_37/$exit
          phi_stmt_37_315_symbol <= Xexit_317_symbol; -- control passed from block 
          -- 
        end Block; -- branch_block_stmt_21/loopback_PhiReq/phi_stmt_37
        Xexit_292_block : Block -- non-trivial join transition branch_block_stmt_21/loopback_PhiReq/$exit 
          signal Xexit_292_predecessors: BooleanArray(3 downto 0);
          signal Xexit_292_p0_pred: BooleanArray(0 downto 0);
          signal Xexit_292_p0_succ: BooleanArray(0 downto 0);
          signal Xexit_292_p1_pred: BooleanArray(0 downto 0);
          signal Xexit_292_p1_succ: BooleanArray(0 downto 0);
          signal Xexit_292_p2_pred: BooleanArray(0 downto 0);
          signal Xexit_292_p2_succ: BooleanArray(0 downto 0);
          signal Xexit_292_p3_pred: BooleanArray(0 downto 0);
          signal Xexit_292_p3_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          Xexit_292_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_292_p0_pred, Xexit_292_p0_succ, Xexit_292_predecessors(0), clk, reset-- 
            ); -- 
          Xexit_292_p0_succ(0) <=  Xexit_292_symbol;
          Xexit_292_p0_pred(0) <=  phi_stmt_23_293_symbol;
          Xexit_292_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_292_p1_pred, Xexit_292_p1_succ, Xexit_292_predecessors(1), clk, reset-- 
            ); -- 
          Xexit_292_p1_succ(0) <=  Xexit_292_symbol;
          Xexit_292_p1_pred(0) <=  phi_stmt_27_297_symbol;
          Xexit_292_2_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_292_p2_pred, Xexit_292_p2_succ, Xexit_292_predecessors(2), clk, reset-- 
            ); -- 
          Xexit_292_p2_succ(0) <=  Xexit_292_symbol;
          Xexit_292_p2_pred(0) <=  phi_stmt_31_301_symbol;
          Xexit_292_3_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_292_p3_pred, Xexit_292_p3_succ, Xexit_292_predecessors(3), clk, reset-- 
            ); -- 
          Xexit_292_p3_succ(0) <=  Xexit_292_symbol;
          Xexit_292_p3_pred(0) <=  phi_stmt_37_315_symbol;
          Xexit_292_symbol <= AndReduce(Xexit_292_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_21/loopback_PhiReq/$exit
        loopback_PhiReq_290_symbol <= Xexit_292_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/loopback_PhiReq
      merge_stmt_22_PhiReqMerge_319_symbol  <=  branch_block_stmt_21_x_xentry_x_xx_xPhiReq_261_symbol or loopback_PhiReq_290_symbol; -- place branch_block_stmt_21/merge_stmt_22_PhiReqMerge (optimized away) 
      merge_stmt_22_PhiAck_320: Block -- branch_block_stmt_21/merge_stmt_22_PhiAck 
        signal merge_stmt_22_PhiAck_320_start: Boolean;
        signal Xentry_321_symbol: Boolean;
        signal Xexit_322_symbol: Boolean;
        signal phi_stmt_23_ack_323_symbol : Boolean;
        signal phi_stmt_27_ack_324_symbol : Boolean;
        signal phi_stmt_31_ack_325_symbol : Boolean;
        signal phi_stmt_37_ack_326_symbol : Boolean;
        -- 
      begin -- 
        merge_stmt_22_PhiAck_320_start <= merge_stmt_22_PhiReqMerge_319_symbol; -- control passed to block
        Xentry_321_symbol  <= merge_stmt_22_PhiAck_320_start; -- transition branch_block_stmt_21/merge_stmt_22_PhiAck/$entry
        phi_stmt_23_ack_323_symbol <= phi_stmt_23_ack_0; -- transition branch_block_stmt_21/merge_stmt_22_PhiAck/phi_stmt_23_ack
        phi_stmt_27_ack_324_symbol <= phi_stmt_27_ack_0; -- transition branch_block_stmt_21/merge_stmt_22_PhiAck/phi_stmt_27_ack
        phi_stmt_31_ack_325_symbol <= phi_stmt_31_ack_0; -- transition branch_block_stmt_21/merge_stmt_22_PhiAck/phi_stmt_31_ack
        phi_stmt_37_ack_326_symbol <= phi_stmt_37_ack_0; -- transition branch_block_stmt_21/merge_stmt_22_PhiAck/phi_stmt_37_ack
        Xexit_322_block : Block -- non-trivial join transition branch_block_stmt_21/merge_stmt_22_PhiAck/$exit 
          signal Xexit_322_predecessors: BooleanArray(3 downto 0);
          signal Xexit_322_p0_pred: BooleanArray(0 downto 0);
          signal Xexit_322_p0_succ: BooleanArray(0 downto 0);
          signal Xexit_322_p1_pred: BooleanArray(0 downto 0);
          signal Xexit_322_p1_succ: BooleanArray(0 downto 0);
          signal Xexit_322_p2_pred: BooleanArray(0 downto 0);
          signal Xexit_322_p2_succ: BooleanArray(0 downto 0);
          signal Xexit_322_p3_pred: BooleanArray(0 downto 0);
          signal Xexit_322_p3_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          Xexit_322_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_322_p0_pred, Xexit_322_p0_succ, Xexit_322_predecessors(0), clk, reset-- 
            ); -- 
          Xexit_322_p0_succ(0) <=  Xexit_322_symbol;
          Xexit_322_p0_pred(0) <=  phi_stmt_23_ack_323_symbol;
          Xexit_322_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_322_p1_pred, Xexit_322_p1_succ, Xexit_322_predecessors(1), clk, reset-- 
            ); -- 
          Xexit_322_p1_succ(0) <=  Xexit_322_symbol;
          Xexit_322_p1_pred(0) <=  phi_stmt_27_ack_324_symbol;
          Xexit_322_2_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_322_p2_pred, Xexit_322_p2_succ, Xexit_322_predecessors(2), clk, reset-- 
            ); -- 
          Xexit_322_p2_succ(0) <=  Xexit_322_symbol;
          Xexit_322_p2_pred(0) <=  phi_stmt_31_ack_325_symbol;
          Xexit_322_3_place: Place -- 
            generic map(marking => false)
            port map( -- 
              Xexit_322_p3_pred, Xexit_322_p3_succ, Xexit_322_predecessors(3), clk, reset-- 
            ); -- 
          Xexit_322_p3_succ(0) <=  Xexit_322_symbol;
          Xexit_322_p3_pred(0) <=  phi_stmt_37_ack_326_symbol;
          Xexit_322_symbol <= AndReduce(Xexit_322_predecessors); 
          -- 
        end Block; -- non-trivial join transition branch_block_stmt_21/merge_stmt_22_PhiAck/$exit
        merge_stmt_22_PhiAck_320_symbol <= Xexit_322_symbol; -- control passed from block 
        -- 
      end Block; -- branch_block_stmt_21/merge_stmt_22_PhiAck
      Xexit_5_symbol <= branch_block_stmt_21_x_xexit_x_xx_x7_symbol; -- transition branch_block_stmt_21/$exit
      branch_block_stmt_21_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- branch_block_stmt_21
    assign_stmt_118_327: Block -- assign_stmt_118 
      signal assign_stmt_118_327_start: Boolean;
      signal Xentry_328_symbol: Boolean;
      signal Xexit_329_symbol: Boolean;
      signal binary_117_330_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_118_327_start <= branch_block_stmt_21_3_symbol; -- control passed to block
      Xentry_328_symbol  <= assign_stmt_118_327_start; -- transition assign_stmt_118/$entry
      binary_117_330: Block -- assign_stmt_118/binary_117 
        signal binary_117_330_start: Boolean;
        signal Xentry_331_symbol: Boolean;
        signal Xexit_332_symbol: Boolean;
        signal binary_117_inputs_333_symbol : Boolean;
        signal rr_336_symbol : Boolean;
        signal ra_337_symbol : Boolean;
        signal cr_338_symbol : Boolean;
        signal ca_339_symbol : Boolean;
        -- 
      begin -- 
        binary_117_330_start <= Xentry_328_symbol; -- control passed to block
        Xentry_331_symbol  <= binary_117_330_start; -- transition assign_stmt_118/binary_117/$entry
        binary_117_inputs_333: Block -- assign_stmt_118/binary_117/binary_117_inputs 
          signal binary_117_inputs_333_start: Boolean;
          signal Xentry_334_symbol: Boolean;
          signal Xexit_335_symbol: Boolean;
          -- 
        begin -- 
          binary_117_inputs_333_start <= Xentry_331_symbol; -- control passed to block
          Xentry_334_symbol  <= binary_117_inputs_333_start; -- transition assign_stmt_118/binary_117/binary_117_inputs/$entry
          Xexit_335_symbol <= Xentry_334_symbol; -- transition assign_stmt_118/binary_117/binary_117_inputs/$exit
          binary_117_inputs_333_symbol <= Xexit_335_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_118/binary_117/binary_117_inputs
        rr_336_symbol <= binary_117_inputs_333_symbol; -- transition assign_stmt_118/binary_117/rr
        binary_117_inst_req_0 <= rr_336_symbol; -- link to DP
        ra_337_symbol <= binary_117_inst_ack_0; -- transition assign_stmt_118/binary_117/ra
        cr_338_symbol <= ra_337_symbol; -- transition assign_stmt_118/binary_117/cr
        binary_117_inst_req_1 <= cr_338_symbol; -- link to DP
        ca_339_symbol <= binary_117_inst_ack_1; -- transition assign_stmt_118/binary_117/ca
        Xexit_332_symbol <= ca_339_symbol; -- transition assign_stmt_118/binary_117/$exit
        binary_117_330_symbol <= Xexit_332_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_118/binary_117
      Xexit_329_symbol <= binary_117_330_symbol; -- transition assign_stmt_118/$exit
      assign_stmt_118_327_symbol <= Xexit_329_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_118
    Xexit_2_symbol <= assign_stmt_118_327_symbol; -- transition $exit
    fin  <=  '1' when Xexit_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal a_0_31 : std_logic_vector(9 downto 0);
    signal binary_108_wire : std_logic_vector(0 downto 0);
    signal binary_36_wire : std_logic_vector(9 downto 0);
    signal binary_47_wire : std_logic_vector(0 downto 0);
    signal binary_50_wire : std_logic_vector(9 downto 0);
    signal binary_52_wire : std_logic_vector(10 downto 0);
    signal binary_54_wire : std_logic_vector(10 downto 0);
    signal binary_57_wire : std_logic_vector(10 downto 0);
    signal binary_59_wire : std_logic_vector(10 downto 0);
    signal binary_62_wire : std_logic_vector(0 downto 0);
    signal binary_64_wire : std_logic_vector(10 downto 0);
    signal binary_77_wire : std_logic_vector(0 downto 0);
    signal binary_80_wire : std_logic_vector(9 downto 0);
    signal binary_82_wire : std_logic_vector(10 downto 0);
    signal binary_84_wire : std_logic_vector(10 downto 0);
    signal binary_87_wire : std_logic_vector(10 downto 0);
    signal binary_89_wire : std_logic_vector(10 downto 0);
    signal binary_95_wire : std_logic_vector(10 downto 0);
    signal ctr_103 : std_logic_vector(10 downto 0);
    signal ctr_37 : std_logic_vector(10 downto 0);
    signal expr_101_wire_constant : std_logic_vector(3 downto 0);
    signal expr_107_wire_constant : std_logic_vector(3 downto 0);
    signal expr_25_wire_constant : std_logic_vector(9 downto 0);
    signal expr_29_wire_constant : std_logic_vector(9 downto 0);
    signal expr_35_wire_constant : std_logic_vector(3 downto 0);
    signal expr_46_wire_constant : std_logic_vector(3 downto 0);
    signal expr_53_wire_constant : std_logic_vector(3 downto 0);
    signal expr_58_wire_constant : std_logic_vector(3 downto 0);
    signal expr_61_wire_constant : std_logic_vector(3 downto 0);
    signal expr_65_wire_constant : std_logic_vector(3 downto 0);
    signal expr_76_wire_constant : std_logic_vector(3 downto 0);
    signal expr_83_wire_constant : std_logic_vector(3 downto 0);
    signal expr_88_wire_constant : std_logic_vector(3 downto 0);
    signal expr_94_wire_constant : std_logic_vector(3 downto 0);
    signal nu_91 : std_logic_vector(10 downto 0);
    signal nv_67 : std_logic_vector(10 downto 0);
    signal simple_obj_ref_39_wire_constant : std_logic_vector(10 downto 0);
    signal simple_obj_ref_51_wire_constant : std_logic_vector(0 downto 0);
    signal simple_obj_ref_56_wire_constant : std_logic_vector(0 downto 0);
    signal simple_obj_ref_81_wire_constant : std_logic_vector(0 downto 0);
    signal simple_obj_ref_86_wire_constant : std_logic_vector(0 downto 0);
    signal ternary_60_wire : std_logic_vector(10 downto 0);
    signal u_97 : std_logic_vector(9 downto 0);
    signal u_in_23 : std_logic_vector(9 downto 0);
    signal v_71 : std_logic_vector(9 downto 0);
    signal v_in_27 : std_logic_vector(9 downto 0);
    signal xxshift_and_add_multiplierxxcount : std_logic_vector(10 downto 0);
    signal xxshift_and_add_multiplierxxz1 : std_logic_vector(0 downto 0);
    signal xxshift_and_add_multiplierxxz9 : std_logic_vector(8 downto 0);
    -- 
  begin -- 
    expr_101_wire_constant <= "0001";
    expr_107_wire_constant <= "0000";
    expr_25_wire_constant <= "0000000000";
    expr_29_wire_constant <= "0000000000";
    expr_35_wire_constant <= "0001";
    expr_46_wire_constant <= "0000";
    expr_53_wire_constant <= "0001";
    expr_58_wire_constant <= "0001";
    expr_61_wire_constant <= "0000";
    expr_65_wire_constant <= "0001";
    expr_76_wire_constant <= "0000";
    expr_83_wire_constant <= "0001";
    expr_88_wire_constant <= "0001";
    expr_94_wire_constant <= "0001";
    simple_obj_ref_39_wire_constant <= "10000000000";
    simple_obj_ref_51_wire_constant <= "0";
    simple_obj_ref_56_wire_constant <= "0";
    simple_obj_ref_81_wire_constant <= "0";
    simple_obj_ref_86_wire_constant <= "0";
    xxshift_and_add_multiplierxxcount <= "10000000000";
    xxshift_and_add_multiplierxxz1 <= "0";
    xxshift_and_add_multiplierxxz9 <= "000000000";
    phi_stmt_23: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= expr_25_wire_constant & u_97;
      req <= phi_stmt_23_req_0 & phi_stmt_23_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_23_ack_0,
          idata => idata,
          odata => u_in_23,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_23
    phi_stmt_27: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= expr_29_wire_constant & v_71;
      req <= phi_stmt_27_req_0 & phi_stmt_27_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_27_ack_0,
          idata => idata,
          odata => v_in_27,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_27
    phi_stmt_31: Block -- phi operator 
      signal idata: std_logic_vector(19 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= a & binary_36_wire;
      req <= phi_stmt_31_req_0 & phi_stmt_31_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 10) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_31_ack_0,
          idata => idata,
          odata => a_0_31,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_31
    phi_stmt_37: Block -- phi operator 
      signal idata: std_logic_vector(21 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= simple_obj_ref_39_wire_constant & ctr_103;
      req <= phi_stmt_37_req_0 & phi_stmt_37_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 11) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_37_ack_0,
          idata => idata,
          odata => ctr_37,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_37
    ternary_60_inst: SelectBase generic map(data_width => 11) -- 
      port map( x => binary_54_wire, y => binary_59_wire, sel => binary_47_wire, z => ternary_60_wire, req => ternary_60_inst_req_0, ack => ternary_60_inst_ack_0, clk => clk, reset => reset); -- 
    ternary_90_inst: SelectBase generic map(data_width => 11) -- 
      port map( x => binary_84_wire, y => binary_89_wire, sel => binary_77_wire, z => nu_91, req => ternary_90_inst_req_0, ack => ternary_90_inst_ack_0, clk => clk, reset => reset); -- 
    type_cast_70_inst: RegisterBase generic map(in_data_width => 11,out_data_width => 10) -- 
      port map( din => nv_67, dout => v_71, req => type_cast_70_inst_req_0, ack => type_cast_70_inst_ack_0, clk => clk, reset => reset); -- 
    type_cast_96_inst: RegisterBase generic map(in_data_width => 11,out_data_width => 10) -- 
      port map( din => binary_95_wire, dout => u_97, req => type_cast_96_inst_req_0, ack => type_cast_96_inst_ack_0, clk => clk, reset => reset); -- 
    if_stmt_105_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= binary_108_wire;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_105_branch_req_0,
          ack0 => if_stmt_105_branch_ack_0,
          ack1 => if_stmt_105_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared split operator group (0) : binary_102_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= ctr_37;
      ctr_103 <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_102_inst_req_0,
          ackL => binary_102_inst_ack_0,
          reqR => binary_102_inst_req_1,
          ackR => binary_102_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_108_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= ctr_103;
      binary_108_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApBitsel",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_108_inst_req_0,
          ackL => binary_108_inst_ack_0,
          reqR => binary_108_inst_req_1,
          ackR => binary_108_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_117_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(19 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= u_97 & v_71;
      aXb <= data_out(19 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApConcat",
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
          owidth => 20,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_117_inst_req_0,
          ackL => binary_117_inst_ack_0,
          reqR => binary_117_inst_req_1,
          ackR => binary_117_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 2
    -- shared split operator group (3) : binary_36_inst 
    SplitOperatorGroup3: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= a_0_31;
      binary_36_wire <= data_out(9 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
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
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_36_inst_req_0,
          ackL => binary_36_inst_ack_0,
          reqR => binary_36_inst_req_1,
          ackR => binary_36_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 3
    -- shared split operator group (4) : binary_47_inst 
    SplitOperatorGroup4: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= a_0_31;
      binary_47_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApBitsel",
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
          constant_operand => "0000",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_47_inst_req_0,
          ackL => binary_47_inst_ack_0,
          reqR => binary_47_inst_req_1,
          ackR => binary_47_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 4
    -- shared split operator group (5) : binary_50_inst 
    SplitOperatorGroup5: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= u_in_23 & b;
      binary_50_wire <= data_out(9 downto 0);
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
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_50_inst_req_0,
          ackL => binary_50_inst_ack_0,
          reqR => binary_50_inst_req_1,
          ackR => binary_50_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 5
    -- shared split operator group (6) : binary_52_inst 
    SplitOperatorGroup6: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_50_wire;
      binary_52_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApConcat",
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
          owidth => 11,
          constant_operand => "0",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_52_inst_req_0,
          ackL => binary_52_inst_ack_0,
          reqR => binary_52_inst_req_1,
          ackR => binary_52_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 6
    -- shared split operator group (7) : binary_54_inst 
    SplitOperatorGroup7: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_52_wire;
      binary_54_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_54_inst_req_0,
          ackL => binary_54_inst_ack_0,
          reqR => binary_54_inst_req_1,
          ackR => binary_54_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 7
    -- shared split operator group (8) : binary_57_inst 
    SplitOperatorGroup8: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= u_in_23;
      binary_57_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApConcat",
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
          owidth => 11,
          constant_operand => "0",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_57_inst_req_0,
          ackL => binary_57_inst_ack_0,
          reqR => binary_57_inst_req_1,
          ackR => binary_57_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 8
    -- shared split operator group (9) : binary_59_inst 
    SplitOperatorGroup9: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_57_wire;
      binary_59_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_59_inst_req_0,
          ackL => binary_59_inst_ack_0,
          reqR => binary_59_inst_req_1,
          ackR => binary_59_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 9
    -- shared split operator group (10) : binary_62_inst 
    SplitOperatorGroup10: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= ternary_60_wire;
      binary_62_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApBitsel",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0000",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_62_inst_req_0,
          ackL => binary_62_inst_ack_0,
          reqR => binary_62_inst_req_1,
          ackR => binary_62_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 10
    -- shared split operator group (11) : binary_64_inst 
    SplitOperatorGroup11: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_62_wire & v_in_27;
      binary_64_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApConcat",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_64_inst_req_0,
          ackL => binary_64_inst_ack_0,
          reqR => binary_64_inst_req_1,
          ackR => binary_64_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 11
    -- shared split operator group (12) : binary_66_inst 
    SplitOperatorGroup12: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_64_wire;
      nv_67 <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_66_inst_req_0,
          ackL => binary_66_inst_ack_0,
          reqR => binary_66_inst_req_1,
          ackR => binary_66_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 12
    -- shared split operator group (13) : binary_77_inst 
    SplitOperatorGroup13: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= a_0_31;
      binary_77_wire <= data_out(0 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApBitsel",
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
          constant_operand => "0000",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_77_inst_req_0,
          ackL => binary_77_inst_ack_0,
          reqR => binary_77_inst_req_1,
          ackR => binary_77_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 13
    -- shared split operator group (14) : binary_80_inst 
    SplitOperatorGroup14: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= u_in_23 & b;
      binary_80_wire <= data_out(9 downto 0);
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
          iwidth_2      => 10, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 10,
          constant_operand => "0",
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
    end Block; -- split operator group 14
    -- shared split operator group (15) : binary_82_inst 
    SplitOperatorGroup15: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_80_wire;
      binary_82_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApConcat",
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
          owidth => 11,
          constant_operand => "0",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_82_inst_req_0,
          ackL => binary_82_inst_ack_0,
          reqR => binary_82_inst_req_1,
          ackR => binary_82_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 15
    -- shared split operator group (16) : binary_84_inst 
    SplitOperatorGroup16: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_82_wire;
      binary_84_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_84_inst_req_0,
          ackL => binary_84_inst_ack_0,
          reqR => binary_84_inst_req_1,
          ackR => binary_84_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 16
    -- shared split operator group (17) : binary_87_inst 
    SplitOperatorGroup17: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= u_in_23;
      binary_87_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApConcat",
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
          owidth => 11,
          constant_operand => "0",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_87_inst_req_0,
          ackL => binary_87_inst_ack_0,
          reqR => binary_87_inst_req_1,
          ackR => binary_87_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 17
    -- shared split operator group (18) : binary_89_inst 
    SplitOperatorGroup18: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= binary_87_wire;
      binary_89_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_89_inst_req_0,
          ackL => binary_89_inst_ack_0,
          reqR => binary_89_inst_req_1,
          ackR => binary_89_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 18
    -- shared split operator group (19) : binary_95_inst 
    SplitOperatorGroup19: Block -- 
      signal data_in: std_logic_vector(10 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= nu_91;
      binary_95_wire <= data_out(10 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0001",
          use_constant  => true,
          zero_delay => false, 
          flow_through => true--
        ) 
        port map ( -- 
          reqL => binary_95_inst_req_0,
          ackL => binary_95_inst_ack_0,
          reqR => binary_95_inst_req_1,
          ackR => binary_95_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 19
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
entity test_bench is -- 
  port ( -- 
    ret_success : out  std_logic_vector(0 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    shift_and_add_multiplier_call_reqs : out  std_logic_vector(0 downto 0);
    shift_and_add_multiplier_call_acks : in   std_logic_vector(0 downto 0);
    shift_and_add_multiplier_call_data : out  std_logic_vector(19 downto 0);
    shift_and_add_multiplier_call_tag  :  out  std_logic_vector(0 downto 0);
    shift_and_add_multiplier_return_reqs : out  std_logic_vector(0 downto 0);
    shift_and_add_multiplier_return_acks : in   std_logic_vector(0 downto 0);
    shift_and_add_multiplier_return_data : in   std_logic_vector(19 downto 0);
    shift_and_add_multiplier_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity test_bench;
architecture Default of test_bench is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal call_stmt_136_call_req_0 : boolean;
  signal call_stmt_136_call_ack_0 : boolean;
  signal call_stmt_136_call_req_1 : boolean;
  signal call_stmt_136_call_ack_1 : boolean;
  signal type_cast_140_inst_req_0 : boolean;
  signal type_cast_140_inst_ack_0 : boolean;
  signal binary_141_inst_req_0 : boolean;
  signal binary_141_inst_ack_0 : boolean;
  signal binary_141_inst_req_1 : boolean;
  signal binary_141_inst_ack_1 : boolean;
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
  test_bench_CP_340: Block -- control-path 
    signal test_bench_CP_340_start: Boolean;
    signal Xentry_341_symbol: Boolean;
    signal Xexit_342_symbol: Boolean;
    signal assign_stmt_124_343_symbol : Boolean;
    signal assign_stmt_127_347_symbol : Boolean;
    signal assign_stmt_132_351_symbol : Boolean;
    signal call_stmt_136_355_symbol : Boolean;
    signal assign_stmt_142_368_symbol : Boolean;
    -- 
  begin -- 
    test_bench_CP_340_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_341_symbol  <= test_bench_CP_340_start; -- transition $entry
    assign_stmt_124_343: Block -- assign_stmt_124 
      signal assign_stmt_124_343_start: Boolean;
      signal Xentry_344_symbol: Boolean;
      signal Xexit_345_symbol: Boolean;
      signal dummy_346_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_124_343_start <= Xentry_341_symbol; -- control passed to block
      Xentry_344_symbol  <= assign_stmt_124_343_start; -- transition assign_stmt_124/$entry
      dummy_346_symbol <= Xentry_344_symbol; -- transition assign_stmt_124/dummy
      Xexit_345_symbol <= dummy_346_symbol; -- transition assign_stmt_124/$exit
      assign_stmt_124_343_symbol <= Xexit_345_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_124
    assign_stmt_127_347: Block -- assign_stmt_127 
      signal assign_stmt_127_347_start: Boolean;
      signal Xentry_348_symbol: Boolean;
      signal Xexit_349_symbol: Boolean;
      signal dummy_350_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_127_347_start <= assign_stmt_124_343_symbol; -- control passed to block
      Xentry_348_symbol  <= assign_stmt_127_347_start; -- transition assign_stmt_127/$entry
      dummy_350_symbol <= Xentry_348_symbol; -- transition assign_stmt_127/dummy
      Xexit_349_symbol <= dummy_350_symbol; -- transition assign_stmt_127/$exit
      assign_stmt_127_347_symbol <= Xexit_349_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_127
    assign_stmt_132_351: Block -- assign_stmt_132 
      signal assign_stmt_132_351_start: Boolean;
      signal Xentry_352_symbol: Boolean;
      signal Xexit_353_symbol: Boolean;
      signal dummy_354_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_132_351_start <= assign_stmt_127_347_symbol; -- control passed to block
      Xentry_352_symbol  <= assign_stmt_132_351_start; -- transition assign_stmt_132/$entry
      dummy_354_symbol <= Xentry_352_symbol; -- transition assign_stmt_132/dummy
      Xexit_353_symbol <= dummy_354_symbol; -- transition assign_stmt_132/$exit
      assign_stmt_132_351_symbol <= Xexit_353_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_132
    call_stmt_136_355: Block -- call_stmt_136 
      signal call_stmt_136_355_start: Boolean;
      signal Xentry_356_symbol: Boolean;
      signal Xexit_357_symbol: Boolean;
      signal call_stmt_136_in_args_x_x358_symbol : Boolean;
      signal crr_361_symbol : Boolean;
      signal cra_362_symbol : Boolean;
      signal ccr_363_symbol : Boolean;
      signal cca_364_symbol : Boolean;
      signal call_stmt_136_out_args_x_x365_symbol : Boolean;
      -- 
    begin -- 
      call_stmt_136_355_start <= assign_stmt_132_351_symbol; -- control passed to block
      Xentry_356_symbol  <= call_stmt_136_355_start; -- transition call_stmt_136/$entry
      call_stmt_136_in_args_x_x358: Block -- call_stmt_136/call_stmt_136_in_args_ 
        signal call_stmt_136_in_args_x_x358_start: Boolean;
        signal Xentry_359_symbol: Boolean;
        signal Xexit_360_symbol: Boolean;
        -- 
      begin -- 
        call_stmt_136_in_args_x_x358_start <= Xentry_356_symbol; -- control passed to block
        Xentry_359_symbol  <= call_stmt_136_in_args_x_x358_start; -- transition call_stmt_136/call_stmt_136_in_args_/$entry
        Xexit_360_symbol <= Xentry_359_symbol; -- transition call_stmt_136/call_stmt_136_in_args_/$exit
        call_stmt_136_in_args_x_x358_symbol <= Xexit_360_symbol; -- control passed from block 
        -- 
      end Block; -- call_stmt_136/call_stmt_136_in_args_
      crr_361_symbol <= call_stmt_136_in_args_x_x358_symbol; -- transition call_stmt_136/crr
      call_stmt_136_call_req_0 <= crr_361_symbol; -- link to DP
      cra_362_symbol <= call_stmt_136_call_ack_0; -- transition call_stmt_136/cra
      ccr_363_symbol <= cra_362_symbol; -- transition call_stmt_136/ccr
      call_stmt_136_call_req_1 <= ccr_363_symbol; -- link to DP
      cca_364_symbol <= call_stmt_136_call_ack_1; -- transition call_stmt_136/cca
      call_stmt_136_out_args_x_x365: Block -- call_stmt_136/call_stmt_136_out_args_ 
        signal call_stmt_136_out_args_x_x365_start: Boolean;
        signal Xentry_366_symbol: Boolean;
        signal Xexit_367_symbol: Boolean;
        -- 
      begin -- 
        call_stmt_136_out_args_x_x365_start <= cca_364_symbol; -- control passed to block
        Xentry_366_symbol  <= call_stmt_136_out_args_x_x365_start; -- transition call_stmt_136/call_stmt_136_out_args_/$entry
        Xexit_367_symbol <= Xentry_366_symbol; -- transition call_stmt_136/call_stmt_136_out_args_/$exit
        call_stmt_136_out_args_x_x365_symbol <= Xexit_367_symbol; -- control passed from block 
        -- 
      end Block; -- call_stmt_136/call_stmt_136_out_args_
      Xexit_357_symbol <= call_stmt_136_out_args_x_x365_symbol; -- transition call_stmt_136/$exit
      call_stmt_136_355_symbol <= Xexit_357_symbol; -- control passed from block 
      -- 
    end Block; -- call_stmt_136
    assign_stmt_142_368: Block -- assign_stmt_142 
      signal assign_stmt_142_368_start: Boolean;
      signal Xentry_369_symbol: Boolean;
      signal Xexit_370_symbol: Boolean;
      signal binary_141_371_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_142_368_start <= call_stmt_136_355_symbol; -- control passed to block
      Xentry_369_symbol  <= assign_stmt_142_368_start; -- transition assign_stmt_142/$entry
      binary_141_371: Block -- assign_stmt_142/binary_141 
        signal binary_141_371_start: Boolean;
        signal Xentry_372_symbol: Boolean;
        signal Xexit_373_symbol: Boolean;
        signal binary_141_inputs_374_symbol : Boolean;
        signal rr_382_symbol : Boolean;
        signal ra_383_symbol : Boolean;
        signal cr_384_symbol : Boolean;
        signal ca_385_symbol : Boolean;
        -- 
      begin -- 
        binary_141_371_start <= Xentry_369_symbol; -- control passed to block
        Xentry_372_symbol  <= binary_141_371_start; -- transition assign_stmt_142/binary_141/$entry
        binary_141_inputs_374: Block -- assign_stmt_142/binary_141/binary_141_inputs 
          signal binary_141_inputs_374_start: Boolean;
          signal Xentry_375_symbol: Boolean;
          signal Xexit_376_symbol: Boolean;
          signal type_cast_140_377_symbol : Boolean;
          -- 
        begin -- 
          binary_141_inputs_374_start <= Xentry_372_symbol; -- control passed to block
          Xentry_375_symbol  <= binary_141_inputs_374_start; -- transition assign_stmt_142/binary_141/binary_141_inputs/$entry
          type_cast_140_377: Block -- assign_stmt_142/binary_141/binary_141_inputs/type_cast_140 
            signal type_cast_140_377_start: Boolean;
            signal Xentry_378_symbol: Boolean;
            signal Xexit_379_symbol: Boolean;
            signal req_380_symbol : Boolean;
            signal ack_381_symbol : Boolean;
            -- 
          begin -- 
            type_cast_140_377_start <= Xentry_375_symbol; -- control passed to block
            Xentry_378_symbol  <= type_cast_140_377_start; -- transition assign_stmt_142/binary_141/binary_141_inputs/type_cast_140/$entry
            req_380_symbol <= Xentry_378_symbol; -- transition assign_stmt_142/binary_141/binary_141_inputs/type_cast_140/req
            type_cast_140_inst_req_0 <= req_380_symbol; -- link to DP
            ack_381_symbol <= type_cast_140_inst_ack_0; -- transition assign_stmt_142/binary_141/binary_141_inputs/type_cast_140/ack
            Xexit_379_symbol <= ack_381_symbol; -- transition assign_stmt_142/binary_141/binary_141_inputs/type_cast_140/$exit
            type_cast_140_377_symbol <= Xexit_379_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_142/binary_141/binary_141_inputs/type_cast_140
          Xexit_376_symbol <= type_cast_140_377_symbol; -- transition assign_stmt_142/binary_141/binary_141_inputs/$exit
          binary_141_inputs_374_symbol <= Xexit_376_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_142/binary_141/binary_141_inputs
        rr_382_symbol <= binary_141_inputs_374_symbol; -- transition assign_stmt_142/binary_141/rr
        binary_141_inst_req_0 <= rr_382_symbol; -- link to DP
        ra_383_symbol <= binary_141_inst_ack_0; -- transition assign_stmt_142/binary_141/ra
        cr_384_symbol <= ra_383_symbol; -- transition assign_stmt_142/binary_141/cr
        binary_141_inst_req_1 <= cr_384_symbol; -- link to DP
        ca_385_symbol <= binary_141_inst_ack_1; -- transition assign_stmt_142/binary_141/ca
        Xexit_373_symbol <= ca_385_symbol; -- transition assign_stmt_142/binary_141/$exit
        binary_141_371_symbol <= Xexit_373_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_142/binary_141
      Xexit_370_symbol <= binary_141_371_symbol; -- transition assign_stmt_142/$exit
      assign_stmt_142_368_symbol <= Xexit_370_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_142
    Xexit_342_symbol <= assign_stmt_142_368_symbol; -- transition $exit
    fin  <=  '1' when Xexit_342_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal a_124 : std_logic_vector(9 downto 0);
    signal b_127 : std_logic_vector(9 downto 0);
    signal c_132 : std_logic_vector(9 downto 0);
    signal d_136 : std_logic_vector(19 downto 0);
    signal type_cast_140_wire : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    a_124 <= "0000010111";
    b_127 <= "0000010001";
    c_132 <= "0110000111";
    type_cast_140_inst: RegisterBase generic map(in_data_width => 20,out_data_width => 10) -- 
      port map( din => d_136, dout => type_cast_140_wire, req => type_cast_140_inst_req_0, ack => type_cast_140_inst_ack_0, clk => clk, reset => reset); -- 
    -- shared split operator group (0) : binary_141_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      data_in <= type_cast_140_wire;
      ret_success <= data_out(0 downto 0);
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
          constant_operand => "0110000111",
          use_constant  => true,
          zero_delay => false, 
          flow_through => false--
        ) 
        port map ( -- 
          reqL => binary_141_inst_req_0,
          ackL => binary_141_inst_ack_0,
          reqR => binary_141_inst_req_1,
          ackR => binary_141_inst_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared call operator group (0) : call_stmt_136_call 
    CallGroup0: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(19 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= call_stmt_136_call_req_0;
      call_stmt_136_call_ack_0 <= ackL(0);
      reqR(0) <= call_stmt_136_call_req_1;
      call_stmt_136_call_ack_1 <= ackR(0);
      data_in <= a_124 & b_127;
      d_136 <= data_out(19 downto 0);
      CallReq: InputMuxBase -- 
        generic map (  iwidth => 20, owidth => 20, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => shift_and_add_multiplier_call_reqs(0),
          ackR => shift_and_add_multiplier_call_acks(0),
          dataR => shift_and_add_multiplier_call_data(19 downto 0),
          tagR => shift_and_add_multiplier_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map ( 
        iwidth => 20, owidth => 20, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => shift_and_add_multiplier_return_acks(0), -- cross-over
          ackL => shift_and_add_multiplier_return_reqs(0), -- cross-over
          dataL => shift_and_add_multiplier_return_data(19 downto 0),
          tagL => shift_and_add_multiplier_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
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
    test_bench_ret_success : out  std_logic_vector(0 downto 0);
    test_bench_tag_in: in std_logic_vector(0 downto 0);
    test_bench_tag_out: out std_logic_vector(0 downto 0);
    test_bench_start : in std_logic;
    test_bench_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module shift_and_add_multiplier
  component shift_and_add_multiplier is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : in  std_logic_vector(9 downto 0);
      aXb : out  std_logic_vector(19 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module shift_and_add_multiplier
  signal shift_and_add_multiplier_a :  std_logic_vector(9 downto 0);
  signal shift_and_add_multiplier_b :  std_logic_vector(9 downto 0);
  signal shift_and_add_multiplier_aXb :  std_logic_vector(19 downto 0);
  signal shift_and_add_multiplier_in_args    : std_logic_vector(19 downto 0);
  signal shift_and_add_multiplier_out_args   : std_logic_vector(19 downto 0);
  signal shift_and_add_multiplier_tag_in    : std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_tag_out   : std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_start : std_logic;
  signal shift_and_add_multiplier_fin   : std_logic;
  -- caller side aggregated signals for module shift_and_add_multiplier
  signal shift_and_add_multiplier_call_reqs: std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_call_acks: std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_return_reqs: std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_return_acks: std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_call_data: std_logic_vector(19 downto 0);
  signal shift_and_add_multiplier_call_tag: std_logic_vector(0 downto 0);
  signal shift_and_add_multiplier_return_data: std_logic_vector(19 downto 0);
  signal shift_and_add_multiplier_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module test_bench
  component test_bench is -- 
    port ( -- 
      ret_success : out  std_logic_vector(0 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      shift_and_add_multiplier_call_reqs : out  std_logic_vector(0 downto 0);
      shift_and_add_multiplier_call_acks : in   std_logic_vector(0 downto 0);
      shift_and_add_multiplier_call_data : out  std_logic_vector(19 downto 0);
      shift_and_add_multiplier_call_tag  :  out  std_logic_vector(0 downto 0);
      shift_and_add_multiplier_return_reqs : out  std_logic_vector(0 downto 0);
      shift_and_add_multiplier_return_acks : in   std_logic_vector(0 downto 0);
      shift_and_add_multiplier_return_data : in   std_logic_vector(19 downto 0);
      shift_and_add_multiplier_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- 
begin -- 
  -- module shift_and_add_multiplier
  shift_and_add_multiplier_a <= shift_and_add_multiplier_in_args(19 downto 10);
  shift_and_add_multiplier_b <= shift_and_add_multiplier_in_args(9 downto 0);
  shift_and_add_multiplier_out_args <= shift_and_add_multiplier_aXb ;
  -- call arbiter for module shift_and_add_multiplier
  shift_and_add_multiplier_arbiter: CallArbiterUnitary -- 
    generic map( --
      num_reqs => 1,
      call_data_width => 20,
      return_data_width => 20,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => shift_and_add_multiplier_call_reqs,
      call_acks => shift_and_add_multiplier_call_acks,
      return_reqs => shift_and_add_multiplier_return_reqs,
      return_acks => shift_and_add_multiplier_return_acks,
      call_data  => shift_and_add_multiplier_call_data,
      call_tag  => shift_and_add_multiplier_call_tag,
      return_tag  => shift_and_add_multiplier_return_tag,
      call_in_tag => shift_and_add_multiplier_tag_in,
      call_out_tag => shift_and_add_multiplier_tag_out,
      return_data =>shift_and_add_multiplier_return_data,
      call_start => shift_and_add_multiplier_start,
      call_fin => shift_and_add_multiplier_fin,
      call_in_args => shift_and_add_multiplier_in_args,
      call_out_args => shift_and_add_multiplier_out_args,
      clk => clk, 
      reset => reset --
    ); --
  shift_and_add_multiplier_instance:shift_and_add_multiplier-- 
    port map(-- 
      a => shift_and_add_multiplier_a,
      b => shift_and_add_multiplier_b,
      aXb => shift_and_add_multiplier_aXb,
      start => shift_and_add_multiplier_start,
      fin => shift_and_add_multiplier_fin,
      clk => clk,
      reset => reset,
      tag_in => shift_and_add_multiplier_tag_in,
      tag_out => shift_and_add_multiplier_tag_out-- 
    ); -- 
  -- module test_bench
  test_bench_instance:test_bench-- 
    port map(-- 
      ret_success => test_bench_ret_success,
      start => test_bench_start,
      fin => test_bench_fin,
      clk => clk,
      reset => reset,
      shift_and_add_multiplier_call_reqs => shift_and_add_multiplier_call_reqs(0 downto 0),
      shift_and_add_multiplier_call_acks => shift_and_add_multiplier_call_acks(0 downto 0),
      shift_and_add_multiplier_call_data => shift_and_add_multiplier_call_data(19 downto 0),
      shift_and_add_multiplier_call_tag => shift_and_add_multiplier_call_tag(0 downto 0),
      shift_and_add_multiplier_return_reqs => shift_and_add_multiplier_return_reqs(0 downto 0),
      shift_and_add_multiplier_return_acks => shift_and_add_multiplier_return_acks(0 downto 0),
      shift_and_add_multiplier_return_data => shift_and_add_multiplier_return_data(19 downto 0),
      shift_and_add_multiplier_return_tag => shift_and_add_multiplier_return_tag(0 downto 0),
      tag_in => test_bench_tag_in,
      tag_out => test_bench_tag_out-- 
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
      test_bench_ret_success : out  std_logic_vector(0 downto 0);
      test_bench_tag_in: in std_logic_vector(0 downto 0);
      test_bench_tag_out: out std_logic_vector(0 downto 0);
      test_bench_start : in std_logic;
      test_bench_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal test_bench_ret_success :   std_logic_vector(0 downto 0);
  signal test_bench_tag_in: std_logic_vector(0 downto 0);
  signal test_bench_tag_out: std_logic_vector(0 downto 0);
  signal test_bench_start : std_logic := '0';
  signal test_bench_fin   : std_logic := '0';
  -- 
begin --

  clk <= not clk after 5 ns;
  process
  begin
	wait until clk = '1';
	reset <= '0'; 
	test_bench_start <= '1';
	wait until clk = '1';
	test_bench_start <= '0';
	while test_bench_fin /= '1' loop
		wait until clk = '1';
	end loop;
  	wait;
  end process;

  test_system_instance: test_system -- 
    port map ( -- 
      test_bench_ret_success => test_bench_ret_success,
      test_bench_tag_in => test_bench_tag_in,
      test_bench_tag_out => test_bench_tag_out,
      test_bench_start => test_bench_start,
      test_bench_fin  => test_bench_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
