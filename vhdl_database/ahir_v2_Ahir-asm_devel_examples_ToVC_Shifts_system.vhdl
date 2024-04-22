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
    c : out  std_logic_vector(9 downto 0);
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
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xrr_cp_to_dp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xra_dp_to_cp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xcr_cp_to_dp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xca_dp_to_cp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xrr_cp_to_dp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xra_dp_to_cp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xcr_cp_to_dp : boolean;
  signal assign_stmt_20Xtype_cast_19Xbinary_18Xca_dp_to_cp : boolean;
  signal assign_stmt_30Xbinary_29Xrr_cp_to_dp : boolean;
  signal assign_stmt_30Xbinary_29Xra_dp_to_cp : boolean;
  signal assign_stmt_30Xbinary_29Xcr_cp_to_dp : boolean;
  signal assign_stmt_30Xbinary_29Xca_dp_to_cp : boolean;
  signal assign_stmt_35Xbinary_34Xrr_cp_to_dp : boolean;
  signal assign_stmt_35Xbinary_34Xra_dp_to_cp : boolean;
  signal assign_stmt_35Xbinary_34Xcr_cp_to_dp : boolean;
  signal assign_stmt_20Xtype_cast_19Xreq_cp_to_dp : boolean;
  signal assign_stmt_20Xtype_cast_19Xack_dp_to_cp : boolean;
  signal assign_stmt_25Xbinary_24Xrr_cp_to_dp : boolean;
  signal assign_stmt_25Xbinary_24Xra_dp_to_cp : boolean;
  signal assign_stmt_25Xbinary_24Xcr_cp_to_dp : boolean;
  signal assign_stmt_25Xbinary_24Xca_dp_to_cp : boolean;
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
    signal assign_stmt_25_31_symbol : Boolean;
    signal assign_stmt_30_44_symbol : Boolean;
    signal assign_stmt_35_57_symbol : Boolean;
    -- 
  begin -- 
    sum_mod_CP_0_start <=  true when start = '1' else false; -- control passed to control-path.
    Xentry_1_symbol  <= sum_mod_CP_0_start; -- transition $entry
    assign_stmt_20_3: Block -- assign_stmt_20 
      signal assign_stmt_20_3_start: Boolean;
      signal Xentry_4_symbol: Boolean;
      signal Xexit_5_symbol: Boolean;
      signal type_cast_19_6_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_20_3_start <= Xentry_1_symbol; -- control passed to block
      Xentry_4_symbol  <= assign_stmt_20_3_start; -- transition assign_stmt_20/$entry
      type_cast_19_6: Block -- assign_stmt_20/type_cast_19 
        signal type_cast_19_6_start: Boolean;
        signal Xentry_7_symbol: Boolean;
        signal Xexit_8_symbol: Boolean;
        signal binary_18_9_symbol : Boolean;
        signal req_29_symbol : Boolean;
        signal ack_30_symbol : Boolean;
        -- 
      begin -- 
        type_cast_19_6_start <= Xentry_4_symbol; -- control passed to block
        Xentry_7_symbol  <= type_cast_19_6_start; -- transition assign_stmt_20/type_cast_19/$entry
        binary_18_9: Block -- assign_stmt_20/type_cast_19/binary_18 
          signal binary_18_9_start: Boolean;
          signal Xentry_10_symbol: Boolean;
          signal Xexit_11_symbol: Boolean;
          signal binary_18_inputs_12_symbol : Boolean;
          signal rr_25_symbol : Boolean;
          signal ra_26_symbol : Boolean;
          signal cr_27_symbol : Boolean;
          signal ca_28_symbol : Boolean;
          -- 
        begin -- 
          binary_18_9_start <= Xentry_7_symbol; -- control passed to block
          Xentry_10_symbol  <= binary_18_9_start; -- transition assign_stmt_20/type_cast_19/binary_18/$entry
          binary_18_inputs_12: Block -- assign_stmt_20/type_cast_19/binary_18/binary_18_inputs 
            signal binary_18_inputs_12_start: Boolean;
            signal Xentry_13_symbol: Boolean;
            signal Xexit_14_symbol: Boolean;
            signal binary_16_15_symbol : Boolean;
            -- 
          begin -- 
            binary_18_inputs_12_start <= Xentry_10_symbol; -- control passed to block
            Xentry_13_symbol  <= binary_18_inputs_12_start; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/$entry
            binary_16_15: Block -- assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16 
              signal binary_16_15_start: Boolean;
              signal Xentry_16_symbol: Boolean;
              signal Xexit_17_symbol: Boolean;
              signal binary_16_inputs_18_symbol : Boolean;
              signal rr_21_symbol : Boolean;
              signal ra_22_symbol : Boolean;
              signal cr_23_symbol : Boolean;
              signal ca_24_symbol : Boolean;
              -- 
            begin -- 
              binary_16_15_start <= Xentry_13_symbol; -- control passed to block
              Xentry_16_symbol  <= binary_16_15_start; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/$entry
              binary_16_inputs_18: Block -- assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/binary_16_inputs 
                signal binary_16_inputs_18_start: Boolean;
                signal Xentry_19_symbol: Boolean;
                signal Xexit_20_symbol: Boolean;
                -- 
              begin -- 
                binary_16_inputs_18_start <= Xentry_16_symbol; -- control passed to block
                Xentry_19_symbol  <= binary_16_inputs_18_start; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/binary_16_inputs/$entry
                Xexit_20_symbol <= Xentry_19_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/binary_16_inputs/$exit
                binary_16_inputs_18_symbol <= Xexit_20_symbol; -- control passed from block 
                -- 
              end Block; -- assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/binary_16_inputs
              rr_21_symbol <= binary_16_inputs_18_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/rr
              assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xrr_cp_to_dp <= rr_21_symbol; -- link to DP
              ra_22_symbol <= assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xra_dp_to_cp; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/ra
              cr_23_symbol <= ra_22_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/cr
              assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xcr_cp_to_dp <= cr_23_symbol; -- link to DP
              ca_24_symbol <= assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xca_dp_to_cp; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/ca
              Xexit_17_symbol <= ca_24_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16/$exit
              binary_16_15_symbol <= Xexit_17_symbol; -- control passed from block 
              -- 
            end Block; -- assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/binary_16
            Xexit_14_symbol <= binary_16_15_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/binary_18_inputs/$exit
            binary_18_inputs_12_symbol <= Xexit_14_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_20/type_cast_19/binary_18/binary_18_inputs
          rr_25_symbol <= binary_18_inputs_12_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/rr
          assign_stmt_20Xtype_cast_19Xbinary_18Xrr_cp_to_dp <= rr_25_symbol; -- link to DP
          ra_26_symbol <= assign_stmt_20Xtype_cast_19Xbinary_18Xra_dp_to_cp; -- transition assign_stmt_20/type_cast_19/binary_18/ra
          cr_27_symbol <= ra_26_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/cr
          assign_stmt_20Xtype_cast_19Xbinary_18Xcr_cp_to_dp <= cr_27_symbol; -- link to DP
          ca_28_symbol <= assign_stmt_20Xtype_cast_19Xbinary_18Xca_dp_to_cp; -- transition assign_stmt_20/type_cast_19/binary_18/ca
          Xexit_11_symbol <= ca_28_symbol; -- transition assign_stmt_20/type_cast_19/binary_18/$exit
          binary_18_9_symbol <= Xexit_11_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_20/type_cast_19/binary_18
        req_29_symbol <= binary_18_9_symbol; -- transition assign_stmt_20/type_cast_19/req
        assign_stmt_20Xtype_cast_19Xreq_cp_to_dp <= req_29_symbol; -- link to DP
        ack_30_symbol <= assign_stmt_20Xtype_cast_19Xack_dp_to_cp; -- transition assign_stmt_20/type_cast_19/ack
        Xexit_8_symbol <= ack_30_symbol; -- transition assign_stmt_20/type_cast_19/$exit
        type_cast_19_6_symbol <= Xexit_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_20/type_cast_19
      Xexit_5_symbol <= type_cast_19_6_symbol; -- transition assign_stmt_20/$exit
      assign_stmt_20_3_symbol <= Xexit_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_20
    assign_stmt_25_31: Block -- assign_stmt_25 
      signal assign_stmt_25_31_start: Boolean;
      signal Xentry_32_symbol: Boolean;
      signal Xexit_33_symbol: Boolean;
      signal binary_24_34_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_25_31_start <= assign_stmt_20_3_symbol; -- control passed to block
      Xentry_32_symbol  <= assign_stmt_25_31_start; -- transition assign_stmt_25/$entry
      binary_24_34: Block -- assign_stmt_25/binary_24 
        signal binary_24_34_start: Boolean;
        signal Xentry_35_symbol: Boolean;
        signal Xexit_36_symbol: Boolean;
        signal binary_24_inputs_37_symbol : Boolean;
        signal rr_40_symbol : Boolean;
        signal ra_41_symbol : Boolean;
        signal cr_42_symbol : Boolean;
        signal ca_43_symbol : Boolean;
        -- 
      begin -- 
        binary_24_34_start <= Xentry_32_symbol; -- control passed to block
        Xentry_35_symbol  <= binary_24_34_start; -- transition assign_stmt_25/binary_24/$entry
        binary_24_inputs_37: Block -- assign_stmt_25/binary_24/binary_24_inputs 
          signal binary_24_inputs_37_start: Boolean;
          signal Xentry_38_symbol: Boolean;
          signal Xexit_39_symbol: Boolean;
          -- 
        begin -- 
          binary_24_inputs_37_start <= Xentry_35_symbol; -- control passed to block
          Xentry_38_symbol  <= binary_24_inputs_37_start; -- transition assign_stmt_25/binary_24/binary_24_inputs/$entry
          Xexit_39_symbol <= Xentry_38_symbol; -- transition assign_stmt_25/binary_24/binary_24_inputs/$exit
          binary_24_inputs_37_symbol <= Xexit_39_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_25/binary_24/binary_24_inputs
        rr_40_symbol <= binary_24_inputs_37_symbol; -- transition assign_stmt_25/binary_24/rr
        assign_stmt_25Xbinary_24Xrr_cp_to_dp <= rr_40_symbol; -- link to DP
        ra_41_symbol <= assign_stmt_25Xbinary_24Xra_dp_to_cp; -- transition assign_stmt_25/binary_24/ra
        cr_42_symbol <= ra_41_symbol; -- transition assign_stmt_25/binary_24/cr
        assign_stmt_25Xbinary_24Xcr_cp_to_dp <= cr_42_symbol; -- link to DP
        ca_43_symbol <= assign_stmt_25Xbinary_24Xca_dp_to_cp; -- transition assign_stmt_25/binary_24/ca
        Xexit_36_symbol <= ca_43_symbol; -- transition assign_stmt_25/binary_24/$exit
        binary_24_34_symbol <= Xexit_36_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_25/binary_24
      Xexit_33_symbol <= binary_24_34_symbol; -- transition assign_stmt_25/$exit
      assign_stmt_25_31_symbol <= Xexit_33_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_25
    assign_stmt_30_44: Block -- assign_stmt_30 
      signal assign_stmt_30_44_start: Boolean;
      signal Xentry_45_symbol: Boolean;
      signal Xexit_46_symbol: Boolean;
      signal binary_29_47_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_30_44_start <= assign_stmt_25_31_symbol; -- control passed to block
      Xentry_45_symbol  <= assign_stmt_30_44_start; -- transition assign_stmt_30/$entry
      binary_29_47: Block -- assign_stmt_30/binary_29 
        signal binary_29_47_start: Boolean;
        signal Xentry_48_symbol: Boolean;
        signal Xexit_49_symbol: Boolean;
        signal binary_29_inputs_50_symbol : Boolean;
        signal rr_53_symbol : Boolean;
        signal ra_54_symbol : Boolean;
        signal cr_55_symbol : Boolean;
        signal ca_56_symbol : Boolean;
        -- 
      begin -- 
        binary_29_47_start <= Xentry_45_symbol; -- control passed to block
        Xentry_48_symbol  <= binary_29_47_start; -- transition assign_stmt_30/binary_29/$entry
        binary_29_inputs_50: Block -- assign_stmt_30/binary_29/binary_29_inputs 
          signal binary_29_inputs_50_start: Boolean;
          signal Xentry_51_symbol: Boolean;
          signal Xexit_52_symbol: Boolean;
          -- 
        begin -- 
          binary_29_inputs_50_start <= Xentry_48_symbol; -- control passed to block
          Xentry_51_symbol  <= binary_29_inputs_50_start; -- transition assign_stmt_30/binary_29/binary_29_inputs/$entry
          Xexit_52_symbol <= Xentry_51_symbol; -- transition assign_stmt_30/binary_29/binary_29_inputs/$exit
          binary_29_inputs_50_symbol <= Xexit_52_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_30/binary_29/binary_29_inputs
        rr_53_symbol <= binary_29_inputs_50_symbol; -- transition assign_stmt_30/binary_29/rr
        assign_stmt_30Xbinary_29Xrr_cp_to_dp <= rr_53_symbol; -- link to DP
        ra_54_symbol <= assign_stmt_30Xbinary_29Xra_dp_to_cp; -- transition assign_stmt_30/binary_29/ra
        cr_55_symbol <= ra_54_symbol; -- transition assign_stmt_30/binary_29/cr
        assign_stmt_30Xbinary_29Xcr_cp_to_dp <= cr_55_symbol; -- link to DP
        ca_56_symbol <= assign_stmt_30Xbinary_29Xca_dp_to_cp; -- transition assign_stmt_30/binary_29/ca
        Xexit_49_symbol <= ca_56_symbol; -- transition assign_stmt_30/binary_29/$exit
        binary_29_47_symbol <= Xexit_49_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_30/binary_29
      Xexit_46_symbol <= binary_29_47_symbol; -- transition assign_stmt_30/$exit
      assign_stmt_30_44_symbol <= Xexit_46_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_30
    assign_stmt_35_57: Block -- assign_stmt_35 
      signal assign_stmt_35_57_start: Boolean;
      signal Xentry_58_symbol: Boolean;
      signal Xexit_59_symbol: Boolean;
      signal binary_34_60_symbol : Boolean;
      -- 
    begin -- 
      assign_stmt_35_57_start <= assign_stmt_30_44_symbol; -- control passed to block
      Xentry_58_symbol  <= assign_stmt_35_57_start; -- transition assign_stmt_35/$entry
      binary_34_60: Block -- assign_stmt_35/binary_34 
        signal binary_34_60_start: Boolean;
        signal Xentry_61_symbol: Boolean;
        signal Xexit_62_symbol: Boolean;
        signal binary_34_inputs_63_symbol : Boolean;
        signal rr_66_symbol : Boolean;
        signal ra_67_symbol : Boolean;
        signal cr_68_symbol : Boolean;
        signal ca_69_symbol : Boolean;
        -- 
      begin -- 
        binary_34_60_start <= Xentry_58_symbol; -- control passed to block
        Xentry_61_symbol  <= binary_34_60_start; -- transition assign_stmt_35/binary_34/$entry
        binary_34_inputs_63: Block -- assign_stmt_35/binary_34/binary_34_inputs 
          signal binary_34_inputs_63_start: Boolean;
          signal Xentry_64_symbol: Boolean;
          signal Xexit_65_symbol: Boolean;
          -- 
        begin -- 
          binary_34_inputs_63_start <= Xentry_61_symbol; -- control passed to block
          Xentry_64_symbol  <= binary_34_inputs_63_start; -- transition assign_stmt_35/binary_34/binary_34_inputs/$entry
          Xexit_65_symbol <= Xentry_64_symbol; -- transition assign_stmt_35/binary_34/binary_34_inputs/$exit
          binary_34_inputs_63_symbol <= Xexit_65_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_35/binary_34/binary_34_inputs
        rr_66_symbol <= binary_34_inputs_63_symbol; -- transition assign_stmt_35/binary_34/rr
        assign_stmt_35Xbinary_34Xrr_cp_to_dp <= rr_66_symbol; -- link to DP
        ra_67_symbol <= assign_stmt_35Xbinary_34Xra_dp_to_cp; -- transition assign_stmt_35/binary_34/ra
        cr_68_symbol <= ra_67_symbol; -- transition assign_stmt_35/binary_34/cr
        assign_stmt_35Xbinary_34Xcr_cp_to_dp <= cr_68_symbol; -- link to DP
        ca_69_symbol <= assign_stmt_35Xbinary_34Xca_dp_to_cp; -- transition assign_stmt_35/binary_34/ca
        Xexit_62_symbol <= ca_69_symbol; -- transition assign_stmt_35/binary_34/$exit
        binary_34_60_symbol <= Xexit_62_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_35/binary_34
      Xexit_59_symbol <= binary_34_60_symbol; -- transition assign_stmt_35/$exit
      assign_stmt_35_57_symbol <= Xexit_59_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_35
    Xexit_2_symbol <= assign_stmt_35_57_symbol; -- transition $exit
    fin  <=  '1' when Xexit_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal binary_16_wire : std_logic_vector(10 downto 0);
    signal binary_18_wire : std_logic_vector(10 downto 0);
    signal expr_28_wire_constant : std_logic_vector(3 downto 0);
    signal expr_33_wire_constant : std_logic_vector(3 downto 0);
    signal simple_obj_ref_15_wire_constant : std_logic_vector(0 downto 0);
    signal xxsum_modxxz1 : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    expr_28_wire_constant <= "0001";
    expr_33_wire_constant <= "0001";
    simple_obj_ref_15_wire_constant <= "0";
    xxsum_modxxz1 <= "0";
    type_cast_19_inst: RegisterBase generic map(in_data_width => 11,out_data_width => 10) -- 
      port map( din => binary_18_wire, dout => c, req => assign_stmt_20Xtype_cast_19Xreq_cp_to_dp, ack => assign_stmt_20Xtype_cast_19Xack_dp_to_cp, clk => clk, reset => reset); -- 
    -- shared split operator group (0) : binary_16_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xrr_cp_to_dp;
      assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xcr_cp_to_dp;
      assign_stmt_20Xtype_cast_19Xbinary_18Xbinary_18_inputsXbinary_16Xca_dp_to_cp <= ackR(0);
      data_in <= a;
      binary_16_wire <= data_out(10 downto 0);
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
    -- shared split operator group (1) : binary_18_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(14 downto 0);
      signal data_out: std_logic_vector(10 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_20Xtype_cast_19Xbinary_18Xrr_cp_to_dp;
      assign_stmt_20Xtype_cast_19Xbinary_18Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_20Xtype_cast_19Xbinary_18Xcr_cp_to_dp;
      assign_stmt_20Xtype_cast_19Xbinary_18Xca_dp_to_cp <= ackR(0);
      data_in <= binary_16_wire & b;
      binary_18_wire <= data_out(10 downto 0);
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
          operator_id => "ApIntSHL",
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
          operator_id => "ApIntSHL",
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
    sum_mod_c : out  std_logic_vector(9 downto 0);
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
      c : out  std_logic_vector(9 downto 0);
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
      sum_mod_c : out  std_logic_vector(9 downto 0);
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
  signal sum_mod_c :   std_logic_vector(9 downto 0);
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
