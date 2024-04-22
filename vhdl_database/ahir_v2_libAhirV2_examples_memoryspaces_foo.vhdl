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
    a : in  std_logic_vector(9 downto 0);
    b : in  std_logic_vector(9 downto 0);
    clock : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    global_lr_req : out  std_logic_vector(0 downto 0);
    global_lr_ack : in   std_logic_vector(0 downto 0);
    global_lr_addr : out  std_logic_vector(9 downto 0);
    global_lr_tag :  out  std_logic_vector(0 downto 0);
    global_lc_req : out  std_logic_vector(0 downto 0);
    global_lc_ack : in   std_logic_vector(0 downto 0);
    global_lc_data : in   std_logic_vector(7 downto 0);
    global_lc_tag :  in  std_logic_vector(0 downto 0);
    global_sr_req : out  std_logic_vector(0 downto 0);
    global_sr_ack : in   std_logic_vector(0 downto 0);
    global_sr_addr : out  std_logic_vector(9 downto 0);
    global_sr_data : out  std_logic_vector(7 downto 0);
    global_sr_tag :  out  std_logic_vector(0 downto 0);
    global_sc_req : out  std_logic_vector(0 downto 0);
    global_sc_ack : in   std_logic_vector(0 downto 0);
    global_sc_tag :  in  std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity foo;
