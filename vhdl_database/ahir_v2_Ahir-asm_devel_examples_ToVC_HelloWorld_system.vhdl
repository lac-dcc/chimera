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
use work.vc_system_type_package.all;
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
  signal assign_stmt_27Xbinary_26Xca_dp_to_cp : boolean;
  signal assign_stmt_32Xbinary_31Xrr_cp_to_dp : boolean;
  signal assign_stmt_32Xbinary_31Xra_dp_to_cp : boolean;
  signal assign_stmt_32Xbinary_31Xcr_cp_to_dp : boolean;
  signal assign_stmt_32Xbinary_31Xca_dp_to_cp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xrr_cp_to_dp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xra_dp_to_cp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xcr_cp_to_dp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xca_dp_to_cp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xrr_cp_to_dp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xra_dp_to_cp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xcr_cp_to_dp : boolean;
  signal assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xca_dp_to_cp : boolean;
  signal assign_stmt_27Xbinary_26Xrr_cp_to_dp : boolean;
  signal assign_stmt_27Xbinary_26Xra_dp_to_cp : boolean;
  signal assign_stmt_27Xbinary_26Xcr_cp_to_dp : boolean;
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
    signal cp_7_symbol : Boolean;
    signal cp_11_symbol : Boolean;
    signal cp_41_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- assign_stmt_14 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition assign_stmt_14/$entry
      cp_6_symbol <= cp_4_symbol; -- transition assign_stmt_14/dummy
      cp_5_symbol <= cp_6_symbol; -- transition assign_stmt_14/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_14
    cp_7: Block -- assign_stmt_19 
      signal cp_7_start: Boolean;
      signal cp_8_symbol: Boolean;
      signal cp_9_symbol: Boolean;
      signal cp_10_symbol : Boolean;
      -- 
    begin -- 
      cp_7_start <= cp_3_symbol; -- control passed to block
      cp_8_symbol  <= cp_7_start; -- transition assign_stmt_19/$entry
      cp_10_symbol <= cp_8_symbol; -- transition assign_stmt_19/dummy
      cp_9_symbol <= cp_10_symbol; -- transition assign_stmt_19/$exit
      cp_7_symbol <= cp_9_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_19
    cp_11: Block -- assign_stmt_27 
      signal cp_11_start: Boolean;
      signal cp_12_symbol: Boolean;
      signal cp_13_symbol: Boolean;
      signal cp_14_symbol : Boolean;
      -- 
    begin -- 
      cp_11_start <= cp_7_symbol; -- control passed to block
      cp_12_symbol  <= cp_11_start; -- transition assign_stmt_27/$entry
      cp_14: Block -- assign_stmt_27/binary_26 
        signal cp_14_start: Boolean;
        signal cp_15_symbol: Boolean;
        signal cp_16_symbol: Boolean;
        signal cp_17_symbol : Boolean;
        signal cp_37_symbol : Boolean;
        signal cp_38_symbol : Boolean;
        signal cp_39_symbol : Boolean;
        signal cp_40_symbol : Boolean;
        -- 
      begin -- 
        cp_14_start <= cp_12_symbol; -- control passed to block
        cp_15_symbol  <= cp_14_start; -- transition assign_stmt_27/binary_26/$entry
        cp_17: Block -- assign_stmt_27/binary_26/binary_26_inputs 
          signal cp_17_start: Boolean;
          signal cp_18_symbol: Boolean;
          signal cp_19_symbol: Boolean;
          signal cp_20_symbol : Boolean;
          -- 
        begin -- 
          cp_17_start <= cp_15_symbol; -- control passed to block
          cp_18_symbol  <= cp_17_start; -- transition assign_stmt_27/binary_26/binary_26_inputs/$entry
          cp_20: Block -- assign_stmt_27/binary_26/binary_26_inputs/binary_24 
            signal cp_20_start: Boolean;
            signal cp_21_symbol: Boolean;
            signal cp_22_symbol: Boolean;
            signal cp_23_symbol : Boolean;
            signal cp_33_symbol : Boolean;
            signal cp_34_symbol : Boolean;
            signal cp_35_symbol : Boolean;
            signal cp_36_symbol : Boolean;
            -- 
          begin -- 
            cp_20_start <= cp_18_symbol; -- control passed to block
            cp_21_symbol  <= cp_20_start; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/$entry
            cp_23: Block -- assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs 
              signal cp_23_start: Boolean;
              signal cp_24_symbol: Boolean;
              signal cp_25_symbol: Boolean;
              signal cp_26_symbol : Boolean;
              -- 
            begin -- 
              cp_23_start <= cp_21_symbol; -- control passed to block
              cp_24_symbol  <= cp_23_start; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/$entry
              cp_26: Block -- assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22 
                signal cp_26_start: Boolean;
                signal cp_27_symbol: Boolean;
                signal cp_28_symbol: Boolean;
                signal cp_29_symbol : Boolean;
                signal cp_30_symbol : Boolean;
                signal cp_31_symbol : Boolean;
                signal cp_32_symbol : Boolean;
                -- 
              begin -- 
                cp_26_start <= cp_24_symbol; -- control passed to block
                cp_27_symbol  <= cp_26_start; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22/$entry
                cp_29_symbol <= cp_27_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22/rr
                assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xrr_cp_to_dp <= cp_29_symbol; -- link to DP
                cp_30_symbol <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xra_dp_to_cp; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22/ra
                cp_31_symbol <= cp_30_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22/cr
                assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xcr_cp_to_dp <= cp_31_symbol; -- link to DP
                cp_32_symbol <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xca_dp_to_cp; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22/ca
                cp_28_symbol <= cp_32_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22/$exit
                cp_26_symbol <= cp_28_symbol; -- control passed from block 
                -- 
              end Block; -- assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/unary_22
              cp_25_symbol <= cp_26_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs/$exit
              cp_23_symbol <= cp_25_symbol; -- control passed from block 
              -- 
            end Block; -- assign_stmt_27/binary_26/binary_26_inputs/binary_24/binary_24_inputs
            cp_33_symbol <= cp_23_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/rr
            assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xrr_cp_to_dp <= cp_33_symbol; -- link to DP
            cp_34_symbol <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xra_dp_to_cp; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/ra
            cp_35_symbol <= cp_34_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/cr
            assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xcr_cp_to_dp <= cp_35_symbol; -- link to DP
            cp_36_symbol <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xca_dp_to_cp; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/ca
            cp_22_symbol <= cp_36_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/binary_24/$exit
            cp_20_symbol <= cp_22_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_27/binary_26/binary_26_inputs/binary_24
          cp_19_symbol <= cp_20_symbol; -- transition assign_stmt_27/binary_26/binary_26_inputs/$exit
          cp_17_symbol <= cp_19_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_27/binary_26/binary_26_inputs
        cp_37_symbol <= cp_17_symbol; -- transition assign_stmt_27/binary_26/rr
        assign_stmt_27Xbinary_26Xrr_cp_to_dp <= cp_37_symbol; -- link to DP
        cp_38_symbol <= assign_stmt_27Xbinary_26Xra_dp_to_cp; -- transition assign_stmt_27/binary_26/ra
        cp_39_symbol <= cp_38_symbol; -- transition assign_stmt_27/binary_26/cr
        assign_stmt_27Xbinary_26Xcr_cp_to_dp <= cp_39_symbol; -- link to DP
        cp_40_symbol <= assign_stmt_27Xbinary_26Xca_dp_to_cp; -- transition assign_stmt_27/binary_26/ca
        cp_16_symbol <= cp_40_symbol; -- transition assign_stmt_27/binary_26/$exit
        cp_14_symbol <= cp_16_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_27/binary_26
      cp_13_symbol <= cp_14_symbol; -- transition assign_stmt_27/$exit
      cp_11_symbol <= cp_13_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_27
    cp_41: Block -- assign_stmt_32 
      signal cp_41_start: Boolean;
      signal cp_42_symbol: Boolean;
      signal cp_43_symbol: Boolean;
      signal cp_44_symbol : Boolean;
      -- 
    begin -- 
      cp_41_start <= cp_11_symbol; -- control passed to block
      cp_42_symbol  <= cp_41_start; -- transition assign_stmt_32/$entry
      cp_44: Block -- assign_stmt_32/binary_31 
        signal cp_44_start: Boolean;
        signal cp_45_symbol: Boolean;
        signal cp_46_symbol: Boolean;
        signal cp_47_symbol : Boolean;
        signal cp_50_symbol : Boolean;
        signal cp_51_symbol : Boolean;
        signal cp_52_symbol : Boolean;
        signal cp_53_symbol : Boolean;
        -- 
      begin -- 
        cp_44_start <= cp_42_symbol; -- control passed to block
        cp_45_symbol  <= cp_44_start; -- transition assign_stmt_32/binary_31/$entry
        cp_47: Block -- assign_stmt_32/binary_31/binary_31_inputs 
          signal cp_47_start: Boolean;
          signal cp_48_symbol: Boolean;
          signal cp_49_symbol: Boolean;
          -- 
        begin -- 
          cp_47_start <= cp_45_symbol; -- control passed to block
          cp_48_symbol  <= cp_47_start; -- transition assign_stmt_32/binary_31/binary_31_inputs/$entry
          cp_49_symbol <= cp_48_symbol; -- transition assign_stmt_32/binary_31/binary_31_inputs/$exit
          cp_47_symbol <= cp_49_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_32/binary_31/binary_31_inputs
        cp_50_symbol <= cp_47_symbol; -- transition assign_stmt_32/binary_31/rr
        assign_stmt_32Xbinary_31Xrr_cp_to_dp <= cp_50_symbol; -- link to DP
        cp_51_symbol <= assign_stmt_32Xbinary_31Xra_dp_to_cp; -- transition assign_stmt_32/binary_31/ra
        cp_52_symbol <= cp_51_symbol; -- transition assign_stmt_32/binary_31/cr
        assign_stmt_32Xbinary_31Xcr_cp_to_dp <= cp_52_symbol; -- link to DP
        cp_53_symbol <= assign_stmt_32Xbinary_31Xca_dp_to_cp; -- transition assign_stmt_32/binary_31/ca
        cp_46_symbol <= cp_53_symbol; -- transition assign_stmt_32/binary_31/$exit
        cp_44_symbol <= cp_46_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_32/binary_31
      cp_43_symbol <= cp_44_symbol; -- transition assign_stmt_32/$exit
      cp_41_symbol <= cp_43_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_32
    cp_2_symbol <= cp_41_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal binary_24_wire : std_logic_vector(9 downto 0);
    signal constant_c0_6 : std_logic_vector(9 downto 0);
    signal constant_c1_9 : std_logic_vector(9 downto 0);
    signal d1_27 : std_logic_vector(9 downto 0);
    signal d_14 : std_logic_vector(9 downto 0);
    signal e_19 : std_logic_vector(9 downto 0);
    signal unary_22_wire : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    constant_c0_6 <= "0000001111";
    constant_c1_9 <= "0001010111";
    d_14 <= "1111110000";
    e_19 <= "0001010111";
    -- shared split operator group (0) : binary_24_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xrr_cp_to_dp;
      assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xcr_cp_to_dp;
      assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xca_dp_to_cp <= ackR(0);
      data_in <= d_14;
      binary_24_wire <= data_out(9 downto 0);
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
          constant_operand => "1111110000",
          use_constant  => true,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_26_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_27Xbinary_26Xrr_cp_to_dp;
      assign_stmt_27Xbinary_26Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_27Xbinary_26Xcr_cp_to_dp;
      assign_stmt_27Xbinary_26Xca_dp_to_cp <= ackR(0);
      data_in <= e_19;
      d1_27 <= data_out(9 downto 0);
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
          constant_operand => "0001010111",
          use_constant  => true,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 1
    -- shared split operator group (2) : binary_31_inst 
    SplitOperatorGroup2: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_32Xbinary_31Xrr_cp_to_dp;
      assign_stmt_32Xbinary_31Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_32Xbinary_31Xcr_cp_to_dp;
      assign_stmt_32Xbinary_31Xca_dp_to_cp <= ackR(0);
      data_in <= d1_27 & b;
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
    end Block; -- split operator group 2
    -- shared split operator group (3) : unary_22_inst 
    SplitOperatorGroup3: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xrr_cp_to_dp;
      assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xcr_cp_to_dp;
      assign_stmt_27Xbinary_26Xbinary_26_inputsXbinary_24Xbinary_24_inputsXunary_22Xca_dp_to_cp <= ackR(0);
      data_in <= a;
      unary_22_wire <= data_out(9 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApIntNot",
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
          constant_operand => "0",
          use_constant  => false,
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
use work.vc_system_type_package.all;
entity test_system is  -- system 
  port (-- 
    sum_mod_a : in  std_logic_vector(9 downto 0);
    sum_mod_b : in  std_logic_vector(9 downto 0);
    sum_mod_c : out  std_logic_vector(9 downto 0);
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
  -- 
begin -- 
  -- module sum_mod
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
use work.vc_system_type_package.all;
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      sum_mod_a : in  std_logic_vector(9 downto 0);
      sum_mod_b : in  std_logic_vector(9 downto 0);
      sum_mod_c : out  std_logic_vector(9 downto 0);
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
  signal sum_mod_c :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic;
  signal sum_mod_fin   : std_logic;
  -- 
begin --
  test_system_instance: test_system -- 
    port map ( -- 
      sum_mod_a => sum_mod_a,
      sum_mod_b => sum_mod_b,
      sum_mod_c => sum_mod_c,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
