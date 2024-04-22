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
    b : in  std_logic_vector(3 downto 0);
    c : out  std_logic_vector(10 downto 0);
    d : out  std_logic_vector(9 downto 0);
    e : out  std_logic_vector(9 downto 0);
    f : out  std_logic_vector(9 downto 0);
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
  signal assign_stmt_25Xbinary_24Xrr_cp_to_dp : boolean;
  signal assign_stmt_25Xbinary_24Xra_dp_to_cp : boolean;
  signal assign_stmt_25Xbinary_24Xcr_cp_to_dp : boolean;
  signal assign_stmt_25Xbinary_24Xca_dp_to_cp : boolean;
  signal assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xrr_cp_to_dp : boolean;
  signal assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xra_dp_to_cp : boolean;
  signal assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xcr_cp_to_dp : boolean;
  signal assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xca_dp_to_cp : boolean;
  signal assign_stmt_20Xbinary_19Xrr_cp_to_dp : boolean;
  signal assign_stmt_20Xbinary_19Xra_dp_to_cp : boolean;
  signal assign_stmt_20Xbinary_19Xcr_cp_to_dp : boolean;
  signal assign_stmt_20Xbinary_19Xca_dp_to_cp : boolean;
  signal assign_stmt_30Xbinary_29Xrr_cp_to_dp : boolean;
  signal assign_stmt_30Xbinary_29Xra_dp_to_cp : boolean;
  signal assign_stmt_30Xbinary_29Xcr_cp_to_dp : boolean;
  signal assign_stmt_30Xbinary_29Xca_dp_to_cp : boolean;
  signal assign_stmt_35Xbinary_34Xrr_cp_to_dp : boolean;
  signal assign_stmt_35Xbinary_34Xra_dp_to_cp : boolean;
  signal assign_stmt_35Xbinary_34Xcr_cp_to_dp : boolean;
  signal assign_stmt_35Xbinary_34Xca_dp_to_cp : boolean;
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
    signal assign_stmt_20_3_symbol : Boolean;
    signal assign_stmt_25_26_symbol : Boolean;
    signal assign_stmt_30_39_symbol : Boolean;
    signal assign_stmt_35_52_symbol : Boolean;
    -- 
  begin -- 
    sum_mod_CP_0_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_1_symbol  <= sum_mod_CP_0_start; -- transition $entry
    assign_stmt_20_3: Block -- assign_stmt_20 
      signal assign_stmt_20_3_start: Boolean;
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal binary_19_6_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_20_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= assign_stmt_20_3_start; -- transition assign_stmt_20/$entry
      binary_19_6: Block -- assign_stmt_20/binary_19 
        signal binary_19_6_start: Boolean;
        signal Xentry_7_symbol: Boolean;
        signal Xexit_8_symbol: Boolean;
        signal binary_19_inputs_9_symbol : Boolean;
        signal rr_22_symbol : Boolean;
        signal ra_23_symbol : Boolean;
        signal cr_24_symbol : Boolean;
        signal ca_25_symbol : Boolean;
        -- 
      begin -- 
        binary_19_6_start <= Xentry_4_symbol; -- control passed to block
        Xentry_7_symbol  <= binary_19_6_start; -- transition assign_stmt_20/binary_19/$entry
        binary_19_inputs_9: Block -- assign_stmt_20/binary_19/binary_19_inputs 
          signal binary_19_inputs_9_start: Boolean;
          signal Xentry_10_symbol: Boolean;
          signal Xexit_11_symbol: Boolean;
          signal binary_17_12_symbol : Boolean;
          -- 
        begin -- 
          binary_19_inputs_9_start <= Xentry_7_symbol; -- control passed to block
          Xentry_10_symbol  <= binary_19_inputs_9_start; -- transition assign_stmt_20/binary_19/binary_19_inputs/$entry
          binary_17_12: Block -- assign_stmt_20/binary_19/binary_19_inputs/binary_17 
            signal binary_17_12_start: Boolean;
            signal Xentry_13_symbol: Boolean;
            signal Xexit_14_symbol: Boolean;
            signal binary_17_inputs_15_symbol : Boolean;
            signal rr_18_symbol : Boolean;
            signal ra_19_symbol : Boolean;
            signal cr_20_symbol : Boolean;
            signal ca_21_symbol : Boolean;
            -- 
          begin -- 
            binary_17_12_start <= Xentry_10_symbol; -- control passed to block
            Xentry_13_symbol  <= binary_17_12_start; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/$entry
            binary_17_inputs_15: Block -- assign_stmt_20/binary_19/binary_19_inputs/binary_17/binary_17_inputs 
              signal binary_17_inputs_15_start: Boolean;
              signal Xentry_16_symbol: Boolean;
              signal Xexit_17_symbol: Boolean;
              -- 
            begin -- 
              binary_17_inputs_15_start <= Xentry_13_symbol; -- control passed to block
              Xentry_16_symbol  <= binary_17_inputs_15_start; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/binary_17_inputs/$entry
              Xexit_17_symbol <= Xentry_16_symbol; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/binary_17_inputs/$exit
              binary_17_inputs_15_symbol <= Xexit_17_symbol; -- control passed from block 
              -- 
            end Block; -- assign_stmt_20/binary_19/binary_19_inputs/binary_17/binary_17_inputs
            rr_18_symbol <= binary_17_inputs_15_symbol; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/rr
            assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xrr_cp_to_dp <= rr_18_symbol; -- link to DP
            ra_19_symbol <= assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xra_dp_to_cp; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/ra
            cr_20_symbol <= ra_19_symbol; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/cr
            assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xcr_cp_to_dp <= cr_20_symbol; -- link to DP
            ca_21_symbol <= assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xca_dp_to_cp; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/ca
            Xexit_14_symbol <= ca_21_symbol; -- transition assign_stmt_20/binary_19/binary_19_inputs/binary_17/$exit
            binary_17_12_symbol <= Xexit_14_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_20/binary_19/binary_19_inputs/binary_17
          Xexit_11_symbol <= binary_17_12_symbol; -- transition assign_stmt_20/binary_19/binary_19_inputs/$exit
          binary_19_inputs_9_symbol <= Xexit_11_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_20/binary_19/binary_19_inputs
        rr_22_symbol <= binary_19_inputs_9_symbol; -- transition assign_stmt_20/binary_19/rr
        assign_stmt_20Xbinary_19Xrr_cp_to_dp <= rr_22_symbol; -- link to DP
        ra_23_symbol <= assign_stmt_20Xbinary_19Xra_dp_to_cp; -- transition assign_stmt_20/binary_19/ra
        cr_24_symbol <= ra_23_symbol; -- transition assign_stmt_20/binary_19/cr
        assign_stmt_20Xbinary_19Xcr_cp_to_dp <= cr_24_symbol; -- link to DP
        ca_25_symbol <= assign_stmt_20Xbinary_19Xca_dp_to_cp; -- transition assign_stmt_20/binary_19/ca
        Xexit_8_symbol <= ca_25_symbol; -- transition assign_stmt_20/binary_19/$exit
        binary_19_6_symbol <= Xexit_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_20/binary_19
      Xexit_5_symbol <= binary_19_6_symbol; -- transition assign_stmt_20/$exit
      assign_stmt_20_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_20
    assign_stmt_25_26: Block -- assign_stmt_25 
      signal assign_stmt_25_26_start: Boolean;
      signal Xentry_27_symbol: Boolean;
      signal Xexit_28_symbol: Boolean;
      signal binary_24_29_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_25_26_start <= assign_stmt_20_3_symbol; -- control passed to block
      Xentry_27_symbol  <= assign_stmt_25_26_start; -- transition assign_stmt_25/$entry
      binary_24_29: Block -- assign_stmt_25/binary_24 
        signal binary_24_29_start: Boolean;
        signal Xentry_30_symbol: Boolean;
        signal Xexit_31_symbol: Boolean;
        signal binary_24_inputs_32_symbol : Boolean;
        signal rr_35_symbol : Boolean;
        signal ra_36_symbol : Boolean;
        signal cr_37_symbol : Boolean;
        signal ca_38_symbol : Boolean;
        -- 
      begin -- 
        binary_24_29_start <= Xentry_27_symbol; -- control passed to block
        Xentry_30_symbol  <= binary_24_29_start; -- transition assign_stmt_25/binary_24/$entry
        binary_24_inputs_32: Block -- assign_stmt_25/binary_24/binary_24_inputs 
          signal binary_24_inputs_32_start: Boolean;
          signal Xentry_33_symbol: Boolean;
          signal Xexit_34_symbol: Boolean;
          -- 
        begin -- 
          binary_24_inputs_32_start <= Xentry_30_symbol; -- control passed to block
          Xentry_33_symbol  <= binary_24_inputs_32_start; -- transition assign_stmt_25/binary_24/binary_24_inputs/$entry
          Xexit_34_symbol <= Xentry_33_symbol; -- transition assign_stmt_25/binary_24/binary_24_inputs/$exit
          binary_24_inputs_32_symbol <= Xexit_34_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_25/binary_24/binary_24_inputs
        rr_35_symbol <= binary_24_inputs_32_symbol; -- transition assign_stmt_25/binary_24/rr
        assign_stmt_25Xbinary_24Xrr_cp_to_dp <= rr_35_symbol; -- link to DP
        ra_36_symbol <= assign_stmt_25Xbinary_24Xra_dp_to_cp; -- transition assign_stmt_25/binary_24/ra
        cr_37_symbol <= ra_36_symbol; -- transition assign_stmt_25/binary_24/cr
        assign_stmt_25Xbinary_24Xcr_cp_to_dp <= cr_37_symbol; -- link to DP
        ca_38_symbol <= assign_stmt_25Xbinary_24Xca_dp_to_cp; -- transition assign_stmt_25/binary_24/ca
        Xexit_31_symbol <= ca_38_symbol; -- transition assign_stmt_25/binary_24/$exit
        binary_24_29_symbol <= Xexit_31_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_25/binary_24
      Xexit_28_symbol <= binary_24_29_symbol; -- transition assign_stmt_25/$exit
      assign_stmt_25_26_symbol <= Xexit_28_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_25
    assign_stmt_30_39: Block -- assign_stmt_30 
      signal assign_stmt_30_39_start: Boolean;
      signal Xentry_40_symbol: Boolean;
      signal Xexit_41_symbol: Boolean;
      signal binary_29_42_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_30_39_start <= assign_stmt_25_26_symbol; -- control passed to block
      Xentry_40_symbol  <= assign_stmt_30_39_start; -- transition assign_stmt_30/$entry
      binary_29_42: Block -- assign_stmt_30/binary_29 
        signal binary_29_42_start: Boolean;
        signal Xentry_43_symbol: Boolean;
        signal Xexit_44_symbol: Boolean;
        signal binary_29_inputs_45_symbol : Boolean;
        signal rr_48_symbol : Boolean;
        signal ra_49_symbol : Boolean;
        signal cr_50_symbol : Boolean;
        signal ca_51_symbol : Boolean;
        -- 
      begin -- 
        binary_29_42_start <= Xentry_40_symbol; -- control passed to block
        Xentry_43_symbol  <= binary_29_42_start; -- transition assign_stmt_30/binary_29/$entry
        binary_29_inputs_45: Block -- assign_stmt_30/binary_29/binary_29_inputs 
          signal binary_29_inputs_45_start: Boolean;
          signal Xentry_46_symbol: Boolean;
          signal Xexit_47_symbol: Boolean;
          -- 
        begin -- 
          binary_29_inputs_45_start <= Xentry_43_symbol; -- control passed to block
          Xentry_46_symbol  <= binary_29_inputs_45_start; -- transition assign_stmt_30/binary_29/binary_29_inputs/$entry
          Xexit_47_symbol <= Xentry_46_symbol; -- transition assign_stmt_30/binary_29/binary_29_inputs/$exit
          binary_29_inputs_45_symbol <= Xexit_47_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_30/binary_29/binary_29_inputs
        rr_48_symbol <= binary_29_inputs_45_symbol; -- transition assign_stmt_30/binary_29/rr
        assign_stmt_30Xbinary_29Xrr_cp_to_dp <= rr_48_symbol; -- link to DP
        ra_49_symbol <= assign_stmt_30Xbinary_29Xra_dp_to_cp; -- transition assign_stmt_30/binary_29/ra
        cr_50_symbol <= ra_49_symbol; -- transition assign_stmt_30/binary_29/cr
        assign_stmt_30Xbinary_29Xcr_cp_to_dp <= cr_50_symbol; -- link to DP
        ca_51_symbol <= assign_stmt_30Xbinary_29Xca_dp_to_cp; -- transition assign_stmt_30/binary_29/ca
        Xexit_44_symbol <= ca_51_symbol; -- transition assign_stmt_30/binary_29/$exit
        binary_29_42_symbol <= Xexit_44_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_30/binary_29
      Xexit_41_symbol <= binary_29_42_symbol; -- transition assign_stmt_30/$exit
      assign_stmt_30_39_symbol <= Xexit_41_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_30
    assign_stmt_35_52: Block -- assign_stmt_35 
      signal assign_stmt_35_52_start: Boolean;
      signal Xentry_53_symbol: Boolean;
      signal Xexit_54_symbol: Boolean;
      signal binary_34_55_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_35_52_start <= assign_stmt_30_39_symbol; -- control passed to block
      Xentry_53_symbol  <= assign_stmt_35_52_start; -- transition assign_stmt_35/$entry
      binary_34_55: Block -- assign_stmt_35/binary_34 
        signal binary_34_55_start: Boolean;
        signal Xentry_56_symbol: Boolean;
        signal Xexit_57_symbol: Boolean;
        signal binary_34_inputs_58_symbol : Boolean;
        signal rr_61_symbol : Boolean;
        signal ra_62_symbol : Boolean;
        signal cr_63_symbol : Boolean;
        signal ca_64_symbol : Boolean;
        -- 
      begin -- 
        binary_34_55_start <= Xentry_53_symbol; -- control passed to block
        Xentry_56_symbol  <= binary_34_55_start; -- transition assign_stmt_35/binary_34/$entry
        binary_34_inputs_58: Block -- assign_stmt_35/binary_34/binary_34_inputs 
          signal binary_34_inputs_58_start: Boolean;
          signal Xentry_59_symbol: Boolean;
          signal Xexit_60_symbol: Boolean;
          -- 
        begin -- 
          binary_34_inputs_58_start <= Xentry_56_symbol; -- control passed to block
          Xentry_59_symbol  <= binary_34_inputs_58_start; -- transition assign_stmt_35/binary_34/binary_34_inputs/$entry
          Xexit_60_symbol <= Xentry_59_symbol; -- transition assign_stmt_35/binary_34/binary_34_inputs/$exit
          binary_34_inputs_58_symbol <= Xexit_60_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_35/binary_34/binary_34_inputs
        rr_61_symbol <= binary_34_inputs_58_symbol; -- transition assign_stmt_35/binary_34/rr
        assign_stmt_35Xbinary_34Xrr_cp_to_dp <= rr_61_symbol; -- link to DP
        ra_62_symbol <= assign_stmt_35Xbinary_34Xra_dp_to_cp; -- transition assign_stmt_35/binary_34/ra
        cr_63_symbol <= ra_62_symbol; -- transition assign_stmt_35/binary_34/cr
        assign_stmt_35Xbinary_34Xcr_cp_to_dp <= cr_63_symbol; -- link to DP
        ca_64_symbol <= assign_stmt_35Xbinary_34Xca_dp_to_cp; -- transition assign_stmt_35/binary_34/ca
        Xexit_57_symbol <= ca_64_symbol; -- transition assign_stmt_35/binary_34/$exit
        binary_34_55_symbol <= Xexit_57_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_35/binary_34
      Xexit_54_symbol <= binary_34_55_symbol; -- transition assign_stmt_35/$exit
      assign_stmt_35_52_symbol <= Xexit_54_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_35
    Xexit_2_symbol <= assign_stmt_35_52_symbol; -- transition $exit
    fin  <=  '1' when Xexit_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal binary_17_wire : std_logic_vector(10 downto 0);
    signal expr_28_wire_constant : std_logic_vector(3 downto 0);
    signal expr_33_wire_constant : std_logic_vector(3 downto 0);
    signal simple_obj_ref_16_wire_constant : std_logic_vector(0 downto 0);
    signal xxsum_modxxz1 : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    expr_28_wire_constant <= "0001";
    expr_33_wire_constant <= "0001";
    simple_obj_ref_16_wire_constant <= "0";
    xxsum_modxxz1 <= "0";
    -- shared split operator group (0) : binary_17_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xrr_cp_to_dp;
      assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xcr_cp_to_dp;
      assign_stmt_20Xbinary_19Xbinary_19_inputsXbinary_17Xca_dp_to_cp <= ackR(0);
      data_in <= a;
      binary_17_wire <= data_out(10 downto 0);
      SplitOperator: SplitOperatorShared -- 
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
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_19_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(14 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_20Xbinary_19Xrr_cp_to_dp;
      assign_stmt_20Xbinary_19Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_20Xbinary_19Xcr_cp_to_dp;
      assign_stmt_20Xbinary_19Xca_dp_to_cp <= ackR(0);
      data_in <= binary_17_wire & b;
      c <= data_out(10 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApIntLSHR",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 11,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 4, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 11,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_24_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(13 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_25Xbinary_24Xrr_cp_to_dp;
      assign_stmt_25Xbinary_24Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_25Xbinary_24Xcr_cp_to_dp;
      assign_stmt_25Xbinary_24Xca_dp_to_cp <= ackR(0);
      data_in <= a & b;
      d <= data_out(9 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApIntLSHL",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 10,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 4, 
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
    -- shared split operator group (3) : binary_29_inst 
    SplitOperatorGroup3: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_30Xbinary_29Xrr_cp_to_dp;
      assign_stmt_30Xbinary_29Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_30Xbinary_29Xcr_cp_to_dp;
      assign_stmt_30Xbinary_29Xca_dp_to_cp <= ackR(0);
      data_in <= a;
      e <= data_out(9 downto 0);
      SplitOperator: SplitOperatorShared -- 
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
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 3
    -- shared split operator group (4) : binary_34_inst 
    SplitOperatorGroup4: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_35Xbinary_34Xrr_cp_to_dp;
      assign_stmt_35Xbinary_34Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_35Xbinary_34Xcr_cp_to_dp;
      assign_stmt_35Xbinary_34Xca_dp_to_cp <= ackR(0);
      data_in <= a;
      f <= data_out(9 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApIntLSHL",
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
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 4
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
    sum_mod_b : in  std_logic_vector(3 downto 0);
    sum_mod_c : out  std_logic_vector(10 downto 0);
    sum_mod_d : out  std_logic_vector(9 downto 0);
    sum_mod_e : out  std_logic_vector(9 downto 0);
    sum_mod_f : out  std_logic_vector(9 downto 0);
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
      b : in  std_logic_vector(3 downto 0);
      c : out  std_logic_vector(10 downto 0);
      d : out  std_logic_vector(9 downto 0);
      e : out  std_logic_vector(9 downto 0);
      f : out  std_logic_vector(9 downto 0);
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
      e => sum_mod_e,
      f => sum_mod_f,
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
      sum_mod_b : in  std_logic_vector(3 downto 0);
      sum_mod_c : out  std_logic_vector(10 downto 0);
      sum_mod_d : out  std_logic_vector(9 downto 0);
      sum_mod_e : out  std_logic_vector(9 downto 0);
      sum_mod_f : out  std_logic_vector(9 downto 0);
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
  signal sum_mod_b :  std_logic_vector(3 downto 0);
  signal sum_mod_c :   std_logic_vector(10 downto 0);
  signal sum_mod_d :   std_logic_vector(9 downto 0);
  signal sum_mod_e :   std_logic_vector(9 downto 0);
  signal sum_mod_f :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= (8 => '1', 1 => '1', 0 => '1', others => '0');
  sum_mod_b <= (1 => '1', 0 => '1', others => '0');
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
      sum_mod_c => sum_mod_c,
      sum_mod_d => sum_mod_d,
      sum_mod_e => sum_mod_e,
      sum_mod_f => sum_mod_f,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
