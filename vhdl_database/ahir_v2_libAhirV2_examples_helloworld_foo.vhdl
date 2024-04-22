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
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.loadstorepack.all;
use ahir.operatorpackage.all;
entity foo is -- 
  port ( -- 
    a : in  std_logic_vector(31 downto 0);
    b : in  std_logic_vector(31 downto 0);
    p : in  std_logic_vector(31 downto 0);
    q : in  std_logic_vector(31 downto 0);
    c : in  std_logic_vector(31 downto 0);
    clock : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic-- 
  );
  -- 
end entity foo;
architecture Default of foo is -- 
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal mainXfXs1Xreq2_dp_to_cp : boolean;
  signal mainXfXs1Xreq1_dp_to_cp : boolean;
  signal mainXfXs1Xack1_cp_to_dp : boolean;
  signal mainXfXs1Xack2_cp_to_dp : boolean;
  signal mainXfXs2Xreq1_dp_to_cp : boolean;
  signal mainXfXs2Xack1_cp_to_dp : boolean;
  signal mainXfXs2Xreq2_dp_to_cp : boolean;
  signal mainXfXs2Xack2_cp_to_dp : boolean;
  signal mainXreq1_dp_to_cp : boolean;
  signal mainXack1_cp_to_dp : boolean;
  signal mainXreq2_dp_to_cp : boolean;
  signal mainXack2_cp_to_dp : boolean;
  -- IN PROGRESS: signals to IO operators, signals to Call operators.
  -- 
begin --  
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
    cp_3: Block -- main 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      signal cp_23_symbol : Boolean;
      signal cp_24_symbol : Boolean;
      signal cp_25_symbol : Boolean;
      signal cp_26_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition main/$entry
      cp_6: Block -- main/f 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        signal cp_16_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition main/f/$entry
        cp_9: Block -- main/f/s1 
          signal cp_9_start: Boolean;
          signal cp_10_symbol: Boolean;
          signal cp_11_symbol: Boolean;
          signal cp_12_symbol : Boolean;
          signal cp_13_symbol : Boolean;
          signal cp_14_symbol : Boolean;
          signal cp_15_symbol : Boolean;
          -- 
        begin -- 
          cp_9_start <= cp_7_symbol; -- control passed to block
          cp_10_symbol  <= cp_9_start; -- transition main/f/s1/$entry
          cp_12_symbol <= cp_10_symbol; -- transition main/f/s1/req1
          mainXfXs1Xreq1_cp_to_dp <= cp_12_symbol; -- link to DP
          cp_13_symbol <= mainXfXs1Xack1_dp_to_cp; -- transition main/f/s1/ack1
          cp_14_symbol <= cp_13_symbol; -- transition main/f/s1/req2
          mainXfXs1Xreq2_cp_to_dp <= cp_14_symbol; -- link to DP
          cp_15_symbol <= mainXfXs1Xack2_dp_to_cp; -- transition main/f/s1/ack2
          cp_11_symbol <= cp_15_symbol; -- transition main/f/s1/$exit
          cp_9_symbol <= cp_11_symbol; -- control passed from block 
          -- 
        end Block; -- main/f/s1
        cp_16: Block -- main/f/s2 
          signal cp_16_start: Boolean;
          signal cp_17_symbol: Boolean;
          signal cp_18_symbol: Boolean;
          signal cp_19_symbol : Boolean;
          signal cp_20_symbol : Boolean;
          signal cp_21_symbol : Boolean;
          signal cp_22_symbol : Boolean;
          -- 
        begin -- 
          cp_16_start <= cp_7_symbol; -- control passed to block
          cp_17_symbol  <= cp_16_start; -- transition main/f/s2/$entry
          cp_19_symbol <= cp_17_symbol; -- transition main/f/s2/req1
          mainXfXs2Xreq1_cp_to_dp <= cp_19_symbol; -- link to DP
          cp_20_symbol <= mainXfXs2Xack1_dp_to_cp; -- transition main/f/s2/ack1
          cp_21_symbol <= cp_20_symbol; -- transition main/f/s2/req2
          mainXfXs2Xreq2_cp_to_dp <= cp_21_symbol; -- link to DP
          cp_22_symbol <= mainXfXs2Xack2_dp_to_cp; -- transition main/f/s2/ack2
          cp_18_symbol <= cp_22_symbol; -- transition main/f/s2/$exit
          cp_16_symbol <= cp_18_symbol; -- control passed from block 
          -- 
        end Block; -- main/f/s2
        cp_8_block : Block -- non-trivial join transition main/f/$exit 
          signal cp_8_predecessors: BooleanArray(1 downto 0);
          signal cp_8_p0_pred: BooleanArray(0 downto 0);
          signal cp_8_p0_succ: BooleanArray(0 downto 0);
          signal cp_8_p1_pred: BooleanArray(0 downto 0);
          signal cp_8_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin 
        cp_8_0_place: Place port map( -- 
          cp_8_p0_pred, cp_8_p0_succ, cp_8_predecessors(0), clk, reset-- 
        ); -- 
        cp_8_p0_succ(0) <=  cp_8_symbol;
        cp_8_p0_pred(0) <=  cp_9_symbol;
        cp_8_1_place: Place port map( -- 
          cp_8_p1_pred, cp_8_p1_succ, cp_8_predecessors(1), clk, reset-- 
        ); -- 
        cp_8_p1_succ(0) <=  cp_8_symbol;
        cp_8_p1_pred(0) <=  cp_16_symbol;
        cp_8_symbol <= OrReduce(cp_8_predecessors); 
        -- 
      end Block; -- non-trivial join transition main/f/$exit
      cp_6_symbol <= cp_8_symbol; -- control passed from block 
      -- 
    end Block; -- main/f
    cp_23_symbol <= cp_6_symbol; -- transition main/req1
    mainXreq1_cp_to_dp <= cp_23_symbol; -- link to DP
    cp_24_symbol <= mainXack1_dp_to_cp; -- transition main/ack1
    cp_25_symbol <= cp_24_symbol; -- transition main/req2
    mainXreq2_cp_to_dp <= cp_25_symbol; -- link to DP
    cp_26_symbol <= mainXack2_dp_to_cp; -- transition main/ack2
    cp_5_symbol <= cp_26_symbol; -- transition main/$exit
    cp_3_symbol <= cp_5_symbol; -- control passed from block 
    -- 
  end Block; -- main
  cp_2_symbol <= cp_3_symbol; -- transition $exit
  fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
  -- 
