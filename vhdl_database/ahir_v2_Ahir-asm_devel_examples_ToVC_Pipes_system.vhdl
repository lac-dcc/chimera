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
    b : out  std_logic_vector(9 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    buffer_pipe_read_req : out  std_logic_vector(0 downto 0);
    buffer_pipe_read_ack : in   std_logic_vector(0 downto 0);
    buffer_pipe_read_data : in   std_logic_vector(9 downto 0);
    inpipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    inpipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    inpipe_pipe_read_data : in   std_logic_vector(9 downto 0);
    buffer_pipe_write_req : out  std_logic_vector(0 downto 0);
    buffer_pipe_write_ack : in   std_logic_vector(0 downto 0);
    buffer_pipe_write_data : out  std_logic_vector(9 downto 0);
    outpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    outpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    outpipe_pipe_write_data : out  std_logic_vector(9 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity sum_mod;
architecture Default of sum_mod is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal assign_stmt_11Xbinary_10Xca_dp_to_cp : boolean;
  signal assign_stmt_11Xsimple_obj_ref_7Xpipe_wreq_cp_to_dp : boolean;
  signal assign_stmt_11Xsimple_obj_ref_7Xpipe_wack_dp_to_cp : boolean;
  signal assign_stmt_14Xsimple_obj_ref_13Xreq_cp_to_dp : boolean;
  signal assign_stmt_11Xbinary_10Xbinary_10_inputsXsimple_obj_ref_9Xreq_cp_to_dp : boolean;
  signal assign_stmt_11Xbinary_10Xbinary_10_inputsXsimple_obj_ref_9Xack_dp_to_cp : boolean;
  signal assign_stmt_17Xack_dp_to_cp : boolean;
  signal assign_stmt_11Xbinary_10Xrr_cp_to_dp : boolean;
  signal assign_stmt_11Xbinary_10Xra_dp_to_cp : boolean;
  signal assign_stmt_11Xbinary_10Xcr_cp_to_dp : boolean;
  signal assign_stmt_20Xsimple_obj_ref_18Xpipe_wreq_cp_to_dp : boolean;
  signal assign_stmt_20Xsimple_obj_ref_18Xpipe_wack_dp_to_cp : boolean;
  signal assign_stmt_14Xsimple_obj_ref_13Xack_dp_to_cp : boolean;
  signal assign_stmt_17Xreq_cp_to_dp : boolean;
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
    signal cp_26_symbol : Boolean;
    signal cp_34_symbol : Boolean;
    signal cp_39_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- assign_stmt_11 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      signal cp_21_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition assign_stmt_11/$entry
      cp_6: Block -- assign_stmt_11/binary_10 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        signal cp_17_symbol : Boolean;
        signal cp_18_symbol : Boolean;
        signal cp_19_symbol : Boolean;
        signal cp_20_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition assign_stmt_11/binary_10/$entry
        cp_9: Block -- assign_stmt_11/binary_10/binary_10_inputs 
          signal cp_9_start: Boolean;
          signal cp_10_symbol: Boolean;
          signal cp_11_symbol: Boolean;
          signal cp_12_symbol : Boolean;
          -- 
        begin -- 
          cp_9_start <= cp_7_symbol; -- control passed to block
          cp_10_symbol  <= cp_9_start; -- transition assign_stmt_11/binary_10/binary_10_inputs/$entry
          cp_12: Block -- assign_stmt_11/binary_10/binary_10_inputs/simple_obj_ref_9 
            signal cp_12_start: Boolean;
            signal cp_13_symbol: Boolean;
            signal cp_14_symbol: Boolean;
            signal cp_15_symbol : Boolean;
            signal cp_16_symbol : Boolean;
            -- 
          begin -- 
            cp_12_start <= cp_10_symbol; -- control passed to block
            cp_13_symbol  <= cp_12_start; -- transition assign_stmt_11/binary_10/binary_10_inputs/simple_obj_ref_9/$entry
            cp_15_symbol <= cp_13_symbol; -- transition assign_stmt_11/binary_10/binary_10_inputs/simple_obj_ref_9/req
            assign_stmt_11Xbinary_10Xbinary_10_inputsXsimple_obj_ref_9Xreq_cp_to_dp <= cp_15_symbol; -- link to DP
            cp_16_symbol <= assign_stmt_11Xbinary_10Xbinary_10_inputsXsimple_obj_ref_9Xack_dp_to_cp; -- transition assign_stmt_11/binary_10/binary_10_inputs/simple_obj_ref_9/ack
            cp_14_symbol <= cp_16_symbol; -- transition assign_stmt_11/binary_10/binary_10_inputs/simple_obj_ref_9/$exit
            cp_12_symbol <= cp_14_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_11/binary_10/binary_10_inputs/simple_obj_ref_9
          cp_11_symbol <= cp_12_symbol; -- transition assign_stmt_11/binary_10/binary_10_inputs/$exit
          cp_9_symbol <= cp_11_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_11/binary_10/binary_10_inputs
        cp_17_symbol <= cp_9_symbol; -- transition assign_stmt_11/binary_10/rr
        assign_stmt_11Xbinary_10Xrr_cp_to_dp <= cp_17_symbol; -- link to DP
        cp_18_symbol <= assign_stmt_11Xbinary_10Xra_dp_to_cp; -- transition assign_stmt_11/binary_10/ra
        cp_19_symbol <= cp_18_symbol; -- transition assign_stmt_11/binary_10/cr
        assign_stmt_11Xbinary_10Xcr_cp_to_dp <= cp_19_symbol; -- link to DP
        cp_20_symbol <= assign_stmt_11Xbinary_10Xca_dp_to_cp; -- transition assign_stmt_11/binary_10/ca
        cp_8_symbol <= cp_20_symbol; -- transition assign_stmt_11/binary_10/$exit
        cp_6_symbol <= cp_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_11/binary_10
      cp_21: Block -- assign_stmt_11/simple_obj_ref_7 
        signal cp_21_start: Boolean;
        signal cp_22_symbol: Boolean;
        signal cp_23_symbol: Boolean;
        signal cp_24_symbol : Boolean;
        signal cp_25_symbol : Boolean;
        -- 
      begin -- 
        cp_21_start <= cp_6_symbol; -- control passed to block
        cp_22_symbol  <= cp_21_start; -- transition assign_stmt_11/simple_obj_ref_7/$entry
        cp_24_symbol <= cp_22_symbol; -- transition assign_stmt_11/simple_obj_ref_7/pipe_wreq
        assign_stmt_11Xsimple_obj_ref_7Xpipe_wreq_cp_to_dp <= cp_24_symbol; -- link to DP
        cp_25_symbol <= assign_stmt_11Xsimple_obj_ref_7Xpipe_wack_dp_to_cp; -- transition assign_stmt_11/simple_obj_ref_7/pipe_wack
        cp_23_symbol <= cp_25_symbol; -- transition assign_stmt_11/simple_obj_ref_7/$exit
        cp_21_symbol <= cp_23_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_11/simple_obj_ref_7
      cp_5_symbol <= cp_21_symbol; -- transition assign_stmt_11/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_11
    cp_26: Block -- assign_stmt_14 
      signal cp_26_start: Boolean;
      signal cp_27_symbol: Boolean;
      signal cp_28_symbol: Boolean;
      signal cp_29_symbol : Boolean;
      -- 
    begin -- 
      cp_26_start <= cp_3_symbol; -- control passed to block
      cp_27_symbol  <= cp_26_start; -- transition assign_stmt_14/$entry
      cp_29: Block -- assign_stmt_14/simple_obj_ref_13 
        signal cp_29_start: Boolean;
        signal cp_30_symbol: Boolean;
        signal cp_31_symbol: Boolean;
        signal cp_32_symbol : Boolean;
        signal cp_33_symbol : Boolean;
        -- 
      begin -- 
        cp_29_start <= cp_27_symbol; -- control passed to block
        cp_30_symbol  <= cp_29_start; -- transition assign_stmt_14/simple_obj_ref_13/$entry
        cp_32_symbol <= cp_30_symbol; -- transition assign_stmt_14/simple_obj_ref_13/req
        assign_stmt_14Xsimple_obj_ref_13Xreq_cp_to_dp <= cp_32_symbol; -- link to DP
        cp_33_symbol <= assign_stmt_14Xsimple_obj_ref_13Xack_dp_to_cp; -- transition assign_stmt_14/simple_obj_ref_13/ack
        cp_31_symbol <= cp_33_symbol; -- transition assign_stmt_14/simple_obj_ref_13/$exit
        cp_29_symbol <= cp_31_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_14/simple_obj_ref_13
      cp_28_symbol <= cp_29_symbol; -- transition assign_stmt_14/$exit
      cp_26_symbol <= cp_28_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_14
    cp_34: Block -- assign_stmt_17 
      signal cp_34_start: Boolean;
      signal cp_35_symbol: Boolean;
      signal cp_36_symbol: Boolean;
      signal cp_37_symbol : Boolean;
      signal cp_38_symbol : Boolean;
      -- 
    begin -- 
      cp_34_start <= cp_26_symbol; -- control passed to block
      cp_35_symbol  <= cp_34_start; -- transition assign_stmt_17/$entry
      cp_37_symbol <= cp_35_symbol; -- transition assign_stmt_17/req
      assign_stmt_17Xreq_cp_to_dp <= cp_37_symbol; -- link to DP
      cp_38_symbol <= assign_stmt_17Xack_dp_to_cp; -- transition assign_stmt_17/ack
      cp_36_symbol <= cp_38_symbol; -- transition assign_stmt_17/$exit
      cp_34_symbol <= cp_36_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_17
    cp_39: Block -- assign_stmt_20 
      signal cp_39_start: Boolean;
      signal cp_40_symbol: Boolean;
      signal cp_41_symbol: Boolean;
      signal cp_42_symbol : Boolean;
      -- 
    begin -- 
      cp_39_start <= cp_34_symbol; -- control passed to block
      cp_40_symbol  <= cp_39_start; -- transition assign_stmt_20/$entry
      cp_42: Block -- assign_stmt_20/simple_obj_ref_18 
        signal cp_42_start: Boolean;
        signal cp_43_symbol: Boolean;
        signal cp_44_symbol: Boolean;
        signal cp_45_symbol : Boolean;
        signal cp_46_symbol : Boolean;
        -- 
      begin -- 
        cp_42_start <= cp_40_symbol; -- control passed to block
        cp_43_symbol  <= cp_42_start; -- transition assign_stmt_20/simple_obj_ref_18/$entry
        cp_45_symbol <= cp_43_symbol; -- transition assign_stmt_20/simple_obj_ref_18/pipe_wreq
        assign_stmt_20Xsimple_obj_ref_18Xpipe_wreq_cp_to_dp <= cp_45_symbol; -- link to DP
        cp_46_symbol <= assign_stmt_20Xsimple_obj_ref_18Xpipe_wack_dp_to_cp; -- transition assign_stmt_20/simple_obj_ref_18/pipe_wack
        cp_44_symbol <= cp_46_symbol; -- transition assign_stmt_20/simple_obj_ref_18/$exit
        cp_42_symbol <= cp_44_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_20/simple_obj_ref_18
      cp_41_symbol <= cp_42_symbol; -- transition assign_stmt_20/$exit
      cp_39_symbol <= cp_41_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_20
    cp_2_symbol <= cp_39_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal binary_10_wire : std_logic_vector(9 downto 0);
    signal simple_obj_ref_9_wire : std_logic_vector(9 downto 0);
    signal t_14 : std_logic_vector(9 downto 0);
    -- 
  begin -- 
    simple_obj_ref_15_inst: RegisterBase generic map(data_width => 10) -- 
      port map( din => t_14, dout => b, req => assign_stmt_17Xreq_cp_to_dp, ack => assign_stmt_17Xack_dp_to_cp, clk => clk, reset => reset); -- 
    -- shared split operator group (0) : binary_10_inst 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(19 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_11Xbinary_10Xrr_cp_to_dp;
      assign_stmt_11Xbinary_10Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_11Xbinary_10Xcr_cp_to_dp;
      assign_stmt_11Xbinary_10Xca_dp_to_cp <= ackR(0);
      data_in <= a & simple_obj_ref_9_wire;
      binary_10_wire <= data_out(9 downto 0);
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
    -- shared inport operator group (0) : simple_obj_ref_13_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= assign_stmt_14Xsimple_obj_ref_13Xreq_cp_to_dp;
      assign_stmt_14Xsimple_obj_ref_13Xack_dp_to_cp <= ack(0);
      t_14 <= data_out(9 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => buffer_pipe_read_req(0),
          oack => buffer_pipe_read_ack(0),
          odata => buffer_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared inport operator group (1) : simple_obj_ref_9_inst 
    InportGroup1: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= assign_stmt_11Xbinary_10Xbinary_10_inputsXsimple_obj_ref_9Xreq_cp_to_dp;
      assign_stmt_11Xbinary_10Xbinary_10_inputsXsimple_obj_ref_9Xack_dp_to_cp <= ack(0);
      simple_obj_ref_9_wire <= data_out(9 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => inpipe_pipe_read_req(0),
          oack => inpipe_pipe_read_ack(0),
          odata => inpipe_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared outport operator group (0) : simple_obj_ref_18_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= assign_stmt_20Xsimple_obj_ref_18Xpipe_wreq_cp_to_dp;
      assign_stmt_20Xsimple_obj_ref_18Xpipe_wack_dp_to_cp <= ack(0);
      data_in <= t_14;
      outport: OutputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => outpipe_pipe_write_req(0),
          oack => outpipe_pipe_write_ack(0),
          odata => outpipe_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : simple_obj_ref_7_inst 
    OutportGroup1: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= assign_stmt_11Xsimple_obj_ref_7Xpipe_wreq_cp_to_dp;
      assign_stmt_11Xsimple_obj_ref_7Xpipe_wack_dp_to_cp <= ack(0);
      data_in <= binary_10_wire;
      outport: OutputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => buffer_pipe_write_req(0),
          oack => buffer_pipe_write_ack(0),
          odata => buffer_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
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
    sum_mod_b : out  std_logic_vector(9 downto 0);
    sum_mod_tag_in: in std_logic_vector(0 downto 0);
    sum_mod_tag_out: out std_logic_vector(0 downto 0);
    sum_mod_start : in std_logic;
    sum_mod_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic;
    inpipe_pipe_write_data: in std_logic_vector(9 downto 0);
    inpipe_pipe_write_req : in std_logic_vector(0 downto 0);
    inpipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    outpipe_pipe_read_data: out std_logic_vector(9 downto 0);
    outpipe_pipe_read_req : in std_logic_vector(0 downto 0);
    outpipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module sum_mod
  component sum_mod is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : out  std_logic_vector(9 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      buffer_pipe_read_req : out  std_logic_vector(0 downto 0);
      buffer_pipe_read_ack : in   std_logic_vector(0 downto 0);
      buffer_pipe_read_data : in   std_logic_vector(9 downto 0);
      inpipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      inpipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      inpipe_pipe_read_data : in   std_logic_vector(9 downto 0);
      buffer_pipe_write_req : out  std_logic_vector(0 downto 0);
      buffer_pipe_write_ack : in   std_logic_vector(0 downto 0);
      buffer_pipe_write_data : out  std_logic_vector(9 downto 0);
      outpipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      outpipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      outpipe_pipe_write_data : out  std_logic_vector(9 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- aggregate signals for write to pipe buffer
  signal buffer_pipe_write_data: std_logic_vector(9 downto 0);
  signal buffer_pipe_write_req: std_logic_vector(0 downto 0);
  signal buffer_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe buffer
  signal buffer_pipe_read_data: std_logic_vector(9 downto 0);
  signal buffer_pipe_read_req: std_logic_vector(0 downto 0);
  signal buffer_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe inpipe
  signal inpipe_pipe_read_data: std_logic_vector(9 downto 0);
  signal inpipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal inpipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe outpipe
  signal outpipe_pipe_write_data: std_logic_vector(9 downto 0);
  signal outpipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal outpipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module sum_mod
  sum_mod_instance:sum_mod-- 
    port map(-- 
      a => sum_mod_a,
      b => sum_mod_b,
      start => sum_mod_start,
      fin => sum_mod_fin,
      clk => clk,
      reset => reset,
      buffer_pipe_read_req => buffer_pipe_read_req(0 downto 0),
      buffer_pipe_read_ack => buffer_pipe_read_ack(0 downto 0),
      buffer_pipe_read_data => buffer_pipe_read_data(9 downto 0),
      inpipe_pipe_read_req => inpipe_pipe_read_req(0 downto 0),
      inpipe_pipe_read_ack => inpipe_pipe_read_ack(0 downto 0),
      inpipe_pipe_read_data => inpipe_pipe_read_data(9 downto 0),
      buffer_pipe_write_req => buffer_pipe_write_req(0 downto 0),
      buffer_pipe_write_ack => buffer_pipe_write_ack(0 downto 0),
      buffer_pipe_write_data => buffer_pipe_write_data(9 downto 0),
      outpipe_pipe_write_req => outpipe_pipe_write_req(0 downto 0),
      outpipe_pipe_write_ack => outpipe_pipe_write_ack(0 downto 0),
      outpipe_pipe_write_data => outpipe_pipe_write_data(9 downto 0),
      tag_in => sum_mod_tag_in,
      tag_out => sum_mod_tag_out-- 
    ); -- 
  buffer_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => buffer_pipe_read_req,
      read_ack => buffer_pipe_read_ack,
      read_data => buffer_pipe_read_data,
      write_req => buffer_pipe_write_req,
      write_ack => buffer_pipe_write_ack,
      write_data => buffer_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  inpipe_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => inpipe_pipe_read_req,
      read_ack => inpipe_pipe_read_ack,
      read_data => inpipe_pipe_read_data,
      write_req => inpipe_pipe_write_req,
      write_ack => inpipe_pipe_write_ack,
      write_data => inpipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  outpipe_Pipe: PipeBase -- 
    generic map( -- 
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      depth => 1 --
    )
    port map( -- 
      read_req => outpipe_pipe_read_req,
      read_ack => outpipe_pipe_read_ack,
      read_data => outpipe_pipe_read_data,
      write_req => outpipe_pipe_write_req,
      write_ack => outpipe_pipe_write_ack,
      write_data => outpipe_pipe_write_data,
      clk => clk,reset => reset -- 
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
      sum_mod_b : out  std_logic_vector(9 downto 0);
      sum_mod_tag_in: in std_logic_vector(0 downto 0);
      sum_mod_tag_out: out std_logic_vector(0 downto 0);
      sum_mod_start : in std_logic;
      sum_mod_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic;
      inpipe_pipe_write_data: in std_logic_vector(9 downto 0);
      inpipe_pipe_write_req : in std_logic_vector(0 downto 0);
      inpipe_pipe_write_ack : out std_logic_vector(0 downto 0);
      outpipe_pipe_read_data: out std_logic_vector(9 downto 0);
      outpipe_pipe_read_req : in std_logic_vector(0 downto 0);
      outpipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal sum_mod_a :  std_logic_vector(9 downto 0);
  signal sum_mod_b :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- write to pipe inpipe
  signal inpipe_pipe_write_data: std_logic_vector(9 downto 0);
  signal inpipe_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal inpipe_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe outpipe
  signal outpipe_pipe_read_data: std_logic_vector(9 downto 0);
  signal outpipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal outpipe_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --

  clk <= not clk after 5 ns;
  sum_mod_a <= (8 => '1', 0 => '1', others => '0');
  inpipe_pipe_write_data <= sum_mod_a;
  inpipe_pipe_write_req <= (others => '1');
  outpipe_pipe_read_Req <= (others => '1');

  process
  begin
	wait until clk = '1';
	reset <= '0'; 
	sum_mod_start <= '1';
	wait until clk = '1';
	sum_mod_start <= '0';
	while sum_mod_fin /= '0' loop
		wait until clk = '1';
	end loop;
  	wait;
  end process;

  test_system_instance: test_system -- 
    port map ( -- 
      sum_mod_a => sum_mod_a,
      sum_mod_b => sum_mod_b,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset,
      inpipe_pipe_write_data  => inpipe_pipe_write_data, 
      inpipe_pipe_write_req  => inpipe_pipe_write_req, 
      inpipe_pipe_write_ack  => inpipe_pipe_write_ack,
      outpipe_pipe_read_data  => outpipe_pipe_read_data, 
      outpipe_pipe_read_req  => outpipe_pipe_read_req, 
      outpipe_pipe_read_ack  => outpipe_pipe_read_ack ); -- 
  -- 
end Default;
