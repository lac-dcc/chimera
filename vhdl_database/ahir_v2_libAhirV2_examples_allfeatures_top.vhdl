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
use ahir.operatorpackage.all;
entity add is -- 
  port ( -- 
    a : in  std_logic_vector(7 downto 0);
    b : in  std_logic_vector(7 downto 0);
    c : out  std_logic_vector(7 downto 0);
    clk : in std_logic;
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
  signal mainXreq1_cp_to_dp : boolean;
  signal mainXack1_dp_to_cp : boolean;
  signal mainXreq2_cp_to_dp : boolean;
  signal mainXack2_dp_to_cp : boolean;
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
      signal data_in: std_logic_vector(15 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXreq1_cp_to_dp;
      mainXack1_dp_to_cp <= ackL(0);
      reqR(0) <= mainXreq2_cp_to_dp;
      mainXack2_dp_to_cp <= ackR(0);
      data_in <= a & b;
      c <= data_out(7 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 8, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 8,
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
entity stage1 is -- 
  port ( -- 
    a : in  std_logic_vector(7 downto 0);
    ret : out  std_logic_vector(0 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    global_sr_req : out  std_logic_vector(0 downto 0);
    global_sr_ack : in   std_logic_vector(0 downto 0);
    global_sr_addr : out  std_logic_vector(3 downto 0);
    global_sr_data : out  std_logic_vector(7 downto 0);
    global_sr_tag :  out  std_logic_vector(0 downto 0);
    global_sc_req : out  std_logic_vector(0 downto 0);
    global_sc_ack : in   std_logic_vector(0 downto 0);
    global_sc_tag :  in  std_logic_vector(0 downto 0);
    midpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    midpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    midpipe_pipe_write_data : out  std_logic_vector(7 downto 0);
    add_call_reqs : out  std_logic_vector(0 downto 0);
    add_call_acks : in   std_logic_vector(0 downto 0);
    add_call_data : out  std_logic_vector(15 downto 0);
    add_call_tag  :  out  std_logic_vector(0 downto 0);
    add_return_reqs : out  std_logic_vector(0 downto 0);
    add_return_acks : in   std_logic_vector(0 downto 0);
    add_return_data : in   std_logic_vector(7 downto 0);
    add_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity stage1;
architecture Default of stage1 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal mainXarr_cp_to_dp : boolean;
  signal null_assignXnarr_cp_to_dp : boolean;
  signal null_assignXnara_dp_to_cp : boolean;
  signal null_assignXnacr_cp_to_dp : boolean;
  signal null_assignXnaca_dp_to_cp : boolean;
  signal mainXara_dp_to_cp : boolean;
  signal mainXacr_cp_to_dp : boolean;
  signal mainXaca_dp_to_cp : boolean;
  signal mainXparXmemXsrr_cp_to_dp : boolean;
  signal mainXparXmemXsra_dp_to_cp : boolean;
  signal mainXparXmemXscr_cp_to_dp : boolean;
  signal mainXparXmemXsca_dp_to_cp : boolean;
  signal mainXparXpipeXpwr_cp_to_dp : boolean;
  signal mainXparXpipeXpwa_dp_to_cp : boolean;
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
    signal cp_20_symbol : Boolean;
    -- 
  begin -- 
    cp_10_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_11_symbol  <= cp_10_start; -- transition $entry
    cp_13: Block -- null_assign 
      signal cp_13_start: Boolean;
      signal cp_14_symbol: Boolean;
      signal cp_15_symbol: Boolean;
      signal cp_16_symbol : Boolean;
      signal cp_17_symbol : Boolean;
      signal cp_18_symbol : Boolean;
      signal cp_19_symbol : Boolean;
      -- 
    begin -- 
      cp_13_start <= cp_11_symbol; -- control passed to block
      cp_14_symbol  <= cp_13_start; -- transition null_assign/$entry
      cp_16_symbol <= cp_14_symbol; -- transition null_assign/narr
      null_assignXnarr_cp_to_dp <= cp_16_symbol; -- link to DP
      cp_17_symbol <= null_assignXnara_dp_to_cp; -- transition null_assign/nara
      cp_18_symbol <= cp_17_symbol; -- transition null_assign/nacr
      null_assignXnacr_cp_to_dp <= cp_18_symbol; -- link to DP
      cp_19_symbol <= null_assignXnaca_dp_to_cp; -- transition null_assign/naca
      cp_15_symbol <= cp_19_symbol; -- transition null_assign/$exit
      cp_13_symbol <= cp_15_symbol; -- control passed from block 
      -- 
    end Block; -- null_assign
    cp_20: Block -- main 
      signal cp_20_start: Boolean;
      signal cp_21_symbol: Boolean;
      signal cp_22_symbol: Boolean;
      signal cp_23_symbol : Boolean;
      signal cp_24_symbol : Boolean;
      signal cp_25_symbol : Boolean;
      signal cp_26_symbol : Boolean;
      signal cp_27_symbol : Boolean;
      signal cp_28_symbol : Boolean;
      signal cp_29_symbol : Boolean;
      -- 
    begin -- 
      cp_20_start <= cp_11_symbol; -- control passed to block
      cp_21_symbol  <= cp_20_start; -- transition main/$entry
      cp_23_symbol <= cp_21_symbol; -- transition main/prr
      cp_24_symbol <= cp_23_symbol; -- transition main/pra
      cp_25_symbol <= cp_24_symbol; -- transition main/arr
      mainXarr_cp_to_dp <= cp_25_symbol; -- link to DP
      cp_26_symbol <= mainXara_dp_to_cp; -- transition main/ara
      cp_27_symbol <= cp_26_symbol; -- transition main/acr
      mainXacr_cp_to_dp <= cp_27_symbol; -- link to DP
      cp_28_symbol <= mainXaca_dp_to_cp; -- transition main/aca
      cp_29: Block -- main/par 
        signal cp_29_start: Boolean;
        signal cp_30_symbol: Boolean;
        signal cp_31_symbol: Boolean;
        signal cp_32_symbol : Boolean;
        signal cp_39_symbol : Boolean;
        -- 
      begin -- 
        cp_29_start <= cp_28_symbol; -- control passed to block
        cp_30_symbol  <= cp_29_start; -- transition main/par/$entry
        cp_32: Block -- main/par/mem 
          signal cp_32_start: Boolean;
          signal cp_33_symbol: Boolean;
          signal cp_34_symbol: Boolean;
          signal cp_35_symbol : Boolean;
          signal cp_36_symbol : Boolean;
          signal cp_37_symbol : Boolean;
          signal cp_38_symbol : Boolean;
          -- 
        begin -- 
          cp_32_start <= cp_30_symbol; -- control passed to block
          cp_33_symbol  <= cp_32_start; -- transition main/par/mem/$entry
          cp_35_symbol <= cp_33_symbol; -- transition main/par/mem/srr
          mainXparXmemXsrr_cp_to_dp <= cp_35_symbol; -- link to DP
          cp_36_symbol <= mainXparXmemXsra_dp_to_cp; -- transition main/par/mem/sra
          cp_37_symbol <= cp_36_symbol; -- transition main/par/mem/scr
          mainXparXmemXscr_cp_to_dp <= cp_37_symbol; -- link to DP
          cp_38_symbol <= mainXparXmemXsca_dp_to_cp; -- transition main/par/mem/sca
          cp_34_symbol <= cp_38_symbol; -- transition main/par/mem/$exit
          cp_32_symbol <= cp_34_symbol; -- control passed from block 
          -- 
        end Block; -- main/par/mem
        cp_39: Block -- main/par/pipe 
          signal cp_39_start: Boolean;
          signal cp_40_symbol: Boolean;
          signal cp_41_symbol: Boolean;
          signal cp_42_symbol : Boolean;
          signal cp_43_symbol : Boolean;
          -- 
        begin -- 
          cp_39_start <= cp_30_symbol; -- control passed to block
          cp_40_symbol  <= cp_39_start; -- transition main/par/pipe/$entry
          cp_42_symbol <= cp_40_symbol; -- transition main/par/pipe/pwr
          mainXparXpipeXpwr_cp_to_dp <= cp_42_symbol; -- link to DP
          cp_43_symbol <= mainXparXpipeXpwa_dp_to_cp; -- transition main/par/pipe/pwa
          cp_41_symbol <= cp_43_symbol; -- transition main/par/pipe/$exit
          cp_39_symbol <= cp_41_symbol; -- control passed from block 
          -- 
        end Block; -- main/par/pipe
        cp_31_block : Block -- non-trivial join transition main/par/$exit 
          signal cp_31_predecessors: BooleanArray(1 downto 0);
          signal cp_31_p0_pred: BooleanArray(0 downto 0);
          signal cp_31_p0_succ: BooleanArray(0 downto 0);
          signal cp_31_p1_pred: BooleanArray(0 downto 0);
          signal cp_31_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          cp_31_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_31_p0_pred, cp_31_p0_succ, cp_31_predecessors(0), clk, reset-- 
            ); -- 
          cp_31_p0_succ(0) <=  cp_31_symbol;
          cp_31_p0_pred(0) <=  cp_32_symbol;
          cp_31_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_31_p1_pred, cp_31_p1_succ, cp_31_predecessors(1), clk, reset-- 
            ); -- 
          cp_31_p1_succ(0) <=  cp_31_symbol;
          cp_31_p1_pred(0) <=  cp_39_symbol;
          cp_31_symbol <= OrReduce(cp_31_predecessors); 
          -- 
        end Block; -- non-trivial join transition main/par/$exit
        cp_29_symbol <= cp_31_symbol; -- control passed from block 
        -- 
      end Block; -- main/par
      cp_22_symbol <= cp_29_symbol; -- transition main/$exit
      cp_20_symbol <= cp_22_symbol; -- control passed from block 
      -- 
    end Block; -- main
    cp_12_block : Block -- non-trivial join transition $exit 
      signal cp_12_predecessors: BooleanArray(1 downto 0);
      signal cp_12_p0_pred: BooleanArray(0 downto 0);
      signal cp_12_p0_succ: BooleanArray(0 downto 0);
      signal cp_12_p1_pred: BooleanArray(0 downto 0);
      signal cp_12_p1_succ: BooleanArray(0 downto 0);
      -- 
    begin -- 
      cp_12_0_place: Place -- 
        generic map(marking => false)
        port map( -- 
          cp_12_p0_pred, cp_12_p0_succ, cp_12_predecessors(0), clk, reset-- 
        ); -- 
      cp_12_p0_succ(0) <=  cp_12_symbol;
      cp_12_p0_pred(0) <=  cp_13_symbol;
      cp_12_1_place: Place -- 
        generic map(marking => false)
        port map( -- 
          cp_12_p1_pred, cp_12_p1_succ, cp_12_predecessors(1), clk, reset-- 
        ); -- 
      cp_12_p1_succ(0) <=  cp_12_symbol;
      cp_12_p1_pred(0) <=  cp_20_symbol;
      cp_12_symbol <= OrReduce(cp_12_predecessors); 
      -- 
    end Block; -- non-trivial join transition $exit
    fin  <=  '1' when cp_12_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal add_result : std_logic_vector (7 downto 0);
    signal atrue : std_logic_vector (0 downto 0);
    signal pipe_data : std_logic_vector (7 downto 0);
    signal store_addr : std_logic_vector (3 downto 0);
    -- 
  begin -- 
    atrue <= "1";
    store_addr <= "0000";
    -- shared split operator group (0) : assign1 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= null_assignXnarr_cp_to_dp;
      null_assignXnara_dp_to_cp <= ackL(0);
      reqR(0) <= null_assignXnacr_cp_to_dp;
      null_assignXnaca_dp_to_cp <= ackR(0);
      data_in <= atrue;
      ret <= data_out(0 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApAssign",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 0
    -- shared store operator group (0) : store1 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(3 downto 0);
      signal data_in: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXparXmemXsrr_cp_to_dp;
      mainXparXmemXsra_dp_to_cp <= ackL(0);
      reqR(0) <= mainXparXmemXscr_cp_to_dp;
      mainXparXmemXsca_dp_to_cp <= ackR(0);
      addr_in <= store_addr;
      data_in <= add_result;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 4,
        data_width => 8,
        num_reqs => 1,
        tag_length => 1,
        no_arbitration => true)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => global_sr_req(0),
          mack => global_sr_ack(0),
          maddr => global_sr_addr(3 downto 0),
          mdata => global_sr_data(7 downto 0),
          mtag => global_sr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          num_reqs => 1,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => global_sc_req(0),
          mack => global_sc_ack(0),
          mtag => global_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 0
    -- shared outport operator group (0) : outport 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= mainXparXpipeXpwr_cp_to_dp;
      mainXparXpipeXpwa_dp_to_cp <= ack(0);
      data_in <= add_result;
      outport: OutputPort -- 
        generic map ( data_width => 8,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => midpipe_pipe_write_req(0),
          oack => midpipe_pipe_write_ack(0),
          odata => midpipe_pipe_write_data(7 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : add1 
    CallGroup0: Block -- 
      signal data_in: std_logic_vector(15 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXarr_cp_to_dp;
      mainXara_dp_to_cp <= ackL(0);
      reqR(0) <= mainXacr_cp_to_dp;
      mainXaca_dp_to_cp <= ackR(0);
      data_in <= pipe_data & a;
      add_result <= data_out(7 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 16, owidth => 16, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => add_call_reqs(0),
          ackR => add_call_acks(0),
          dataR => add_call_data(15 downto 0),
          tagR => add_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 8, owidth => 8, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => add_return_acks(0), -- cross-over
          ackL => add_return_reqs(0), -- cross-over
          dataL => add_return_data(7 downto 0),
          tagL => add_return_tag(0 downto 0),
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
entity stage2 is -- 
  port ( -- 
    a : in  std_logic_vector(7 downto 0);
    ret : out  std_logic_vector(0 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    global_lr_req : out  std_logic_vector(0 downto 0);
    global_lr_ack : in   std_logic_vector(0 downto 0);
    global_lr_addr : out  std_logic_vector(3 downto 0);
    global_lr_tag :  out  std_logic_vector(0 downto 0);
    global_lc_req : out  std_logic_vector(0 downto 0);
    global_lc_ack : in   std_logic_vector(0 downto 0);
    global_lc_data : in   std_logic_vector(7 downto 0);
    global_lc_tag :  in  std_logic_vector(0 downto 0);
    midpipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    midpipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    midpipe_pipe_read_data : in   std_logic_vector(7 downto 0);
    outpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    outpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    outpipe_pipe_write_data : out  std_logic_vector(7 downto 0);
    add_call_reqs : out  std_logic_vector(0 downto 0);
    add_call_acks : in   std_logic_vector(0 downto 0);
    add_call_data : out  std_logic_vector(15 downto 0);
    add_call_tag  :  out  std_logic_vector(0 downto 0);
    add_return_reqs : out  std_logic_vector(0 downto 0);
    add_return_acks : in   std_logic_vector(0 downto 0);
    add_return_data : in   std_logic_vector(7 downto 0);
    add_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity stage2;
architecture Default of stage2 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal mainXacr_cp_to_dp : boolean;
  signal mainXaca_dp_to_cp : boolean;
  signal mainXpwr_cp_to_dp : boolean;
  signal mainXpwa_dp_to_cp : boolean;
  signal null_assignXnarr_cp_to_dp : boolean;
  signal null_assignXnara_dp_to_cp : boolean;
  signal null_assignXnacr_cp_to_dp : boolean;
  signal null_assignXnaca_dp_to_cp : boolean;
  signal mainXparXmemXlrr_cp_to_dp : boolean;
  signal mainXparXmemXlra_dp_to_cp : boolean;
  signal mainXparXmemXlcr_cp_to_dp : boolean;
  signal mainXparXmemXlca_dp_to_cp : boolean;
  signal mainXparXpipeXprr_cp_to_dp : boolean;
  signal mainXparXpipeXpra_dp_to_cp : boolean;
  signal mainXarr_cp_to_dp : boolean;
  signal mainXara_dp_to_cp : boolean;
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
  cp_44: Block -- control-path 
    signal cp_44_start: Boolean;
    signal cp_45_symbol: Boolean;
    signal cp_46_symbol: Boolean;
    signal cp_47_symbol : Boolean;
    signal cp_54_symbol : Boolean;
    -- 
  begin -- 
    cp_44_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_45_symbol  <= cp_44_start; -- transition $entry
    cp_47: Block -- null_assign 
      signal cp_47_start: Boolean;
      signal cp_48_symbol: Boolean;
      signal cp_49_symbol: Boolean;
      signal cp_50_symbol : Boolean;
      signal cp_51_symbol : Boolean;
      signal cp_52_symbol : Boolean;
      signal cp_53_symbol : Boolean;
      -- 
    begin -- 
      cp_47_start <= cp_45_symbol; -- control passed to block
      cp_48_symbol  <= cp_47_start; -- transition null_assign/$entry
      cp_50_symbol <= cp_48_symbol; -- transition null_assign/narr
      null_assignXnarr_cp_to_dp <= cp_50_symbol; -- link to DP
      cp_51_symbol <= null_assignXnara_dp_to_cp; -- transition null_assign/nara
      cp_52_symbol <= cp_51_symbol; -- transition null_assign/nacr
      null_assignXnacr_cp_to_dp <= cp_52_symbol; -- link to DP
      cp_53_symbol <= null_assignXnaca_dp_to_cp; -- transition null_assign/naca
      cp_49_symbol <= cp_53_symbol; -- transition null_assign/$exit
      cp_47_symbol <= cp_49_symbol; -- control passed from block 
      -- 
    end Block; -- null_assign
    cp_54: Block -- main 
      signal cp_54_start: Boolean;
      signal cp_55_symbol: Boolean;
      signal cp_56_symbol: Boolean;
      signal cp_57_symbol : Boolean;
      signal cp_72_symbol : Boolean;
      signal cp_73_symbol : Boolean;
      signal cp_74_symbol : Boolean;
      signal cp_75_symbol : Boolean;
      signal cp_76_symbol : Boolean;
      signal cp_77_symbol : Boolean;
      -- 
    begin -- 
      cp_54_start <= cp_45_symbol; -- control passed to block
      cp_55_symbol  <= cp_54_start; -- transition main/$entry
      cp_57: Block -- main/par 
        signal cp_57_start: Boolean;
        signal cp_58_symbol: Boolean;
        signal cp_59_symbol: Boolean;
        signal cp_60_symbol : Boolean;
        signal cp_67_symbol : Boolean;
        -- 
      begin -- 
        cp_57_start <= cp_55_symbol; -- control passed to block
        cp_58_symbol  <= cp_57_start; -- transition main/par/$entry
        cp_60: Block -- main/par/mem 
          signal cp_60_start: Boolean;
          signal cp_61_symbol: Boolean;
          signal cp_62_symbol: Boolean;
          signal cp_63_symbol : Boolean;
          signal cp_64_symbol : Boolean;
          signal cp_65_symbol : Boolean;
          signal cp_66_symbol : Boolean;
          -- 
        begin -- 
          cp_60_start <= cp_58_symbol; -- control passed to block
          cp_61_symbol  <= cp_60_start; -- transition main/par/mem/$entry
          cp_63_symbol <= cp_61_symbol; -- transition main/par/mem/lrr
          mainXparXmemXlrr_cp_to_dp <= cp_63_symbol; -- link to DP
          cp_64_symbol <= mainXparXmemXlra_dp_to_cp; -- transition main/par/mem/lra
          cp_65_symbol <= cp_64_symbol; -- transition main/par/mem/lcr
          mainXparXmemXlcr_cp_to_dp <= cp_65_symbol; -- link to DP
          cp_66_symbol <= mainXparXmemXlca_dp_to_cp; -- transition main/par/mem/lca
          cp_62_symbol <= cp_66_symbol; -- transition main/par/mem/$exit
          cp_60_symbol <= cp_62_symbol; -- control passed from block 
          -- 
        end Block; -- main/par/mem
        cp_67: Block -- main/par/pipe 
          signal cp_67_start: Boolean;
          signal cp_68_symbol: Boolean;
          signal cp_69_symbol: Boolean;
          signal cp_70_symbol : Boolean;
          signal cp_71_symbol : Boolean;
          -- 
        begin -- 
          cp_67_start <= cp_58_symbol; -- control passed to block
          cp_68_symbol  <= cp_67_start; -- transition main/par/pipe/$entry
          cp_70_symbol <= cp_68_symbol; -- transition main/par/pipe/prr
          mainXparXpipeXprr_cp_to_dp <= cp_70_symbol; -- link to DP
          cp_71_symbol <= mainXparXpipeXpra_dp_to_cp; -- transition main/par/pipe/pra
          cp_69_symbol <= cp_71_symbol; -- transition main/par/pipe/$exit
          cp_67_symbol <= cp_69_symbol; -- control passed from block 
          -- 
        end Block; -- main/par/pipe
        cp_59_block : Block -- non-trivial join transition main/par/$exit 
          signal cp_59_predecessors: BooleanArray(1 downto 0);
          signal cp_59_p0_pred: BooleanArray(0 downto 0);
          signal cp_59_p0_succ: BooleanArray(0 downto 0);
          signal cp_59_p1_pred: BooleanArray(0 downto 0);
          signal cp_59_p1_succ: BooleanArray(0 downto 0);
          -- 
        begin -- 
          cp_59_0_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_59_p0_pred, cp_59_p0_succ, cp_59_predecessors(0), clk, reset-- 
            ); -- 
          cp_59_p0_succ(0) <=  cp_59_symbol;
          cp_59_p0_pred(0) <=  cp_60_symbol;
          cp_59_1_place: Place -- 
            generic map(marking => false)
            port map( -- 
              cp_59_p1_pred, cp_59_p1_succ, cp_59_predecessors(1), clk, reset-- 
            ); -- 
          cp_59_p1_succ(0) <=  cp_59_symbol;
          cp_59_p1_pred(0) <=  cp_67_symbol;
          cp_59_symbol <= OrReduce(cp_59_predecessors); 
          -- 
        end Block; -- non-trivial join transition main/par/$exit
        cp_57_symbol <= cp_59_symbol; -- control passed from block 
        -- 
      end Block; -- main/par
      cp_72_symbol <= cp_57_symbol; -- transition main/arr
      mainXarr_cp_to_dp <= cp_72_symbol; -- link to DP
      cp_73_symbol <= mainXara_dp_to_cp; -- transition main/ara
      cp_74_symbol <= cp_73_symbol; -- transition main/acr
      mainXacr_cp_to_dp <= cp_74_symbol; -- link to DP
      cp_75_symbol <= mainXaca_dp_to_cp; -- transition main/aca
      cp_76_symbol <= cp_75_symbol; -- transition main/pwr
      mainXpwr_cp_to_dp <= cp_76_symbol; -- link to DP
      cp_77_symbol <= mainXpwa_dp_to_cp; -- transition main/pwa
      cp_56_symbol <= cp_77_symbol; -- transition main/$exit
      cp_54_symbol <= cp_56_symbol; -- control passed from block 
      -- 
    end Block; -- main
    cp_46_block : Block -- non-trivial join transition $exit 
      signal cp_46_predecessors: BooleanArray(1 downto 0);
      signal cp_46_p0_pred: BooleanArray(0 downto 0);
      signal cp_46_p0_succ: BooleanArray(0 downto 0);
      signal cp_46_p1_pred: BooleanArray(0 downto 0);
      signal cp_46_p1_succ: BooleanArray(0 downto 0);
      -- 
    begin -- 
      cp_46_0_place: Place -- 
        generic map(marking => false)
        port map( -- 
          cp_46_p0_pred, cp_46_p0_succ, cp_46_predecessors(0), clk, reset-- 
        ); -- 
      cp_46_p0_succ(0) <=  cp_46_symbol;
      cp_46_p0_pred(0) <=  cp_47_symbol;
      cp_46_1_place: Place -- 
        generic map(marking => false)
        port map( -- 
          cp_46_p1_pred, cp_46_p1_succ, cp_46_predecessors(1), clk, reset-- 
        ); -- 
      cp_46_p1_succ(0) <=  cp_46_symbol;
      cp_46_p1_pred(0) <=  cp_54_symbol;
      cp_46_symbol <= OrReduce(cp_46_predecessors); 
      -- 
    end Block; -- non-trivial join transition $exit
    fin  <=  '1' when cp_46_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal add_result : std_logic_vector (7 downto 0);
    signal load_addr : std_logic_vector (3 downto 0);
    signal load_data : std_logic_vector (7 downto 0);
    signal load_result : std_logic_vector (7 downto 0);
    signal pipe_data : std_logic_vector (7 downto 0);
    signal ret_const : std_logic_vector (0 downto 0);
    -- 
  begin -- 
    load_addr <= "0000";
    ret_const <= "0";
    -- shared split operator group (0) : assign1 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= null_assignXnarr_cp_to_dp;
      null_assignXnara_dp_to_cp <= ackL(0);
      reqR(0) <= null_assignXnacr_cp_to_dp;
      null_assignXnaca_dp_to_cp <= ackR(0);
      data_in <= ret_const;
      ret <= data_out(0 downto 0);
      SplitOperator: SplitOperatorShared -- 
        generic map ( -- 
          operator_id => "ApAssign",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          use_constant  => false,
          zero_delay => false, 
          no_arbitration => true, 
          num_reqs => 1--
        ) -- 
      port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset);
      -- 
    end Block; -- split operator group 0
    -- shared load operator group (0) : load1 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(3 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXparXmemXlrr_cp_to_dp;
      mainXparXmemXlra_dp_to_cp <= ackL(0);
      reqR(0) <= mainXparXmemXlcr_cp_to_dp;
      mainXparXmemXlca_dp_to_cp <= ackR(0);
      data_in <= load_addr;
      load_result <= data_out(7 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 4,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => global_lr_req(0),
          mack => global_lr_ack(0),
          maddr => global_lr_addr(3 downto 0),
          mtag => global_lr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( data_width => 8,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => global_lc_req(0),
          mack => global_lc_ack(0),
          mdata => global_lc_data(7 downto 0),
          mtag => global_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    -- shared inport operator group (0) : inport 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(7 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= mainXparXpipeXprr_cp_to_dp;
      mainXparXpipeXpra_dp_to_cp <= ack(0);
      pipe_data <= data_out(7 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 8,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => midpipe_pipe_read_req(0),
          oack => midpipe_pipe_read_ack(0),
          odata => midpipe_pipe_read_data(7 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : outport 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= mainXpwr_cp_to_dp;
      mainXpwa_dp_to_cp <= ack(0);
      data_in <= add_result;
      outport: OutputPort -- 
        generic map ( data_width => 8,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => outpipe_pipe_write_req(0),
          oack => outpipe_pipe_write_ack(0),
          odata => outpipe_pipe_write_data(7 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : add1 
    CallGroup0: Block -- 
      signal data_in: std_logic_vector(15 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXarr_cp_to_dp;
      mainXara_dp_to_cp <= ackL(0);
      reqR(0) <= mainXacr_cp_to_dp;
      mainXaca_dp_to_cp <= ackR(0);
      data_in <= pipe_data & a;
      add_result <= data_out(7 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 16, owidth => 16, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => add_call_reqs(0),
          ackR => add_call_acks(0),
          dataR => add_call_data(15 downto 0),
          tagR => add_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 8, owidth => 8, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => add_return_acks(0), -- cross-over
          ackL => add_return_reqs(0), -- cross-over
          dataL => add_return_data(7 downto 0),
          tagL => add_return_tag(0 downto 0),
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
entity top is -- 
  port ( -- 
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    stage1_call_reqs : out  std_logic_vector(0 downto 0);
    stage1_call_acks : in   std_logic_vector(0 downto 0);
    stage1_call_data : out  std_logic_vector(7 downto 0);
    stage1_call_tag  :  out  std_logic_vector(0 downto 0);
    stage1_return_reqs : out  std_logic_vector(0 downto 0);
    stage1_return_acks : in   std_logic_vector(0 downto 0);
    stage1_return_data : in   std_logic_vector(0 downto 0);
    stage1_return_tag :  in   std_logic_vector(0 downto 0);
    stage2_call_reqs : out  std_logic_vector(0 downto 0);
    stage2_call_acks : in   std_logic_vector(0 downto 0);
    stage2_call_data : out  std_logic_vector(7 downto 0);
    stage2_call_tag  :  out  std_logic_vector(0 downto 0);
    stage2_return_reqs : out  std_logic_vector(0 downto 0);
    stage2_return_acks : in   std_logic_vector(0 downto 0);
    stage2_return_data : in   std_logic_vector(0 downto 0);
    stage2_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity top;
architecture Default of top is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal stage1Xrr_cp_to_dp : boolean;
  signal stage1Xra_dp_to_cp : boolean;
  signal stage1Xcr_cp_to_dp : boolean;
  signal stage1Xca_dp_to_cp : boolean;
  signal stage2Xrr_cp_to_dp : boolean;
  signal stage2Xra_dp_to_cp : boolean;
  signal stage2Xcr_cp_to_dp : boolean;
  signal stage2Xca_dp_to_cp : boolean;
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
  cp_78: Block -- control-path 
    signal cp_78_start: Boolean;
    signal cp_79_symbol: Boolean;
    signal cp_80_symbol: Boolean;
    signal cp_81_symbol : Boolean;
    signal cp_88_symbol : Boolean;
    -- 
  begin -- 
    cp_78_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_79_symbol  <= cp_78_start; -- transition $entry
    cp_81: Block -- stage1 
      signal cp_81_start: Boolean;
      signal cp_82_symbol: Boolean;
      signal cp_83_symbol: Boolean;
      signal cp_84_symbol : Boolean;
      signal cp_85_symbol : Boolean;
      signal cp_86_symbol : Boolean;
      signal cp_87_symbol : Boolean;
      -- 
    begin -- 
      cp_81_start <= cp_79_symbol; -- control passed to block
      cp_82_symbol  <= cp_81_start; -- transition stage1/$entry
      cp_84_symbol <= cp_82_symbol; -- transition stage1/rr
      stage1Xrr_cp_to_dp <= cp_84_symbol; -- link to DP
      cp_85_symbol <= stage1Xra_dp_to_cp; -- transition stage1/ra
      cp_86_symbol <= cp_85_symbol; -- transition stage1/cr
      stage1Xcr_cp_to_dp <= cp_86_symbol; -- link to DP
      cp_87_symbol <= stage1Xca_dp_to_cp; -- transition stage1/ca
      cp_83_symbol <= cp_87_symbol; -- transition stage1/$exit
      cp_81_symbol <= cp_83_symbol; -- control passed from block 
      -- 
    end Block; -- stage1
    cp_88: Block -- stage2 
      signal cp_88_start: Boolean;
      signal cp_89_symbol: Boolean;
      signal cp_90_symbol: Boolean;
      signal cp_91_symbol : Boolean;
      signal cp_92_symbol : Boolean;
      signal cp_93_symbol : Boolean;
      signal cp_94_symbol : Boolean;
      -- 
    begin -- 
      cp_88_start <= cp_79_symbol; -- control passed to block
      cp_89_symbol  <= cp_88_start; -- transition stage2/$entry
      cp_91_symbol <= cp_89_symbol; -- transition stage2/rr
      stage2Xrr_cp_to_dp <= cp_91_symbol; -- link to DP
      cp_92_symbol <= stage2Xra_dp_to_cp; -- transition stage2/ra
      cp_93_symbol <= cp_92_symbol; -- transition stage2/cr
      stage2Xcr_cp_to_dp <= cp_93_symbol; -- link to DP
      cp_94_symbol <= stage2Xca_dp_to_cp; -- transition stage2/ca
      cp_90_symbol <= cp_94_symbol; -- transition stage2/$exit
      cp_88_symbol <= cp_90_symbol; -- control passed from block 
      -- 
    end Block; -- stage2
    cp_80_block : Block -- non-trivial join transition $exit 
      signal cp_80_predecessors: BooleanArray(1 downto 0);
      signal cp_80_p0_pred: BooleanArray(0 downto 0);
      signal cp_80_p0_succ: BooleanArray(0 downto 0);
      signal cp_80_p1_pred: BooleanArray(0 downto 0);
      signal cp_80_p1_succ: BooleanArray(0 downto 0);
      -- 
    begin -- 
      cp_80_0_place: Place -- 
        generic map(marking => false)
        port map( -- 
          cp_80_p0_pred, cp_80_p0_succ, cp_80_predecessors(0), clk, reset-- 
        ); -- 
      cp_80_p0_succ(0) <=  cp_80_symbol;
      cp_80_p0_pred(0) <=  cp_81_symbol;
      cp_80_1_place: Place -- 
        generic map(marking => false)
        port map( -- 
          cp_80_p1_pred, cp_80_p1_succ, cp_80_predecessors(1), clk, reset-- 
        ); -- 
      cp_80_p1_succ(0) <=  cp_80_symbol;
      cp_80_p1_pred(0) <=  cp_88_symbol;
      cp_80_symbol <= OrReduce(cp_80_predecessors); 
      -- 
    end Block; -- non-trivial join transition $exit
    fin  <=  '1' when cp_80_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal input : std_logic_vector (7 downto 0);
    signal r1 : std_logic_vector (0 downto 0);
    signal r2 : std_logic_vector (0 downto 0);
    -- 
  begin -- 
    input <= "01010101";
    -- shared call operator group (0) : s1 
    CallGroup0: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= stage1Xrr_cp_to_dp;
      stage1Xra_dp_to_cp <= ackL(0);
      reqR(0) <= stage1Xcr_cp_to_dp;
      stage1Xca_dp_to_cp <= ackR(0);
      data_in <= input;
      r1 <= data_out(0 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 8, owidth => 8, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => stage1_call_reqs(0),
          ackR => stage1_call_acks(0),
          dataR => stage1_call_data(7 downto 0),
          tagR => stage1_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 1, owidth => 1, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => stage1_return_acks(0), -- cross-over
          ackL => stage1_return_reqs(0), -- cross-over
          dataL => stage1_return_data(0 downto 0),
          tagL => stage1_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- shared call operator group (1) : s2 
    CallGroup1: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= stage2Xrr_cp_to_dp;
      stage2Xra_dp_to_cp <= ackL(0);
      reqR(0) <= stage2Xcr_cp_to_dp;
      stage2Xca_dp_to_cp <= ackR(0);
      data_in <= input;
      r2 <= data_out(0 downto 0);
      CallReq: InputMuxBase -- 
        generic map (iwidth => 8, owidth => 8, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => stage2_call_reqs(0),
          ackR => stage2_call_acks(0),
          dataR => stage2_call_data(7 downto 0),
          tagR => stage2_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBase -- 
        generic map (iwidth => 1, owidth => 1, twidth => 1, nreqs => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => stage2_return_acks(0), -- cross-over
          ackL => stage2_return_reqs(0), -- cross-over
          dataL => stage2_return_data(0 downto 0),
          tagL => stage2_return_tag(0 downto 0),
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
entity test_system is  -- system 
  port (-- 
    top_tag_in: in std_logic_vector(0 downto 0);
    top_tag_out: out std_logic_vector(0 downto 0);
    top_start : in std_logic;
    top_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic;
    outpipe_pipe_read_data: out std_logic_vector(7 downto 0);
    outpipe_pipe_read_req : in std_logic;
    outpipe_pipe_read_ack : out std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- interface signals to connect to memory space global
  signal global_lr_req :  std_logic_vector(0 downto 0);
  signal global_lr_ack : std_logic_vector(0 downto 0);
  signal global_lr_addr : std_logic_vector(3 downto 0);
  signal global_lr_tag : std_logic_vector(0 downto 0);
  signal global_lc_req : std_logic_vector(0 downto 0);
  signal global_lc_ack :  std_logic_vector(0 downto 0);
  signal global_lc_data : std_logic_vector(7 downto 0);
  signal global_lc_tag :  std_logic_vector(0 downto 0);
  signal global_sr_req :  std_logic_vector(0 downto 0);
  signal global_sr_ack : std_logic_vector(0 downto 0);
  signal global_sr_addr : std_logic_vector(3 downto 0);
  signal global_sr_data : std_logic_vector(7 downto 0);
  signal global_sr_tag : std_logic_vector(0 downto 0);
  signal global_sc_req : std_logic_vector(0 downto 0);
  signal global_sc_ack :  std_logic_vector(0 downto 0);
  signal global_sc_tag :  std_logic_vector(0 downto 0);
  -- declarations related to module add
  component add is -- 
    port ( -- 
      a : in  std_logic_vector(7 downto 0);
      b : in  std_logic_vector(7 downto 0);
      c : out  std_logic_vector(7 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module add
  signal add_a :  std_logic_vector(7 downto 0);
  signal add_b :  std_logic_vector(7 downto 0);
  signal add_c :  std_logic_vector(7 downto 0);
  signal add_in_args    : std_logic_vector(15 downto 0);
  signal add_out_args   : std_logic_vector(7 downto 0);
  signal add_tag_in    : std_logic_vector(0 downto 0);
  signal add_tag_out   : std_logic_vector(0 downto 0);
  signal add_start : std_logic;
  signal add_fin   : std_logic;
  -- caller side aggregated signals for module add
  signal add_call_reqs: std_logic_vector(1 downto 0);
  signal add_call_acks: std_logic_vector(1 downto 0);
  signal add_return_reqs: std_logic_vector(1 downto 0);
  signal add_return_acks: std_logic_vector(1 downto 0);
  signal add_call_data: std_logic_vector(31 downto 0);
  signal add_call_tag: std_logic_vector(1 downto 0);
  signal add_return_data: std_logic_vector(15 downto 0);
  signal add_return_tag: std_logic_vector(1 downto 0);
  -- declarations related to module stage1
  component stage1 is -- 
    port ( -- 
      a : in  std_logic_vector(7 downto 0);
      ret : out  std_logic_vector(0 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      global_sr_req : out  std_logic_vector(0 downto 0);
      global_sr_ack : in   std_logic_vector(0 downto 0);
      global_sr_addr : out  std_logic_vector(3 downto 0);
      global_sr_data : out  std_logic_vector(7 downto 0);
      global_sr_tag :  out  std_logic_vector(0 downto 0);
      global_sc_req : out  std_logic_vector(0 downto 0);
      global_sc_ack : in   std_logic_vector(0 downto 0);
      global_sc_tag :  in  std_logic_vector(0 downto 0);
      midpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      midpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      midpipe_pipe_write_data : out  std_logic_vector(7 downto 0);
      add_call_reqs : out  std_logic_vector(0 downto 0);
      add_call_acks : in   std_logic_vector(0 downto 0);
      add_call_data : out  std_logic_vector(15 downto 0);
      add_call_tag  :  out  std_logic_vector(0 downto 0);
      add_return_reqs : out  std_logic_vector(0 downto 0);
      add_return_acks : in   std_logic_vector(0 downto 0);
      add_return_data : in   std_logic_vector(7 downto 0);
      add_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module stage1
  signal stage1_a :  std_logic_vector(7 downto 0);
  signal stage1_ret :  std_logic_vector(0 downto 0);
  signal stage1_in_args    : std_logic_vector(7 downto 0);
  signal stage1_out_args   : std_logic_vector(0 downto 0);
  signal stage1_tag_in    : std_logic_vector(0 downto 0);
  signal stage1_tag_out   : std_logic_vector(0 downto 0);
  signal stage1_start : std_logic;
  signal stage1_fin   : std_logic;
  -- caller side aggregated signals for module stage1
  signal stage1_call_reqs: std_logic_vector(0 downto 0);
  signal stage1_call_acks: std_logic_vector(0 downto 0);
  signal stage1_return_reqs: std_logic_vector(0 downto 0);
  signal stage1_return_acks: std_logic_vector(0 downto 0);
  signal stage1_call_data: std_logic_vector(7 downto 0);
  signal stage1_call_tag: std_logic_vector(0 downto 0);
  signal stage1_return_data: std_logic_vector(0 downto 0);
  signal stage1_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module stage2
  component stage2 is -- 
    port ( -- 
      a : in  std_logic_vector(7 downto 0);
      ret : out  std_logic_vector(0 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      global_lr_req : out  std_logic_vector(0 downto 0);
      global_lr_ack : in   std_logic_vector(0 downto 0);
      global_lr_addr : out  std_logic_vector(3 downto 0);
      global_lr_tag :  out  std_logic_vector(0 downto 0);
      global_lc_req : out  std_logic_vector(0 downto 0);
      global_lc_ack : in   std_logic_vector(0 downto 0);
      global_lc_data : in   std_logic_vector(7 downto 0);
      global_lc_tag :  in  std_logic_vector(0 downto 0);
      midpipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      midpipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      midpipe_pipe_read_data : in   std_logic_vector(7 downto 0);
      outpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      outpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      outpipe_pipe_write_data : out  std_logic_vector(7 downto 0);
      add_call_reqs : out  std_logic_vector(0 downto 0);
      add_call_acks : in   std_logic_vector(0 downto 0);
      add_call_data : out  std_logic_vector(15 downto 0);
      add_call_tag  :  out  std_logic_vector(0 downto 0);
      add_return_reqs : out  std_logic_vector(0 downto 0);
      add_return_acks : in   std_logic_vector(0 downto 0);
      add_return_data : in   std_logic_vector(7 downto 0);
      add_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- argument signals for module stage2
  signal stage2_a :  std_logic_vector(7 downto 0);
  signal stage2_ret :  std_logic_vector(0 downto 0);
  signal stage2_in_args    : std_logic_vector(7 downto 0);
  signal stage2_out_args   : std_logic_vector(0 downto 0);
  signal stage2_tag_in    : std_logic_vector(0 downto 0);
  signal stage2_tag_out   : std_logic_vector(0 downto 0);
  signal stage2_start : std_logic;
  signal stage2_fin   : std_logic;
  -- caller side aggregated signals for module stage2
  signal stage2_call_reqs: std_logic_vector(0 downto 0);
  signal stage2_call_acks: std_logic_vector(0 downto 0);
  signal stage2_return_reqs: std_logic_vector(0 downto 0);
  signal stage2_return_acks: std_logic_vector(0 downto 0);
  signal stage2_call_data: std_logic_vector(7 downto 0);
  signal stage2_call_tag: std_logic_vector(0 downto 0);
  signal stage2_return_data: std_logic_vector(0 downto 0);
  signal stage2_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module top
  component top is -- 
    port ( -- 
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      stage1_call_reqs : out  std_logic_vector(0 downto 0);
      stage1_call_acks : in   std_logic_vector(0 downto 0);
      stage1_call_data : out  std_logic_vector(7 downto 0);
      stage1_call_tag  :  out  std_logic_vector(0 downto 0);
      stage1_return_reqs : out  std_logic_vector(0 downto 0);
      stage1_return_acks : in   std_logic_vector(0 downto 0);
      stage1_return_data : in   std_logic_vector(0 downto 0);
      stage1_return_tag :  in   std_logic_vector(0 downto 0);
      stage2_call_reqs : out  std_logic_vector(0 downto 0);
      stage2_call_acks : in   std_logic_vector(0 downto 0);
      stage2_call_data : out  std_logic_vector(7 downto 0);
      stage2_call_tag  :  out  std_logic_vector(0 downto 0);
      stage2_return_reqs : out  std_logic_vector(0 downto 0);
      stage2_return_acks : in   std_logic_vector(0 downto 0);
      stage2_return_data : in   std_logic_vector(0 downto 0);
      stage2_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- the pipe itself. inpipe
  signal inpipe_pipe_data: std_logic_vector(7 downto 0);
  signal inpipe_pipe_req: std_logic;
  signal inpipe_pipe_ack: std_logic;
  -- aggregate signals for write to pipe midpipe
  signal midpipe_pipe_write_data: std_logic_vector(7 downto 0);
  signal midpipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal midpipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe midpipe
  signal midpipe_pipe_read_data: std_logic_vector(7 downto 0);
  signal midpipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal midpipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- the pipe itself. midpipe
  signal midpipe_pipe_data: std_logic_vector(7 downto 0);
  signal midpipe_pipe_req: std_logic;
  signal midpipe_pipe_ack: std_logic;
  -- aggregate signals for write to pipe outpipe
  signal outpipe_pipe_write_data: std_logic_vector(7 downto 0);
  signal outpipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal outpipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- the pipe itself. outpipe
  signal outpipe_pipe_data: std_logic_vector(7 downto 0);
  signal outpipe_pipe_req: std_logic;
  signal outpipe_pipe_ack: std_logic;
  -- 
begin -- 
  -- module add
  add_a <= add_in_args(15 downto 8);
  add_b <= add_in_args(7 downto 0);
  add_out_args <= add_c ;
  -- call arbiter for module add
  add_arbiter: CallArbiterUnitary -- 
    generic map( --
      num_reqs => 2,
      call_data_width => 16,
      return_data_width => 8,
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
  -- module stage1
  stage1_a <= stage1_in_args(7 downto 0);
  stage1_out_args <= stage1_ret ;
  -- call arbiter for module stage1
  stage1_arbiter: CallArbiterUnitary -- 
    generic map( --
      num_reqs => 1,
      call_data_width => 8,
      return_data_width => 1,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => stage1_call_reqs,
      call_acks => stage1_call_acks,
      return_reqs => stage1_return_reqs,
      return_acks => stage1_return_acks,
      call_data  => stage1_call_data,
      call_tag  => stage1_call_tag,
      return_tag  => stage1_return_tag,
      call_in_tag => stage1_tag_in,
      call_out_tag => stage1_tag_out,
      return_data =>stage1_return_data,
      call_start => stage1_start,
      call_fin => stage1_fin,
      call_in_args => stage1_in_args,
      call_out_args => stage1_out_args,
      clk => clk, 
      reset => reset --
    ); --
  stage1_instance:stage1-- 
    port map(-- 
      a => stage1_a,
      ret => stage1_ret,
      start => stage1_start,
      fin => stage1_fin,
      clk => clk,
      reset => reset,
      global_sr_req => global_sr_req(0 downto 0),
      global_sr_ack => global_sr_ack(0 downto 0),
      global_sr_addr => global_sr_addr(3 downto 0),
      global_sr_data => global_sr_data(7 downto 0),
      global_sr_tag => global_sr_tag(0 downto 0),
      global_sc_req => global_sc_req(0 downto 0),
      global_sc_ack => global_sc_ack(0 downto 0),
      global_sc_tag => global_sc_tag(0 downto 0),
      midpipe_pipe_write_req => midpipe_pipe_write_req(0 downto 0),
      midpipe_pipe_write_ack => midpipe_pipe_write_ack(0 downto 0),
      midpipe_pipe_write_data => midpipe_pipe_write_data(7 downto 0),
      add_call_reqs => add_call_reqs(1 downto 1),
      add_call_acks => add_call_acks(1 downto 1),
      add_call_data => add_call_data(31 downto 16),
      add_call_tag => add_call_tag(1 downto 1),
      add_return_reqs => add_return_reqs(1 downto 1),
      add_return_acks => add_return_acks(1 downto 1),
      add_return_data => add_return_data(15 downto 8),
      add_return_tag => add_return_tag(1 downto 1),
      tag_in => stage1_tag_in,
      tag_out => stage1_tag_out-- 
    ); -- 
  -- module stage2
  stage2_a <= stage2_in_args(7 downto 0);
  stage2_out_args <= stage2_ret ;
  -- call arbiter for module stage2
  stage2_arbiter: CallArbiterUnitary -- 
    generic map( --
      num_reqs => 1,
      call_data_width => 8,
      return_data_width => 1,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => stage2_call_reqs,
      call_acks => stage2_call_acks,
      return_reqs => stage2_return_reqs,
      return_acks => stage2_return_acks,
      call_data  => stage2_call_data,
      call_tag  => stage2_call_tag,
      return_tag  => stage2_return_tag,
      call_in_tag => stage2_tag_in,
      call_out_tag => stage2_tag_out,
      return_data =>stage2_return_data,
      call_start => stage2_start,
      call_fin => stage2_fin,
      call_in_args => stage2_in_args,
      call_out_args => stage2_out_args,
      clk => clk, 
      reset => reset --
    ); --
  stage2_instance:stage2-- 
    port map(-- 
      a => stage2_a,
      ret => stage2_ret,
      start => stage2_start,
      fin => stage2_fin,
      clk => clk,
      reset => reset,
      global_lr_req => global_lr_req(0 downto 0),
      global_lr_ack => global_lr_ack(0 downto 0),
      global_lr_addr => global_lr_addr(3 downto 0),
      global_lr_tag => global_lr_tag(0 downto 0),
      global_lc_req => global_lc_req(0 downto 0),
      global_lc_ack => global_lc_ack(0 downto 0),
      global_lc_data => global_lc_data(7 downto 0),
      global_lc_tag => global_lc_tag(0 downto 0),
      midpipe_pipe_read_req => midpipe_pipe_write_req(0 downto 0),
      midpipe_pipe_read_ack => midpipe_pipe_read_ack(0 downto 0),
      midpipe_pipe_read_data => midpipe_pipe_read_data(7 downto 0),
      outpipe_pipe_write_req => outpipe_pipe_write_req(0 downto 0),
      outpipe_pipe_write_ack => outpipe_pipe_write_ack(0 downto 0),
      outpipe_pipe_write_data => outpipe_pipe_write_data(7 downto 0),
      add_call_reqs => add_call_reqs(0 downto 0),
      add_call_acks => add_call_acks(0 downto 0),
      add_call_data => add_call_data(15 downto 0),
      add_call_tag => add_call_tag(0 downto 0),
      add_return_reqs => add_return_reqs(0 downto 0),
      add_return_acks => add_return_acks(0 downto 0),
      add_return_data => add_return_data(7 downto 0),
      add_return_tag => add_return_tag(0 downto 0),
      tag_in => stage2_tag_in,
      tag_out => stage2_tag_out-- 
    ); -- 
  -- module top
  top_instance:top-- 
    port map(-- 
      start => top_start,
      fin => top_fin,
      clk => clk,
      reset => reset,
      stage1_call_reqs => stage1_call_reqs(0 downto 0),
      stage1_call_acks => stage1_call_acks(0 downto 0),
      stage1_call_data => stage1_call_data(7 downto 0),
      stage1_call_tag => stage1_call_tag(0 downto 0),
      stage1_return_reqs => stage1_return_reqs(0 downto 0),
      stage1_return_acks => stage1_return_acks(0 downto 0),
      stage1_return_data => stage1_return_data(0 downto 0),
      stage1_return_tag => stage1_return_tag(0 downto 0),
      stage2_call_reqs => stage2_call_reqs(0 downto 0),
      stage2_call_acks => stage2_call_acks(0 downto 0),
      stage2_call_data => stage2_call_data(7 downto 0),
      stage2_call_tag => stage2_call_tag(0 downto 0),
      stage2_return_reqs => stage2_return_reqs(0 downto 0),
      stage2_return_acks => stage2_return_acks(0 downto 0),
      stage2_return_data => stage2_return_data(0 downto 0),
      stage2_return_tag => stage2_return_tag(0 downto 0),
      tag_in => top_tag_in,
      tag_out => top_tag_out-- 
    ); -- 
  midpipe_ReadMux: InputPortLevel -- 
    generic map( -- 
      num_reqs => 1,
      data_width => 8,
      no_arbitration => false -- 
    )
    port map( -- 
      req => midpipe_pipe_read_req,
      ack => midpipe_pipe_read_ack,
      data => midpipe_pipe_write_data,
      oreq => midpipe_pipe_ack, -- cross-over
      oack => midpipe_pipe_req, -- cross-over
      odata => midpipe_pipe_data,
      clk => clk,reset => reset -- 
    ); -- 
  midpipe_WriteMux: OutputPortLevel -- 
    generic map( -- 
      num_reqs => 1,
      data_width => 8,
      no_arbitration => false -- 
    )
    port map( -- 
      req => midpipe_pipe_write_req,
      ack => midpipe_pipe_write_ack,
      data => midpipe_pipe_write_data,
      oreq => midpipe_pipe_req, -- no cross-over
      oack => midpipe_pipe_ack, -- no cross-over
      odata => midpipe_pipe_data,
      clk => clk,reset => reset -- 
    ); -- 
  outpipe_WriteMux: OutputPortLevel -- 
    generic map( -- 
      num_reqs => 1,
      data_width => 8,
      no_arbitration => false -- 
    )
    port map( -- 
      req => outpipe_pipe_write_req,
      ack => outpipe_pipe_write_ack,
      data => outpipe_pipe_write_data,
      oreq => outpipe_pipe_req, -- no cross-over
      oack => outpipe_pipe_ack, -- no cross-over
      odata => outpipe_pipe_data,
      clk => clk,reset => reset -- 
    ); -- 
  outpipe_pipe_read_data <= outpipe_pipe_data;
  outpipe_pipe_ack <= outpipe_pipe_read_req; -- cross-over
  outpipe_pipe_read_ack <= outpipe_pipe_req; -- cross-over
  MemorySpace_global: memory_subsystem -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 4,
      data_width => 8,
      tag_width => 1,
      number_of_banks => 1,mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 10,
      base_bank_data_width => 1) -- 
    port map(-- 
      lr_addr_in => global_lr_addr,
      lr_req_in => global_lr_req,
      lr_ack_out => global_lr_ack,
      lr_tag_in => global_lr_tag,
      lc_req_in => global_lc_req,
      lc_ack_out => global_lc_ack,
      lc_data_out => global_lc_data,
      lc_tag_out => global_lc_tag,
      sr_addr_in => global_sr_addr,
      sr_data_in => global_sr_data,
      sr_req_in => global_sr_req,
      sr_ack_out => global_sr_ack,
      sr_tag_in => global_sr_tag,
      sc_req_in=> global_sc_req,
      sc_ack_out => global_sc_ack,
      sc_tag_out => global_sc_tag,
      clock => clk,
      reset => reset); -- 
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
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      top_tag_in: in std_logic_vector(0 downto 0);
      top_tag_out: out std_logic_vector(0 downto 0);
      top_start : in std_logic;
      top_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic;
      outpipe_pipe_read_data: out std_logic_vector(7 downto 0);
      outpipe_pipe_read_req : in std_logic;
      outpipe_pipe_read_ack : out std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal top_tag_in: std_logic_vector(0 downto 0);
  signal top_tag_out: std_logic_vector(0 downto 0);
  signal top_start : std_logic;
  signal top_fin   : std_logic;
  -- read from pipe outpipe
  signal outpipe_pipe_read_data: std_logic_vector(7 downto 0);
  signal outpipe_pipe_read_req : std_logic := '0';
  signal outpipe_pipe_read_ack : std_logic;
  -- 
begin --
  test_system_instance: test_system -- 
    port map ( -- 
      top_tag_in => top_tag_in,
      top_tag_out => top_tag_out,
      top_start => top_start,
      top_fin  => top_fin ,
      clk => clk,
      reset => reset,
      outpipe_pipe_read_data  => outpipe_pipe_read_data, 
      outpipe_pipe_read_req  => outpipe_pipe_read_req, 
      outpipe_pipe_read_ack  => outpipe_pipe_read_ack ); -- 
  -- 
end Default;