end Block; -- control-path
-- the data path
data_path: Block -- 
  signal s : std_logic_vector (31 downto 0);
  signal t : std_logic_vector (31 downto 0);
  -- 
begin -- 
  -- shared split operator group (0) : a1 a3 
  SplitOperatorGroup0: Block -- 
    signal data_in: std_logic_vector(127 downto 0);
    signal data_out: std_logic_vector(63 downto 0);
    signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
    -- 
  begin -- 
    reqL(1) <= mainXfXs1Xreq1_cp_to_dp;
    reqL(0) <= mainXreq1_cp_to_dp;
    mainXfXs1Xack1_dp_to_cp <= ackL(1);
    mainXack1_dp_to_cp <= ackL(0);
    reqR(1) <= mainXfXs1Xreq2_cp_to_dp;
    reqR(0) <= mainXreq2_cp_to_dp;
    mainXfXs1Xack2_dp_to_cp <= ackR(1);
    mainXack2_dp_to_cp <= ackR(0);
    data_in <= a & b & t & s;
    t <= data_out(63 downto 32);
    c <= data_out(31 downto 0);
    SplitOperator: SplitOperatorBase -- 
      generic map ( -- 
        operator_id => "ApIntAdd",
        input1_is_int => true, 
        input1_characteristic_width => 0, 
        input1_mantissa_width    => 0, 
        iwidth_1  => 32,
        input2_is_int => true, 
        input2_characteristic_width => 0, 
        input2_mantissa_width => 0, 
        iwidth_2      => 32, 
        num_inputs    => 2,
        output_is_int => true,
        output_characteristic_width  => 0, 
        output_mantissa_width => 0, 
        owidth => 32,
        constant_operand => "0",
        use_constant  => false,
        zero_delay => false, 
        no_arbitration => true, 
        num_reqs => 2--
      ) -- 
    port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
    -- 
  end Block; -- split operator group 0
  -- shared split operator group (1) : a2 
  SplitOperatorGroup1: Block -- 
    signal data_in: std_logic_vector(63 downto 0);
    signal data_out: std_logic_vector(31 downto 0);
    signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
    -- 
  begin -- 
    reqL(0) <= mainXfXs2Xreq1_cp_to_dp;
    mainXfXs2Xack1_dp_to_cp <= ackL(0);
    reqR(0) <= mainXfXs2Xreq2_cp_to_dp;
    mainXfXs2Xack2_dp_to_cp <= ackR(0);
    data_in <= p & q;
    s <= data_out(31 downto 0);
    SplitOperator: SplitOperatorBase -- 
      generic map ( -- 
        operator_id => "ApIntAdd",
        input1_is_int => true, 
        input1_characteristic_width => 0, 
        input1_mantissa_width    => 0, 
        iwidth_1  => 32,
        input2_is_int => true, 
        input2_characteristic_width => 0, 
        input2_mantissa_width => 0, 
        iwidth_2      => 32, 
        num_inputs    => 2,
        output_is_int => true,
        output_characteristic_width  => 0, 
        output_mantissa_width => 0, 
        owidth => 32,
        constant_operand => "0",
        use_constant  => false,
        zero_delay => false, 
        no_arbitration => true, 
        num_reqs => 1--
      ) -- 
    port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
    -- 
  end Block; -- split operator group 1
  -- IN PROGRESS 
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
use ahir.loadstorepack.all;
use ahir.operatorpackage.all;
entity test_system is  -- system 
port ( -- system-ports 
  a : in  std_logic_vector(31 downto 0);
  b : in  std_logic_vector(31 downto 0);
  p : in  std_logic_vector(31 downto 0);
  q : in  std_logic_vector(31 downto 0);
  c : in  std_logic_vector(31 downto 0);
  clock : in std_logic;
  reset : in std_logic;
  start : in std_logic;
  fin   : out std_logic-- system-ports 
);
-- 
end entity; 
architecture Default of test_system is -- system-architecture 
-- IN PROGRESS 
component foo is -- 
  port ( -- 
    a : in  std_logic_vector(31 downto 0);
    b : in  std_logic_vector(31 downto 0);
    p : in  std_logic_vector(31 downto 0);
    q : in  std_logic_vector(31 downto 0);
    c : in  std_logic_vector(31 downto 0);
    clock : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic-- 
  );
  -- 
end component;
-- 
begin -- 
-- signals tied to 0 
-- 
end Default;
