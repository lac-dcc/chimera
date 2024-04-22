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
    pipe_buffer_1_pipe_read_req : out  std_logic_vector(0 downto 0);
    pipe_buffer_1_pipe_read_ack : in   std_logic_vector(0 downto 0);
    pipe_buffer_1_pipe_read_data : in   std_logic_vector(9 downto 0);
    pipe_buffer_1_pipe_write_req : out  std_logic_vector(0 downto 0);
    pipe_buffer_1_pipe_write_ack : in   std_logic_vector(0 downto 0);
    pipe_buffer_1_pipe_write_data : out  std_logic_vector(9 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity sum_mod;
architecture Default of sum_mod is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal assign_stmt_7Xsimple_obj_ref_5Xpipe_wreq_cp_to_dp : boolean;
  signal assign_stmt_7Xsimple_obj_ref_5Xpipe_wack_dp_to_cp : boolean;
  signal assign_stmt_10Xsimple_obj_ref_9Xreq_cp_to_dp : boolean;
  signal assign_stmt_10Xsimple_obj_ref_9Xack_dp_to_cp : boolean;
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
    signal cp_11_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- assign_stmt_7 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition assign_stmt_7/$entry
      cp_6: Block -- assign_stmt_7/simple_obj_ref_5 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        signal cp_10_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition assign_stmt_7/simple_obj_ref_5/$entry
        cp_9_symbol <= cp_7_symbol; -- transition assign_stmt_7/simple_obj_ref_5/pipe_wreq
        assign_stmt_7Xsimple_obj_ref_5Xpipe_wreq_cp_to_dp <= cp_9_symbol; -- link to DP
        cp_10_symbol <= assign_stmt_7Xsimple_obj_ref_5Xpipe_wack_dp_to_cp; -- transition assign_stmt_7/simple_obj_ref_5/pipe_wack
        cp_8_symbol <= cp_10_symbol; -- transition assign_stmt_7/simple_obj_ref_5/$exit
        cp_6_symbol <= cp_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_7/simple_obj_ref_5
      cp_5_symbol <= cp_6_symbol; -- transition assign_stmt_7/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_7
    cp_11: Block -- assign_stmt_10 
      signal cp_11_start: Boolean;
      signal cp_12_symbol: Boolean;
      signal cp_13_symbol: Boolean;
      signal cp_14_symbol : Boolean;
      -- 
    begin -- 
      cp_11_start <= cp_3_symbol; -- control passed to block
      cp_12_symbol  <= cp_11_start; -- transition assign_stmt_10/$entry
      cp_14: Block -- assign_stmt_10/simple_obj_ref_9 
        signal cp_14_start: Boolean;
        signal cp_15_symbol: Boolean;
        signal cp_16_symbol: Boolean;
        signal cp_17_symbol : Boolean;
        signal cp_18_symbol : Boolean;
        -- 
      begin -- 
        cp_14_start <= cp_12_symbol; -- control passed to block
        cp_15_symbol  <= cp_14_start; -- transition assign_stmt_10/simple_obj_ref_9/$entry
        cp_17_symbol <= cp_15_symbol; -- transition assign_stmt_10/simple_obj_ref_9/req
        assign_stmt_10Xsimple_obj_ref_9Xreq_cp_to_dp <= cp_17_symbol; -- link to DP
        cp_18_symbol <= assign_stmt_10Xsimple_obj_ref_9Xack_dp_to_cp; -- transition assign_stmt_10/simple_obj_ref_9/ack
        cp_16_symbol <= cp_18_symbol; -- transition assign_stmt_10/simple_obj_ref_9/$exit
        cp_14_symbol <= cp_16_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_10/simple_obj_ref_9
      cp_13_symbol <= cp_14_symbol; -- transition assign_stmt_10/$exit
      cp_11_symbol <= cp_13_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_10
    cp_2_symbol <= cp_11_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    -- 
  begin -- 
    -- shared inport operator group (0) : simple_obj_ref_9_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= assign_stmt_10Xsimple_obj_ref_9Xreq_cp_to_dp;
      assign_stmt_10Xsimple_obj_ref_9Xack_dp_to_cp <= ack(0);
      b <= data_out(9 downto 0);
      Inport: InputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => pipe_buffer_1_pipe_read_req(0),
          oack => pipe_buffer_1_pipe_read_ack(0),
          odata => pipe_buffer_1_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : simple_obj_ref_5_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      req(0) <= assign_stmt_7Xsimple_obj_ref_5Xpipe_wreq_cp_to_dp;
      assign_stmt_7Xsimple_obj_ref_5Xpipe_wack_dp_to_cp <= ack(0);
      data_in <= a;
      outport: OutputPort -- 
        generic map ( data_width => 10,  num_reqs => 1,  no_arbitration => true)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => pipe_buffer_1_pipe_write_req(0),
          oack => pipe_buffer_1_pipe_write_ack(0),
          odata => pipe_buffer_1_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
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
    reset : in std_logic); -- 
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
      pipe_buffer_1_pipe_read_req : out  std_logic_vector(0 downto 0);
      pipe_buffer_1_pipe_read_ack : in   std_logic_vector(0 downto 0);
      pipe_buffer_1_pipe_read_data : in   std_logic_vector(9 downto 0);
      pipe_buffer_1_pipe_write_req : out  std_logic_vector(0 downto 0);
      pipe_buffer_1_pipe_write_ack : in   std_logic_vector(0 downto 0);
      pipe_buffer_1_pipe_write_data : out  std_logic_vector(9 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- aggregate signals for write to pipe pipe_buffer_1
  signal pipe_buffer_1_pipe_write_data: std_logic_vector(9 downto 0);
  signal pipe_buffer_1_pipe_write_req: std_logic_vector(0 downto 0);
  signal pipe_buffer_1_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe pipe_buffer_1
  signal pipe_buffer_1_pipe_read_data: std_logic_vector(9 downto 0);
  signal pipe_buffer_1_pipe_read_req: std_logic_vector(0 downto 0);
  signal pipe_buffer_1_pipe_read_ack: std_logic_vector(0 downto 0);
  -- the pipe itself. pipe_buffer_1
  signal pipe_buffer_1_pipe_data: std_logic_vector(9 downto 0);
  signal pipe_buffer_1_pipe_req: std_logic;
  signal pipe_buffer_1_pipe_ack: std_logic;
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
      pipe_buffer_1_pipe_read_req => pipe_buffer_1_pipe_read_req(0 downto 0),
      pipe_buffer_1_pipe_read_ack => pipe_buffer_1_pipe_read_ack(0 downto 0),
      pipe_buffer_1_pipe_read_data => pipe_buffer_1_pipe_read_data(9 downto 0),
      pipe_buffer_1_pipe_write_req => pipe_buffer_1_pipe_write_req(0 downto 0),
      pipe_buffer_1_pipe_write_ack => pipe_buffer_1_pipe_write_ack(0 downto 0),
      pipe_buffer_1_pipe_write_data => pipe_buffer_1_pipe_write_data(9 downto 0),
      tag_in => sum_mod_tag_in,
      tag_out => sum_mod_tag_out-- 
    ); -- 
  pipe_buffer_1_ReadMux: InputPortLevel -- 
    generic map( -- 
      num_reqs => 1,
      data_width => 10,
      no_arbitration => false -- 
    )
    port map( -- 
      req => pipe_buffer_1_pipe_read_req,
      ack => pipe_buffer_1_pipe_read_ack,
      data => pipe_buffer_1_pipe_read_data,
      oreq => pipe_buffer_1_pipe_ack, -- cross-over
      oack => pipe_buffer_1_pipe_req, -- cross-over
      odata => pipe_buffer_1_pipe_data,
      clk => clk,reset => reset -- 
    ); -- 
  pipe_buffer_1_WriteMux: OutputPortLevel -- 
    generic map( -- 
      num_reqs => 1,
      data_width => 10,
      no_arbitration => false -- 
    )
    port map( -- 
      req => pipe_buffer_1_pipe_write_req,
      ack => pipe_buffer_1_pipe_write_ack,
      data => pipe_buffer_1_pipe_write_data,
      oreq => pipe_buffer_1_pipe_req, -- no cross-over
      oack => pipe_buffer_1_pipe_ack, -- no cross-over
      odata => pipe_buffer_1_pipe_data,
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
      reset : in std_logic); -- 
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
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= (9 => '1', 0 => '1', others => '0');
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
      reset => reset); -- 
  -- 
end Default;