architecture Default of foo is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal mainXr1_dp_to_cp : boolean;
  signal mainXr7_dp_to_cp : boolean;
  signal mainXa7_cp_to_dp : boolean;
  signal mainXr8_dp_to_cp : boolean;
  signal mainXa8_cp_to_dp : boolean;
  signal mainXa1_cp_to_dp : boolean;
  signal mainXr2_dp_to_cp : boolean;
  signal mainXa2_cp_to_dp : boolean;
  signal mainXr3_dp_to_cp : boolean;
  signal mainXa3_cp_to_dp : boolean;
  signal mainXr4_dp_to_cp : boolean;
  signal mainXa4_cp_to_dp : boolean;
  signal mainXr5_dp_to_cp : boolean;
  signal mainXa5_cp_to_dp : boolean;
  signal mainXr6_dp_to_cp : boolean;
  signal mainXa6_cp_to_dp : boolean;
  signal local_lr_req :  std_logic_vector(0 downto 0);
  signal local_lr_ack : std_logic_vector(0 downto 0);
  signal local_lr_addr : std_logic_vector(3 downto 0);
  signal local_lr_tag : std_logic_vector(0 downto 0);
  signal local_lc_req : std_logic_vector(0 downto 0);
  signal local_lc_ack :  std_logic_vector(0 downto 0);
  signal local_lc_data : std_logic_vector(7 downto 0);
  signal local_lc_tag :  std_logic_vector(0 downto 0);
  signal local_sr_req :  std_logic_vector(0 downto 0);
  signal local_sr_ack : std_logic_vector(0 downto 0);
  signal local_sr_addr : std_logic_vector(3 downto 0);
  signal local_sr_data : std_logic_vector(7 downto 0);
  signal local_sr_tag : std_logic_vector(0 downto 0);
  signal local_sc_req : std_logic_vector(0 downto 0);
  signal local_sc_ack :  std_logic_vector(0 downto 0);
  signal local_sc_tag :  std_logic_vector(0 downto 0);
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
      signal cp_10_symbol : Boolean;
      signal cp_11_symbol : Boolean;
      signal cp_12_symbol : Boolean;
      signal cp_13_symbol : Boolean;
      signal cp_14_symbol : Boolean;
      signal cp_15_symbol : Boolean;
      signal cp_16_symbol : Boolean;
      signal cp_17_symbol : Boolean;
      signal cp_18_symbol : Boolean;
      signal cp_19_symbol : Boolean;
      signal cp_20_symbol : Boolean;
      signal cp_21_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition main/$entry
      cp_6_symbol <= cp_4_symbol; -- transition main/r1
      mainXr1_cp_to_dp <= cp_6_symbol; -- link to DP
      cp_7_symbol <= mainXa1_dp_to_cp; -- transition main/a1
      cp_8_symbol <= cp_7_symbol; -- transition main/r2
      mainXr2_cp_to_dp <= cp_8_symbol; -- link to DP
      cp_9_symbol <= mainXa2_dp_to_cp; -- transition main/a2
      cp_10_symbol <= cp_9_symbol; -- transition main/r3
      mainXr3_cp_to_dp <= cp_10_symbol; -- link to DP
      cp_11_symbol <= mainXa3_dp_to_cp; -- transition main/a3
      cp_12_symbol <= cp_11_symbol; -- transition main/r4
      mainXr4_cp_to_dp <= cp_12_symbol; -- link to DP
      cp_13_symbol <= mainXa4_dp_to_cp; -- transition main/a4
      cp_14_symbol <= cp_13_symbol; -- transition main/r5
      mainXr5_cp_to_dp <= cp_14_symbol; -- link to DP
      cp_15_symbol <= mainXa5_dp_to_cp; -- transition main/a5
      cp_16_symbol <= cp_15_symbol; -- transition main/r6
      mainXr6_cp_to_dp <= cp_16_symbol; -- link to DP
      cp_17_symbol <= mainXa6_dp_to_cp; -- transition main/a6
      cp_18_symbol <= cp_17_symbol; -- transition main/r7
      mainXr7_cp_to_dp <= cp_18_symbol; -- link to DP
      cp_19_symbol <= mainXa7_dp_to_cp; -- transition main/a7
      cp_20_symbol <= cp_19_symbol; -- transition main/r8
      mainXr8_cp_to_dp <= cp_20_symbol; -- link to DP
      cp_21_symbol <= mainXa8_dp_to_cp; -- transition main/a8
      cp_5_symbol <= cp_21_symbol; -- transition main/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- main
    cp_2_symbol <= cp_3_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal d1 : std_logic_vector (7 downto 0);
    signal d2 : std_logic_vector (7 downto 0);
    signal d3 : std_logic_vector (7 downto 0);
    signal d4 : std_logic_vector (7 downto 0);
    signal lp : std_logic_vector (3 downto 0);
    -- 
  begin -- 
    lp <= "0101";
    -- shared load operator group (0) : RfromG 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXr1_cp_to_dp;
      mainXa1_dp_to_cp <= ackL(0);
      reqR(0) <= mainXr2_cp_to_dp;
      mainXa2_dp_to_cp <= ackR(0);
      data_in <= a;
      d1 <= data_out(7 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 10,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => global_lr_req(0),
          mack => global_lr_ack(0),
          maddr => global_lr_addr(9 downto 0),
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
          maddr => global_lc_addr(9 downto 0),
          mtag => global_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    -- shared load operator group (1) : RfromL 
    LoadGroup1: Block -- 
      signal data_in: std_logic_vector(3 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXr5_cp_to_dp;
      mainXa5_dp_to_cp <= ackL(0);
      reqR(0) <= mainXr6_cp_to_dp;
      mainXa6_dp_to_cp <= ackR(0);
      data_in <= lp;
      d3 <= data_out(7 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 4,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => local_lr_req(0),
          mack => local_lr_ack(0),
          maddr => local_lr_addr(3 downto 0),
          mtag => local_lr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( data_width => 8,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => local_lc_req(0),
          mack => local_lc_ack(0),
          maddr => local_lc_addr(3 downto 0),
          mtag => local_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 1
    -- shared store operator group (0) : WtoG 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(9 downto 0);
      signal data_in: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXr7_cp_to_dp;
      mainXa7_dp_to_cp <= ackL(0);
      reqR(0) <= mainXr8_cp_to_dp;
      mainXa8_dp_to_cp <= ackR(0);
      addr_in <= b;
      data_in <= d3;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 10,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => global_sr_req(0),
          mack => global_sr_ack(0),
          maddr => global_sr_addr(9 downto 0),
          mdata => global_sr_data(7 downto 0),
          mtag => global_sr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map (   num_reqs => 1,  tag_length => 1)
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
    -- shared store operator group (1) : WtoL 
    StoreGroup1: Block -- 
      signal addr_in: std_logic_vector(3 downto 0);
      signal data_in: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= mainXr3_cp_to_dp;
      mainXa3_dp_to_cp <= ackL(0);
      reqR(0) <= mainXr4_cp_to_dp;
      mainXa4_dp_to_cp <= ackR(0);
      addr_in <= lp;
      data_in <= d1;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 4,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => local_sr_req(0),
          mack => local_sr_ack(0),
          maddr => local_sr_addr(3 downto 0),
          mdata => local_sr_data(7 downto 0),
          mtag => local_sr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map (   num_reqs => 1,  tag_length => 1)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => local_sc_req(0),
          mack => local_sc_ack(0),
          mtag => local_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 1
    -- 
  end Block; -- data_path
  MemorySpace_local: memory_subsystem -- 
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
      lr_addr_in => local_lr_addr,
      lr_req_in => local_lr_req,
      lr_ack_in => local_lr_ack,
      lr_tag_in => local_lr_tag,
      lc_req_in => local_lc_req,
      lc_ack_in => local_lc_ack,
      lc_data_out => local_lc_data,
      lc_tag_out => local_lc_tag,
      sr_addr_in => local_sr_addr,
      sr_data_in => local_sr_addr,
      sr_req_in => local_sr_req,
      sr_ack_in => local_sr_ack,
      sr_tag_in => local_sr_tag,
      sc_req_in => local_sc_req,
      sc_ack_in => local_sc_ack,
      sc_tag_out => local_sc_tag,
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
use ahir.loadstorepack.all;
use ahir.operatorpackage.all;
entity test_system is  -- system 
  port (-- 
    foo_a : in  std_logic_vector(9 downto 0);
    foo_b : in  std_logic_vector(9 downto 0);
    foo_start : in std_logic;
    foo_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- interface signals to connect to memory space global
  signal global_lr_req :  std_logic_vector(0 downto 0);
  signal global_lr_ack : std_logic_vector(0 downto 0);
  signal global_lr_addr : std_logic_vector(9 downto 0);
  signal global_lr_tag : std_logic_vector(0 downto 0);
  signal global_lc_req : std_logic_vector(0 downto 0);
  signal global_lc_ack :  std_logic_vector(0 downto 0);
  signal global_lc_data : std_logic_vector(7 downto 0);
  signal global_lc_tag :  std_logic_vector(0 downto 0);
  signal global_sr_req :  std_logic_vector(0 downto 0);
  signal global_sr_ack : std_logic_vector(0 downto 0);
  signal global_sr_addr : std_logic_vector(9 downto 0);
  signal global_sr_data : std_logic_vector(7 downto 0);
  signal global_sr_tag : std_logic_vector(0 downto 0);
  signal global_sc_req : std_logic_vector(0 downto 0);
  signal global_sc_ack :  std_logic_vector(0 downto 0);
  signal global_sc_tag :  std_logic_vector(0 downto 0);
  -- declarations related to module foo
  component foo is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : in  std_logic_vector(9 downto 0);
      clock : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      global_lr_req : out  std_logic_vector(0 downto 0);
      global_lr_ack : in   std_logic_vector(0 downto 0);
      global_lr_addr : out  std_logic_vector(9 downto 0);
      global_lr_tag :  out  std_logic_vector(0 downto 0);
      global_lc_req : out  std_logic_vector(0 downto 0);
      global_lc_ack : in   std_logic_vector(0 downto 0);
      global_lc_data : in   std_logic_vector(7 downto 0);
      global_lc_tag :  in  std_logic_vector(0 downto 0);
      global_sr_req : out  std_logic_vector(0 downto 0);
      global_sr_ack : in   std_logic_vector(0 downto 0);
      global_sr_addr : out  std_logic_vector(9 downto 0);
      global_sr_data : out  std_logic_vector(7 downto 0);
      global_sr_tag :  out  std_logic_vector(0 downto 0);
      global_sc_req : out  std_logic_vector(0 downto 0);
      global_sc_ack : in   std_logic_vector(0 downto 0);
      global_sc_tag :  in  std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- 
begin -- 
  -- module foo
  foo_instance:foo-- 
    port map(-- 
      a => foo_a,
      b => foo_b,
      start => foo_start,
      fin => foo_fin,
      clk => clk,
      reset => reset,
      global_lr_req => global_lr_req(0 downto 0),
      global_lr_ack => global_lr_ack(0 downto 0),
      global_lr_addr => global_lr_addr(9 downto 0),
      global_lr_tag => global_lr_tag(0 downto 0),
      global_lc_req => global_lc_req(0 downto 0),
      global_lc_ack => global_lc_ack(0 downto 0),
      global_lc_data => global_lc_data(7 downto 0),
      global_lc_tag => global_lc_tag(0 downto 0),
      local_lr_req => local_lr_req(0 downto 0),
      local_lr_ack => local_lr_ack(0 downto 0),
      local_lr_addr => local_lr_addr(3 downto 0),
      local_lr_tag => local_lr_tag(0 downto 0),
      local_lc_req => local_lc_req(0 downto 0),
      local_lc_ack => local_lc_ack(0 downto 0),
      local_lc_data => local_lc_data(7 downto 0),
      local_lc_tag => local_lc_tag(0 downto 0),
      global_sr_req => global_sr_req(0 downto 0),
      global_sr_ack => global_sr_ack(0 downto 0),
      global_sr_addr => global_sr_addr(9 downto 0),
      global_sr_data => global_sr_data(7 downto 0),
      global_sr_tag => global_sr_tag(0 downto 0),
      global_sc_req => global_sc_req(0 downto 0),
      global_sc_ack => global_sc_ack(0 downto 0),
      global_sc_tag => global_sc_tag(0 downto 0),
      local_sr_req => local_sr_req(0 downto 0),
      local_sr_ack => local_sr_ack(0 downto 0),
      local_sr_addr => local_sr_addr(3 downto 0),
      local_sr_data => local_sr_data(7 downto 0),
      local_sr_tag => local_sr_tag(0 downto 0),
      local_sc_req => local_sc_req(0 downto 0),
      local_sc_ack => local_sc_ack(0 downto 0),
      local_sc_tag => local_sc_tag(0 downto 0),
      tag_in => foo_tag_in,
      tag_out => foo_tag_out-- 
    ); -- 
  MemorySpace_global: memory_subsystem -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 10,
      data_width => 8,
      tag_width => 1,
      number_of_banks => 1,mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 10,
      base_bank_data_width => 1) -- 
    port map(-- 
      lr_addr_in => global_lr_addr,
      lr_req_in => global_lr_req,
      lr_ack_in => global_lr_ack,
      lr_tag_in => global_lr_tag,
      lc_req_in => global_lc_req,
      lc_ack_in => global_lc_ack,
      lc_data_out => global_lc_data,
      lc_tag_out => global_lc_tag,
      sr_addr_in => global_sr_addr,
      sr_data_in => global_sr_addr,
      sr_req_in => global_sr_req,
      sr_ack_in => global_sr_ack,
      sr_tag_in => global_sr_tag,
      sc_req_in => global_sc_req,
      sc_ack_in => global_sc_ack,
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
use ahir.loadstorepack.all;
use ahir.operatorpackage.all;
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      foo_a : in  std_logic_vector(9 downto 0);
      foo_b : in  std_logic_vector(9 downto 0);
      foo_start : in std_logic;
      foo_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal foo_a :  std_logic_vector(9 downto 0);
  signal foo_b :  std_logic_vector(9 downto 0);
  signal foo_start : std_logic;
  signal foo_fin   : std_logic;
  -- 
begin --
  test_system_instance: test_system -- 
    port map ( -- 
      foo_a => foo_a,
      foo_b => foo_b,
      foo_start => foo_start,
      foo_fin  => foo_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
