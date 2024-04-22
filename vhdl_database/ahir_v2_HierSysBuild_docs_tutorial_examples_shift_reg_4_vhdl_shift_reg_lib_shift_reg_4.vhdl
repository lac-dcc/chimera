library ieee;
use ieee.std_logic_1164.all;
package shift_reg_4_Type_Package is -- 
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
library shift_reg_lib;
use shift_reg_lib.shift_reg_4_Type_Package.all;
--<<<<<
-->>>>>
library shift_reg_lib;
library shift_reg_lib;
--<<<<<
entity shift_reg_4 is -- 
  port( -- 
    in_data_pipe_write_data : in std_logic_vector(31 downto 0);
    in_data_pipe_write_req  : in std_logic_vector(0  downto 0);
    in_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
    out_data_pipe_read_data : out std_logic_vector(31 downto 0);
    out_data_pipe_read_req  : in std_logic_vector(0  downto 0);
    out_data_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity shift_reg_4;
architecture struct of shift_reg_4 is -- 
  signal mid_data_pipe_write_data: std_logic_vector(31 downto 0);
  signal mid_data_pipe_write_req : std_logic_vector(0  downto 0);
  signal mid_data_pipe_write_ack : std_logic_vector(0  downto 0);
  signal mid_data_pipe_read_data: std_logic_vector(31 downto 0);
  signal mid_data_pipe_read_req : std_logic_vector(0  downto 0);
  signal mid_data_pipe_read_ack : std_logic_vector(0  downto 0);
  component shift_reg_2 is -- 
    port( -- 
      in_data_pipe_write_data : in std_logic_vector(31 downto 0);
      in_data_pipe_write_req  : in std_logic_vector(0  downto 0);
      in_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
      out_data_pipe_read_data : out std_logic_vector(31 downto 0);
      out_data_pipe_read_req  : in std_logic_vector(0  downto 0);
      out_data_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for sleft :  shift_reg_2 -- 
    use entity shift_reg_lib.shift_reg_2; -- 
  --<<<<<
  -->>>>>
  for sright :  shift_reg_2 -- 
    use entity shift_reg_lib.shift_reg_2; -- 
  --<<<<<
  -- 
begin -- 
  sleft: shift_reg_2
  port map ( --
    in_data_pipe_write_data => in_data_pipe_write_data,
    in_data_pipe_write_req => in_data_pipe_write_req,
    in_data_pipe_write_ack => in_data_pipe_write_ack,
    out_data_pipe_read_data => mid_data_pipe_write_data,
    out_data_pipe_read_req => mid_data_pipe_write_ack,
    out_data_pipe_read_ack => mid_data_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  sright: shift_reg_2
  port map ( --
    in_data_pipe_write_data => mid_data_pipe_read_data,
    in_data_pipe_write_req => mid_data_pipe_read_ack,
    in_data_pipe_write_ack => mid_data_pipe_read_req,
    out_data_pipe_read_data => out_data_pipe_read_data,
    out_data_pipe_read_req => out_data_pipe_read_req,
    out_data_pipe_read_ack => out_data_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  mid_data_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe mid_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => mid_data_pipe_read_req,
      read_ack => mid_data_pipe_read_ack,
      read_data => mid_data_pipe_read_data,
      write_req => mid_data_pipe_write_req,
      write_ack => mid_data_pipe_write_ack,
      write_data => mid_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;
