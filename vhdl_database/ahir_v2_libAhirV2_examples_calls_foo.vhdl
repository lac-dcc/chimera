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
entity add is -- 
  port ( -- 
    a : in  std_logic_vector(31 downto 0);
    b : in  std_logic_vector(31 downto 0);
    c : in  std_logic_vector(31 downto 0);
    clock : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity add;
architecture Default of add is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal mainXreq1_dp_to_cp : boolean;
  signal mainXack1_cp_to_dp : boolean;
  signal mainXreq2_dp_to_cp : boolean;
  signal mainXack2_cp_to_dp : boolean;
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
    cp_3: Block -- main 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      signal cp_7_symbol : Boolean;
      signal cp_8_symbol : Boolean;
      signal cp_9_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition main/$entry
      cp_6_symbol <= cp_4_symbol; -- transition main/req1
      mainXreq1_cp_to_dp <= cp_6_symbol; -- link to DP
      cp_7_symbol <= mainXack1_dp_to_cp; -- transition main/ack1
      cp_8_symbol <= cp_7_symbol; -- transition main/req2
      mainXreq2_cp_to_dp <= cp_8_symbol; -- link to DP
      cp_9_symbol <= mainXack2_dp_to_cp; -- transition main/ack2
      cp_5_symbol <= cp_9_symbol; -- transition main/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- main
    cp_2_symbol <= cp_3_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    -- 
  begin -- 
    -- shared split operator group (0) : a1 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXreq1_cp_to_dp;
      mainXack1_dp_to_cp <= ackL(0);
      reqR(0) <= mainXreq2_cp_to_dp;
      mainXack2_dp_to_cp <= ackR(0);
      data_in <= a & b;
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
    fin   : out std_logic;
    add_call_req : out  std_logic_vector(1 downto 0);
    add_call_ack : in   std_logic_vector(1 downto 0);
    add_call_data : out  std_logic_vector(127 downto 0);
    add_call_tag  :  out  std_logic_vector(1 downto 0);
    add_return_req : out  std_logic_vector(1 downto 0);
    add_return_ack : in   std_logic_vector(1 downto 0);
    add_return_data : in   std_logic_vector(63 downto 0);
    add_return_tag :  in   std_logic_vector(1 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity foo;
architecture Default of foo is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal mainXreq1_dp_to_cp : boolean;
  signal mainXack1_cp_to_dp : boolean;
  signal mainXreq2_dp_to_cp : boolean;
  signal mainXfXs1Xreq1_dp_to_cp : boolean;
  signal mainXfXs1Xack1_cp_to_dp : boolean;
  signal mainXfXs1Xreq2_dp_to_cp : boolean;
  signal mainXfXs1Xack2_cp_to_dp : boolean;
  signal mainXfXs2Xreq1_dp_to_cp : boolean;
  signal mainXfXs2Xack1_cp_to_dp : boolean;
  signal mainXfXs2Xreq2_dp_to_cp : boolean;
  signal mainXfXs2Xack2_cp_to_dp : boolean;
  signal mainXack2_cp_to_dp : boolean;
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
  cp_10: Block -- control-path 
    signal cp_10_start: Boolean;
    signal cp_11_symbol: Boolean;
    signal cp_12_symbol: Boolean;
    signal cp_13_symbol : Boolean;
    -- 
  begin -- 
    cp_10_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_11_symbol  <= cp_10_start; -- transition $entry
    cp_13: Block -- main 
      signal cp_13_start: Boolean;
      signal cp_14_symbol: Boolean;
      signal cp_15_symbol: Boolean;
      signal cp_16_symbol : Boolean;
      signal cp_33_symbol : Boolean;
      signal cp_34_symbol : Boolean;
      signal cp_35_symbol : Boolean;
      signal cp_36_symbol : Boolean;
      -- 
    begin -- 
      cp_13_start <= cp_11_symbol; -- control passed to block
      cp_14_symbol  <= cp_13_start; -- transition main/$entry
      cp_16: Block -- main/f 
        signal cp_16_start: Boolean;
        signal cp_17_symbol: Boolean;
        signal cp_18_symbol: Boolean;
        signal cp_19_symbol : Boolean;
        signal cp_26_symbol : Boolean;
        -- 
      begin -- 
        cp_16_start <= cp_14_symbol; -- control passed to block
        cp_17_symbol  <= cp_16_start; -- transition main/f/$entry
        cp_19: Block -- main/f/s1 
          signal cp_19_start: Boolean;
          signal cp_20_symbol: Boolean;
          signal cp_21_symbol: Boolean;
          signal cp_22_symbol : Boolean;
          signal cp_23_symbol : Boolean;
          signal cp_24_symbol : Boolean;
          signal cp_25_symbol : Boolean;
          -- 
        begin -- 
          cp_19_start <= cp_17_symbol; -- control passed to block
          cp_20_symbol  <= cp_19_start; -- transition main/f/s1/$entry
          cp_22_symbol <= cp_20_symbol; -- transition main/f/s1/req1
          mainXfXs1Xreq1_cp_to_dp <= cp_22_symbol; -- link to DP
          cp_23_symbol <= mainXfXs1Xack1_dp_to_cp; -- transition main/f/s1/ack1
          cp_24_symbol <= cp_23_symbol; -- transition main/f/s1/req2
          mainXfXs1Xreq2_cp_to_dp <= cp_24_symbol; -- link to DP
          cp_25_symbol <= mainXfXs1Xack2_dp_to_cp; -- transition main/f/s1/ack2
          cp_21_symbol <= cp_25_symbol; -- transition main/f/s1/$exit
          cp_19_symbol <= cp_21_symbol; -- control passed from block 
          -- 
        end Block; -- main/f/s1
        cp_26: Block -- main/f/s2 
          signal cp_26_start: Boolean;
          signal cp_27_symbol: Boolean;
          signal cp_28_symbol: Boolean;
          signal cp_29_symbol : Boolean;
          signal cp_30_symbol : Boolean;
          signal cp_31_symbol : Boolean;
          signal cp_32_symbol : Boolean;
          -- 
        begin -- 
          cp_26_start <= cp_17_symbol; -- control passed to block
          cp_27_symbol  <= cp_26_start; -- transition main/f/s2/$entry
          cp_29_symbol <= cp_27_symbol; -- transition main/f/s2/req1
          mainXfXs2Xreq1_cp_to_dp <= cp_29_symbol; -- link to DP
          cp_30_symbol <= mainXfXs2Xack1_dp_to_cp; -- transition main/f/s2/ack1
          cp_31_symbol <= cp_30_symbol; -- transition main/f/s2/req2
          mainXfXs2Xreq2_cp_to_dp <= cp_31_symbol; -- link to DP
          cp_32_symbol <= mainXfXs2Xack2_dp_to_cp; -- transition main/f/s2/ack2
          cp_28_symbol <= cp_32_symbol; -- transition main/f/s2/$exit
          cp_26_symbol <= cp_28_symbol; -- control passed from block 
          -- 
        end Block; -- main/f/s2
        cp_18_block : Block -- non-trivial join transition main/f/$exit 
          signal cp_18_predecessors: BooleanArray(1 downto 0);
          signal cp_18_p0_pred: BooleanArray(0 downto 0);
          signal cp_18_p0_succ: BooleanArray(0 downto 0);
          signal cp_18_p1_pred: BooleanArray(0 downto 0);
          signal cp_18_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          cp_18_0_place: Place port map( -- 
            cp_18_p0_pred, cp_18_p0_succ, cp_18_predecessors(0), clk, reset-- 
          ); -- 
          cp_18_p0_succ(0) <=  cp_18_symbol;
          cp_18_p0_pred(0) <=  cp_19_symbol;
          cp_18_1_place: Place port map( -- 
            cp_18_p1_pred, cp_18_p1_succ, cp_18_predecessors(1), clk, reset-- 
          ); -- 
          cp_18_p1_succ(0) <=  cp_18_symbol;
          cp_18_p1_pred(0) <=  cp_26_symbol;
          cp_18_symbol <= OrReduce(cp_18_predecessors); 
          -- 
        end Block; -- non-trivial join transition main/f/$exit
        cp_16_symbol <= cp_18_symbol; -- control passed from block 
        -- 
      end Block; -- main/f
      cp_33_symbol <= cp_16_symbol; -- transition main/req1
      mainXreq1_cp_to_dp <= cp_33_symbol; -- link to DP
      cp_34_symbol <= mainXack1_dp_to_cp; -- transition main/ack1
      cp_35_symbol <= cp_34_symbol; -- transition main/req2
      mainXreq2_cp_to_dp <= cp_35_symbol; -- link to DP
      cp_36_symbol <= mainXack2_dp_to_cp; -- transition main/ack2
      cp_15_symbol <= cp_36_symbol; -- transition main/$exit
      cp_13_symbol <= cp_15_symbol; -- control passed from block 
      -- 
    end Block; -- main
    cp_12_symbol <= cp_13_symbol; -- transition $exit
    fin  <=  '1' when cp_12_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal s : std_logic_vector (31 downto 0);
    signal t : std_logic_vector (31 downto 0);
    -- 
  begin -- 
    -- shared call operator group (0) : a3 a1 
    CallGroup0: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      -- 
    begin -- 
      reqL(1) <= mainXreq1_cp_to_dp;
      reqL(0) <= mainXfXs1Xreq1_cp_to_dp;
      mainXack1_dp_to_cp <= ackL(1);
      mainXfXs1Xack1_dp_to_cp <= ackL(0);
      reqR(1) <= mainXreq2_cp_to_dp;
      reqR(0) <= mainXfXs1Xreq2_cp_to_dp;
      mainXack2_dp_to_cp <= ackR(1);
      mainXfXs1Xack2_dp_to_cp <= ackR(0);
      data_in <= t & s & a & b;
      c <= data_out(63 downto 32);
      t <= data_out(31 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 128, owidth => 64, twidth => 1, nreqs => 2,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => add_call_req(1),
          mack => add_call_ack(1),
          maddr => add_call_data(127 downto 64),
          mtag => add_call_tag(1 downto 1),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 32, owidth => 64, twidth => 1, nreqs => 2,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => add_return_req(1),
          ackL => add_return_ack(1),
          dataL => add_return_data(63 downto 32),
          tagL => add_return_tag(1 downto 1),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- shared call operator group (1) : a2 
    CallGroup1: Block -- 
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
      CallReq: InputMuxBase -- 
        generic map (iwidth => 64, owidth => 64, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => add_call_req(0),
          mack => add_call_ack(0),
          maddr => add_call_data(63 downto 0),
          mtag => add_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 32, owidth => 32, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => add_return_req(0),
          ackL => add_return_ack(0),
          dataL => add_return_data(31 downto 0),
          tagL => add_return_tag(0 downto 0),
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
use ahir.loadstorepack.all;
use ahir.operatorpackage.all;
entity test_system is  -- system 
  port (-- 
    foo_a : in  std_logic_vector(31 downto 0);
    foo_b : in  std_logic_vector(31 downto 0);
    foo_p : in  std_logic_vector(31 downto 0);
    foo_q : in  std_logic_vector(31 downto 0);
    foo_c : out  std_logic_vector(31 downto 0);
    foo_start : in std_logic;
    foo_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module add
  component add is -- 
    port ( -- 
      a : in  std_logic_vector(31 downto 0);
      b : in  std_logic_vector(31 downto 0);
      c : in  std_logic_vector(31 downto 0);
      clock : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module add
  signal add_a :  std_logic_vector(31 downto 0);
  signal add_b :  std_logic_vector(31 downto 0);
  signal add_c :  std_logic_vector(31 downto 0);
  signal add_in_args    : std_logic_vector(63 downto 0);
  signal add_out_args   : std_logic_vector(31 downto 0);
  signal add_tag_in    : std_logic_vector(0 downto 0);
  signal add_tag_out   : std_logic_vector(0 downto 0);
  signal add_start : std_logic;
  signal add_fin   : std_logic;
  -- caller side aggregated signals for module add
  signal add_call_reqs: std_logic_vector(1 downto 0);
  signal add_call_acks: std_logic_vector(1 downto 0);
  signal add_return_reqs: std_logic_vector(1 downto 0);
  signal add_return_acks: std_logic_vector(1 downto 0);
  signal add_call_data: std_logic_vector(127 downto 0);
  signal add_call_tag: std_logic_vector(1 downto 0);
  signal add_return_data: std_logic_vector(63 downto 0);
  signal add_return_tag: std_logic_vector(1 downto 0);
  -- module-side aggregated signal for module add
  signal add_call_data: std_logic_vector(63 downto 0);
  signal add_return_data: std_logic_vector(63 downto 0);
  -- declarations related to module foo
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
      fin   : out std_logic;
      add_call_req : out  std_logic_vector(1 downto 0);
      add_call_ack : in   std_logic_vector(1 downto 0);
      add_call_data : out  std_logic_vector(127 downto 0);
      add_call_tag  :  out  std_logic_vector(1 downto 0);
      add_return_req : out  std_logic_vector(1 downto 0);
      add_return_ack : in   std_logic_vector(1 downto 0);
      add_return_data : in   std_logic_vector(63 downto 0);
      add_return_tag :  in   std_logic_vector(1 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- 
begin -- 
  -- module add
  add_a <= add_in_args(63 downto 32);
  add_b <= add_in_args(31 downto 0);
  add_out_args <= add_c ;
  -- call arbiter for module add
  add_arbiter: CallArbiterUnitary -- 
    generic map( --
      num_reqs => 2,
      call_data_width => 64,
      return_data_width => 32,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => add_call_reqs,
      call_acks => add_call_acks,
      return_reqs => add_return_reqs,
      return_acks => add_return_acks,
      call_data  => add_call_data,
      call_tag  => add_call_tag,
      return_tag  => add_return_tag,
      call_in_tag => add_tag_in,
      call_out_tag => add_tag_out,
      return_data =>add_return_data,
      call_start => add_start,
      call_fin => add_fin,
      call_in_args => add_in_args,
      call_out_args => add_out_args,
      clk => clk, 
      reset => reset --
    ); --
  add_instance:add-- 
    port map(-- 
      a => add_a,
      b => add_b,
      c => add_c,
      start => add_start,
      fin => add_fin,
      clk => clk,
      reset => reset,
      tag_in => add_tag_in,
      tag_out => add_tag_out-- 
    ); -- 
  -- module foo
  foo_instance:foo-- 
    port map(-- 
      a => foo_a,
      b => foo_b,
      p => foo_p,
      q => foo_q,
      c => foo_c,
      start => foo_start,
      fin => foo_fin,
      clk => clk,
      reset => reset,
      add_call_reqs => add_call_reqs(1 downto 0),
      add_call_ack => add_call_acks(1 downto 0),
      add_call_data => add_call_data(127 downto 0),
      add_call_tag => add_call_tag(1 downto 0),
      add_return_req => add_return_reqs(1 downto 0),
      add_return_ack => add_return_acks(1 downto 0),
      add_return_data => add_return_data(63 downto 0),
      add_return_tag => add_return_tag(1 downto 0),
      tag_in => foo_tag_in,
      tag_out => foo_tag_out-- 
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
use ahir.loadstorepack.all;
use ahir.operatorpackage.all;
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      foo_a : in  std_logic_vector(31 downto 0);
      foo_b : in  std_logic_vector(31 downto 0);
      foo_p : in  std_logic_vector(31 downto 0);
      foo_q : in  std_logic_vector(31 downto 0);
      foo_c : out  std_logic_vector(31 downto 0);
      foo_start : in std_logic;
      foo_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal foo_a :  std_logic_vector(31 downto 0);
  signal foo_b :  std_logic_vector(31 downto 0);
  signal foo_p :  std_logic_vector(31 downto 0);
  signal foo_q :  std_logic_vector(31 downto 0);
  signal foo_c :   std_logic_vector(31 downto 0);
  signal foo_start : std_logic;
  signal foo_fin   : std_logic;
  -- 
begin --
  test_system_instance: test_system -- 
    port map ( -- 
      foo_a => foo_a,
      foo_b => foo_b,
      foo_p => foo_p,
      foo_q => foo_q,
      foo_c => foo_c,
      foo_start => foo_start,
      foo_fin  => foo_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
