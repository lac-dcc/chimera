library ieee;
use ieee.std_logic_1164.all;
package sys_Type_Package is -- 
  -- 
end package;
library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-->>>>>
library SYS_LIB;
use SYS_LIB.sys_Type_Package.all;
--<<<<<
-->>>>>
library SYS_LIB;
library SYS_LIB;
library SYS_LIB;
--<<<<<
entity sys is -- 
  port( -- 
    DATA_IN_pipe_write_data : in std_logic_vector(7 downto 0);
    DATA_IN_pipe_write_req  : in std_logic_vector(0  downto 0);
    DATA_IN_pipe_write_ack  : out std_logic_vector(0  downto 0);
    DATA_OUT_pipe_read_data : out std_logic_vector(7 downto 0);
    DATA_OUT_pipe_read_req  : in std_logic_vector(0  downto 0);
    DATA_OUT_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity sys;
architecture struct of sys is -- 
  signal E1_IN_pipe_write_data: std_logic_vector(7 downto 0);
  signal E1_IN_pipe_write_req : std_logic_vector(0  downto 0);
  signal E1_IN_pipe_write_ack : std_logic_vector(0  downto 0);
  signal E1_IN_pipe_read_data: std_logic_vector(7 downto 0);
  signal E1_IN_pipe_read_req : std_logic_vector(0  downto 0);
  signal E1_IN_pipe_read_ack : std_logic_vector(0  downto 0);
  signal E1_OUT_pipe_write_data: std_logic_vector(7 downto 0);
  signal E1_OUT_pipe_write_req : std_logic_vector(0  downto 0);
  signal E1_OUT_pipe_write_ack : std_logic_vector(0  downto 0);
  signal E1_OUT_pipe_read_data: std_logic_vector(7 downto 0);
  signal E1_OUT_pipe_read_req : std_logic_vector(0  downto 0);
  signal E1_OUT_pipe_read_ack : std_logic_vector(0  downto 0);
  signal E2_IN_pipe_write_data: std_logic_vector(7 downto 0);
  signal E2_IN_pipe_write_req : std_logic_vector(0  downto 0);
  signal E2_IN_pipe_write_ack : std_logic_vector(0  downto 0);
  signal E2_IN_pipe_read_data: std_logic_vector(7 downto 0);
  signal E2_IN_pipe_read_req : std_logic_vector(0  downto 0);
  signal E2_IN_pipe_read_ack : std_logic_vector(0  downto 0);
  signal E2_OUT_pipe_write_data: std_logic_vector(7 downto 0);
  signal E2_OUT_pipe_write_req : std_logic_vector(0  downto 0);
  signal E2_OUT_pipe_write_ack : std_logic_vector(0  downto 0);
  signal E2_OUT_pipe_read_data: std_logic_vector(7 downto 0);
  signal E2_OUT_pipe_read_req : std_logic_vector(0  downto 0);
  signal E2_OUT_pipe_read_ack : std_logic_vector(0  downto 0);
  component controller is -- 
    port( -- 
      FROM_E1_pipe_write_data : in std_logic_vector(7 downto 0);
      FROM_E1_pipe_write_req  : in std_logic_vector(0  downto 0);
      FROM_E1_pipe_write_ack  : out std_logic_vector(0  downto 0);
      FROM_E2_pipe_write_data : in std_logic_vector(7 downto 0);
      FROM_E2_pipe_write_req  : in std_logic_vector(0  downto 0);
      FROM_E2_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ctrl_in_pipe_pipe_write_data : in std_logic_vector(7 downto 0);
      ctrl_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
      ctrl_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
      TO_E1_pipe_read_data : out std_logic_vector(7 downto 0);
      TO_E1_pipe_read_req  : in std_logic_vector(0  downto 0);
      TO_E1_pipe_read_ack  : out std_logic_vector(0  downto 0);
      TO_E2_pipe_read_data : out std_logic_vector(7 downto 0);
      TO_E2_pipe_read_req  : in std_logic_vector(0  downto 0);
      TO_E2_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ctrl_out_pipe_pipe_read_data : out std_logic_vector(7 downto 0);
      ctrl_out_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      ctrl_out_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for c :  controller -- 
    use entity SYS_LIB.controller; -- 
  --<<<<<
  component engine is -- 
    port( -- 
      engine_in_pipe_pipe_write_data : in std_logic_vector(7 downto 0);
      engine_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
      engine_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
      engine_out_pipe_pipe_read_data : out std_logic_vector(7 downto 0);
      engine_out_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      engine_out_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for e1 :  engine -- 
    use entity SYS_LIB.engine; -- 
  --<<<<<
  -->>>>>
  for e2 :  engine -- 
    use entity SYS_LIB.engine; -- 
  --<<<<<
  -- 
begin -- 
  c: controller
  port map ( --
    FROM_E1_pipe_write_data => E1_OUT_pipe_read_data,
    FROM_E1_pipe_write_req => E1_OUT_pipe_read_ack,
    FROM_E1_pipe_write_ack => E1_OUT_pipe_read_req,
    FROM_E2_pipe_write_data => E2_OUT_pipe_read_data,
    FROM_E2_pipe_write_req => E2_OUT_pipe_read_ack,
    FROM_E2_pipe_write_ack => E2_OUT_pipe_read_req,
    TO_E1_pipe_read_data => E1_IN_pipe_write_data,
    TO_E1_pipe_read_req => E1_IN_pipe_write_ack,
    TO_E1_pipe_read_ack => E1_IN_pipe_write_req,
    TO_E2_pipe_read_data => E2_IN_pipe_write_data,
    TO_E2_pipe_read_req => E2_IN_pipe_write_ack,
    TO_E2_pipe_read_ack => E2_IN_pipe_write_req,
    ctrl_in_pipe_pipe_write_data => DATA_IN_pipe_write_data,
    ctrl_in_pipe_pipe_write_req => DATA_IN_pipe_write_req,
    ctrl_in_pipe_pipe_write_ack => DATA_IN_pipe_write_ack,
    ctrl_out_pipe_pipe_read_data => DATA_OUT_pipe_read_data,
    ctrl_out_pipe_pipe_read_req => DATA_OUT_pipe_read_req,
    ctrl_out_pipe_pipe_read_ack => DATA_OUT_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  e1: engine
  port map ( --
    engine_in_pipe_pipe_write_data => E1_IN_pipe_read_data,
    engine_in_pipe_pipe_write_req => E1_IN_pipe_read_ack,
    engine_in_pipe_pipe_write_ack => E1_IN_pipe_read_req,
    engine_out_pipe_pipe_read_data => E1_OUT_pipe_write_data,
    engine_out_pipe_pipe_read_req => E1_OUT_pipe_write_ack,
    engine_out_pipe_pipe_read_ack => E1_OUT_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  e2: engine
  port map ( --
    engine_in_pipe_pipe_write_data => E2_IN_pipe_read_data,
    engine_in_pipe_pipe_write_req => E2_IN_pipe_read_ack,
    engine_in_pipe_pipe_write_ack => E2_IN_pipe_read_req,
    engine_out_pipe_pipe_read_data => E2_OUT_pipe_write_data,
    engine_out_pipe_pipe_read_req => E2_OUT_pipe_write_ack,
    engine_out_pipe_pipe_read_ack => E2_OUT_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  E1_IN_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe E1_IN",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1 --
    )
    port map( -- 
      read_req => E1_IN_pipe_read_req,
      read_ack => E1_IN_pipe_read_ack,
      read_data => E1_IN_pipe_read_data,
      write_req => E1_IN_pipe_write_req,
      write_ack => E1_IN_pipe_write_ack,
      write_data => E1_IN_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  E1_OUT_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe E1_OUT",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1 --
    )
    port map( -- 
      read_req => E1_OUT_pipe_read_req,
      read_ack => E1_OUT_pipe_read_ack,
      read_data => E1_OUT_pipe_read_data,
      write_req => E1_OUT_pipe_write_req,
      write_ack => E1_OUT_pipe_write_ack,
      write_data => E1_OUT_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  E2_IN_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe E2_IN",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1 --
    )
    port map( -- 
      read_req => E2_IN_pipe_read_req,
      read_ack => E2_IN_pipe_read_ack,
      read_data => E2_IN_pipe_read_data,
      write_req => E2_IN_pipe_write_req,
      write_ack => E2_IN_pipe_write_ack,
      write_data => E2_IN_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  E2_OUT_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe E2_OUT",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1 --
    )
    port map( -- 
      read_req => E2_OUT_pipe_read_req,
      read_ack => E2_OUT_pipe_read_ack,
      read_data => E2_OUT_pipe_read_data,
      write_req => E2_OUT_pipe_write_req,
      write_ack => E2_OUT_pipe_write_ack,
      write_data => E2_OUT_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;
