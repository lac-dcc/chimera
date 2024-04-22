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
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
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
entity foo is -- 
  port ( -- 
    a : in  std_logic_vector(31 downto 0);
    b : in  std_logic_vector(31 downto 0);
    p : in  std_logic_vector(31 downto 0);
    q : in  std_logic_vector(31 downto 0);
    c : out  std_logic_vector(31 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity foo;
architecture Default of foo is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal a1_req_1 : boolean;
  signal a1_req_0 : boolean;
  signal a1_ack_0 : boolean;
  signal a1_ack_1 : boolean;
  signal a2_req_0 : boolean;
  signal a2_ack_0 : boolean;
  signal a2_req_1 : boolean;
  signal a2_ack_1 : boolean;
  signal a3_req_0 : boolean;
  signal a3_ack_0 : boolean;
  signal a3_req_1 : boolean;
  signal a3_ack_1 : boolean;
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
  foo_CP_0: Block -- control-path 
    signal cp_elements: BooleanArray(7 downto 0);
    -- 
  begin -- 
    cp_elements(0) <= true when start = '1' else false;
    fin <= '1' when cp_elements(7) else '0';
    a1_req_0 <= cp_elements(0);
    a2_req_0 <= cp_elements(0);
    cp_elements(1) <= a1_ack_0;
    a1_req_1 <= cp_elements(1);
    cp_elements(2) <= a1_ack_1;
    cp_elements(3) <= a2_ack_0;
    a2_req_1 <= cp_elements(3);
    cp_elements(4) <= a2_ack_1;
    cpelement_group_5 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors <= (cp_elements(2) & cp_elements(4));
      jNoI: join -- 
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(5),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    a3_req_0 <= cp_elements(5);
    cp_elements(6) <= a3_ack_0;
    a3_req_1 <= cp_elements(6);
    cp_elements(7) <= a3_ack_1;
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal s : std_logic_vector(31 downto 0);
    signal t : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    -- shared split operator group (0) : a1 a3 
    SplitOperatorGroup0: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      -- 
    begin -- 
      data_in <= a & b & t & s;
      t <= data_out(63 downto 32);
      c <= data_out(31 downto 0);
      reqL(1) <= a1_req_0;
      reqL(0) <= a3_req_0;
      a1_ack_0 <= ackL(1);
      a3_ack_0 <= ackL(0);
      reqR(1) <= a1_req_1;
      reqR(0) <= a3_req_1;
      a1_ack_1 <= ackR(1);
      a3_ack_1 <= ackR(0);
      SplitOperator: SplitOperatorShared -- 
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
      data_in <= p & q;
      s <= data_out(31 downto 0);
      UnsharedOperator: UnsharedOperatorBase -- 
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
          flow_through => false--
        ) 
        port map ( -- 
          reqL => a2_req_0,
          ackL => a2_ack_0,
          reqR => a2_req_1,
          ackR => a2_ack_1,
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
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
    foo_a : in  std_logic_vector(31 downto 0);
    foo_b : in  std_logic_vector(31 downto 0);
    foo_p : in  std_logic_vector(31 downto 0);
    foo_q : in  std_logic_vector(31 downto 0);
    foo_c : out  std_logic_vector(31 downto 0);
    foo_tag_in: in std_logic_vector(0 downto 0);
    foo_tag_out: out std_logic_vector(0 downto 0);
    foo_start : in std_logic;
    foo_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- declarations related to module foo
  component foo is -- 
    port ( -- 
      a : in  std_logic_vector(31 downto 0);
      b : in  std_logic_vector(31 downto 0);
      p : in  std_logic_vector(31 downto 0);
      q : in  std_logic_vector(31 downto 0);
      c : out  std_logic_vector(31 downto 0);
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
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
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
      foo_tag_in: in std_logic_vector(0 downto 0);
      foo_tag_out: out std_logic_vector(0 downto 0);
      foo_start : in std_logic;
      foo_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal foo_a :  std_logic_vector(31 downto 0) := (others => '0');
  signal foo_b :  std_logic_vector(31 downto 0) := (others => '0');
  signal foo_p :  std_logic_vector(31 downto 0) := (others => '0');
  signal foo_q :  std_logic_vector(31 downto 0) := (others => '0');
  signal foo_c :   std_logic_vector(31 downto 0);
  signal foo_tag_in: std_logic_vector(0 downto 0);
  signal foo_tag_out: std_logic_vector(0 downto 0);
  signal foo_start : std_logic := '0';
  signal foo_fin   : std_logic := '0';
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    wait until clk = '1';
    reset <= '0';
    wait;
    --
  end process;
  -- a rudimentary tb.. will start all the top-level modules ..
  process
  begin --
    wait until clk = '1';
    foo_start <= '1';
    wait until clk = '1';
    foo_start <= '0';
    while foo_fin /= '1' loop -- 
      wait until clk = '1';
      -- 
    end loop;
    wait;
    --
  end process;
  test_system_instance: test_system -- 
    port map ( -- 
      foo_a => foo_a,
      foo_b => foo_b,
      foo_p => foo_p,
      foo_q => foo_q,
      foo_c => foo_c,
      foo_tag_in => foo_tag_in,
      foo_tag_out => foo_tag_out,
      foo_start => foo_start,
      foo_fin  => foo_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;
