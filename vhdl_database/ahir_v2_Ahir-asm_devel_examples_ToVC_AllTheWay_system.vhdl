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
  signal parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xrr_cp_to_dp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xra_dp_to_cp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xcr_cp_to_dp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xca_dp_to_cp : boolean;
  signal assign_stmt_21Xbinary_20Xcr_cp_to_dp : boolean;
  signal assign_stmt_21Xbinary_20Xca_dp_to_cp : boolean;
  signal assign_stmt_21Xbinary_20Xrr_cp_to_dp : boolean;
  signal assign_stmt_21Xbinary_20Xra_dp_to_cp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xrr_cp_to_dp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xra_dp_to_cp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xcr_cp_to_dp : boolean;
  signal parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xca_dp_to_cp : boolean;
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
    signal cp_32_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- parallel_block_stmt_5 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      signal cp_19_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition parallel_block_stmt_5/$entry
      cp_6: Block -- parallel_block_stmt_5/assign_stmt_10 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition parallel_block_stmt_5/assign_stmt_10/$entry
        cp_9: Block -- parallel_block_stmt_5/assign_stmt_10/binary_9 
          signal cp_9_start: Boolean;
          signal cp_10_symbol: Boolean;
          signal cp_11_symbol: Boolean;
          signal cp_12_symbol : Boolean;
          signal cp_15_symbol : Boolean;
          signal cp_16_symbol : Boolean;
          signal cp_17_symbol : Boolean;
          signal cp_18_symbol : Boolean;
          -- 
        begin -- 
          cp_9_start <= cp_7_symbol; -- control passed to block
          cp_10_symbol  <= cp_9_start; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/$entry
          cp_12: Block -- parallel_block_stmt_5/assign_stmt_10/binary_9/binary_9_inputs 
            signal cp_12_start: Boolean;
            signal cp_13_symbol: Boolean;
            signal cp_14_symbol: Boolean;
            -- 
          begin -- 
            cp_12_start <= cp_10_symbol; -- control passed to block
            cp_13_symbol  <= cp_12_start; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/binary_9_inputs/$entry
            cp_14_symbol <= cp_13_symbol; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/binary_9_inputs/$exit
            cp_12_symbol <= cp_14_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_5/assign_stmt_10/binary_9/binary_9_inputs
          cp_15_symbol <= cp_12_symbol; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/rr
          parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xrr_cp_to_dp <= cp_15_symbol; -- link to DP
          cp_16_symbol <= parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xra_dp_to_cp; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/ra
          cp_17_symbol <= cp_16_symbol; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/cr
          parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xcr_cp_to_dp <= cp_17_symbol; -- link to DP
          cp_18_symbol <= parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xca_dp_to_cp; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/ca
          cp_11_symbol <= cp_18_symbol; -- transition parallel_block_stmt_5/assign_stmt_10/binary_9/$exit
          cp_9_symbol <= cp_11_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_5/assign_stmt_10/binary_9
        cp_8_symbol <= cp_9_symbol; -- transition parallel_block_stmt_5/assign_stmt_10/$exit
        cp_6_symbol <= cp_8_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_5/assign_stmt_10
      cp_19: Block -- parallel_block_stmt_5/assign_stmt_15 
        signal cp_19_start: Boolean;
        signal cp_20_symbol: Boolean;
        signal cp_21_symbol: Boolean;
        signal cp_22_symbol : Boolean;
        -- 
      begin -- 
        cp_19_start <= cp_4_symbol; -- control passed to block
        cp_20_symbol  <= cp_19_start; -- transition parallel_block_stmt_5/assign_stmt_15/$entry
        cp_22: Block -- parallel_block_stmt_5/assign_stmt_15/binary_14 
          signal cp_22_start: Boolean;
          signal cp_23_symbol: Boolean;
          signal cp_24_symbol: Boolean;
          signal cp_25_symbol : Boolean;
          signal cp_28_symbol : Boolean;
          signal cp_29_symbol : Boolean;
          signal cp_30_symbol : Boolean;
          signal cp_31_symbol : Boolean;
          -- 
        begin -- 
          cp_22_start <= cp_20_symbol; -- control passed to block
          cp_23_symbol  <= cp_22_start; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/$entry
          cp_25: Block -- parallel_block_stmt_5/assign_stmt_15/binary_14/binary_14_inputs 
            signal cp_25_start: Boolean;
            signal cp_26_symbol: Boolean;
            signal cp_27_symbol: Boolean;
            -- 
          begin -- 
            cp_25_start <= cp_23_symbol; -- control passed to block
            cp_26_symbol  <= cp_25_start; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/binary_14_inputs/$entry
            cp_27_symbol <= cp_26_symbol; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/binary_14_inputs/$exit
            cp_25_symbol <= cp_27_symbol; -- control passed from block 
            -- 
          end Block; -- parallel_block_stmt_5/assign_stmt_15/binary_14/binary_14_inputs
          cp_28_symbol <= cp_25_symbol; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/rr
          parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xrr_cp_to_dp <= cp_28_symbol; -- link to DP
          cp_29_symbol <= parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xra_dp_to_cp; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/ra
          cp_30_symbol <= cp_29_symbol; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/cr
          parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xcr_cp_to_dp <= cp_30_symbol; -- link to DP
          cp_31_symbol <= parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xca_dp_to_cp; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/ca
          cp_24_symbol <= cp_31_symbol; -- transition parallel_block_stmt_5/assign_stmt_15/binary_14/$exit
          cp_22_symbol <= cp_24_symbol; -- control passed from block 
          -- 
        end Block; -- parallel_block_stmt_5/assign_stmt_15/binary_14
        cp_21_symbol <= cp_22_symbol; -- transition parallel_block_stmt_5/assign_stmt_15/$exit
        cp_19_symbol <= cp_21_symbol; -- control passed from block 
        -- 
      end Block; -- parallel_block_stmt_5/assign_stmt_15
      cp_5_block : Block -- non-trivial join transition parallel_block_stmt_5/$exit 
        signal cp_5_predecessors: BooleanArray(1 downto 0);
        signal cp_5_p0_pred: BooleanArray(0 downto 0);
        signal cp_5_p0_succ: BooleanArray(0 downto 0);
        signal cp_5_p1_pred: BooleanArray(0 downto 0);
        signal cp_5_p1_succ: BooleanArray(0 downto 0);
        -- 
      begin -- 
        cp_5_0_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_5_p0_pred, cp_5_p0_succ, cp_5_predecessors(0), clk, reset-- 
          ); -- 
        cp_5_p0_succ(0) <=  cp_5_symbol;
        cp_5_p0_pred(0) <=  cp_6_symbol;
        cp_5_1_place: Place -- 
          generic map(marking => false)
          port map( -- 
            cp_5_p1_pred, cp_5_p1_succ, cp_5_predecessors(1), clk, reset-- 
          ); -- 
        cp_5_p1_succ(0) <=  cp_5_symbol;
        cp_5_p1_pred(0) <=  cp_19_symbol;
        cp_5_symbol <= OrReduce(cp_5_predecessors); 
        -- 
      end Block; -- non-trivial join transition parallel_block_stmt_5/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- parallel_block_stmt_5
    cp_32: Block -- assign_stmt_21 
      signal cp_32_start: Boolean;
      signal cp_33_symbol: Boolean;
      signal cp_34_symbol: Boolean;
      signal cp_35_symbol : Boolean;
      -- 
    begin -- 
      cp_32_start <= cp_3_symbol; -- control passed to block
      cp_33_symbol  <= cp_32_start; -- transition assign_stmt_21/$entry
      cp_35: Block -- assign_stmt_21/binary_20 
        signal cp_35_start: Boolean;
        signal cp_36_symbol: Boolean;
        signal cp_37_symbol: Boolean;
        signal cp_38_symbol : Boolean;
        signal cp_41_symbol : Boolean;
        signal cp_42_symbol : Boolean;
        signal cp_43_symbol : Boolean;
        signal cp_44_symbol : Boolean;
        -- 
      begin -- 
        cp_35_start <= cp_33_symbol; -- control passed to block
        cp_36_symbol  <= cp_35_start; -- transition assign_stmt_21/binary_20/$entry
        cp_38: Block -- assign_stmt_21/binary_20/binary_20_inputs 
          signal cp_38_start: Boolean;
          signal cp_39_symbol: Boolean;
          signal cp_40_symbol: Boolean;
          -- 
        begin -- 
          cp_38_start <= cp_36_symbol; -- control passed to block
          cp_39_symbol  <= cp_38_start; -- transition assign_stmt_21/binary_20/binary_20_inputs/$entry
          cp_40_symbol <= cp_39_symbol; -- transition assign_stmt_21/binary_20/binary_20_inputs/$exit
          cp_38_symbol <= cp_40_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_21/binary_20/binary_20_inputs
        cp_41_symbol <= cp_38_symbol; -- transition assign_stmt_21/binary_20/rr
        assign_stmt_21Xbinary_20Xrr_cp_to_dp <= cp_41_symbol; -- link to DP
        cp_42_symbol <= assign_stmt_21Xbinary_20Xra_dp_to_cp; -- transition assign_stmt_21/binary_20/ra
        cp_43_symbol <= cp_42_symbol; -- transition assign_stmt_21/binary_20/cr
        assign_stmt_21Xbinary_20Xcr_cp_to_dp <= cp_43_symbol; -- link to DP
        cp_44_symbol <= assign_stmt_21Xbinary_20Xca_dp_to_cp; -- transition assign_stmt_21/binary_20/ca
        cp_37_symbol <= cp_44_symbol; -- transition assign_stmt_21/binary_20/$exit
        cp_35_symbol <= cp_37_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_21/binary_20
      cp_34_symbol <= cp_35_symbol; -- transition assign_stmt_21/$exit
      cp_32_symbol <= cp_34_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_21
    cp_2_symbol <= cp_32_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal d_10 : std_logic_vector(9 downto 0);
    signal e_15 : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    -- shared split operator group (0) : binary_14_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xrr_cp_to_dp;
      parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xra_dp_to_cp <= ackL(0);
      reqR(0) <= parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xcr_cp_to_dp;
      parallel_block_stmt_5Xassign_stmt_15Xbinary_14Xca_dp_to_cp <= ackR(0);
      data_in <= a & b;
      e_15 <= data_out(9 downto 0);
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
    end Block; -- split operator group 0
    -- shared split operator group (1) : binary_9_inst binary_20_inst 
    SplitOperatorGroup1: Block -- 
      signal data_in: std_logic_vector(39 downto 0);
      signal data_out: std_logic_vector(19 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      -- 
    begin -- 
      reqL(1) <= parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xrr_cp_to_dp;
      reqL(0) <= assign_stmt_21Xbinary_20Xrr_cp_to_dp;
      parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xra_dp_to_cp <= ackL(1);
      assign_stmt_21Xbinary_20Xra_dp_to_cp <= ackL(0);
      reqR(1) <= parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xcr_cp_to_dp;
      reqR(0) <= assign_stmt_21Xbinary_20Xcr_cp_to_dp;
      parallel_block_stmt_5Xassign_stmt_10Xbinary_9Xca_dp_to_cp <= ackR(1);
      assign_stmt_21Xbinary_20Xca_dp_to_cp <= ackR(0);
      data_in <= a & b & d_10 & e_15;
      d_10 <= data_out(19 downto 10);
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
          num_reqs => 2--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 1
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
use work.vc_system_package.all;
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
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= (0 => '1', others => '0');
  sum_mod_b <= (9 => '0', others => '1');

  process
  begin
	wait until clk = '1';
	reset <= '0';
	sum_mod_start <= '1';
	wait until clk = '1';
	sum_mod_start <= '0';
	while (sum_mod_fin /= '1') loop
		wait until clk = '1';
	end loop;
	wait;
  end process;

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
