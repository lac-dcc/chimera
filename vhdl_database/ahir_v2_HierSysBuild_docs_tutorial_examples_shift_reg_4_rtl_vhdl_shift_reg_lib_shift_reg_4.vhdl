library ieee;
use ieee.std_logic_1164.all;
package shift_reg_4_Type_Package is -- 
  subtype unsigned_31_downto_0 is std_logic_vector(31 downto 0);
  subtype unsigned_0_downto_0 is std_logic_vector(0 downto 0);
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
entity complementerFsm is  -- 
  port (-- 
    input_data: in std_logic_vector(31 downto 0);
    input_data_pipe_read_req: out std_logic_vector(0 downto 0);
    input_data_pipe_read_ack: in std_logic_vector(0 downto 0);
    output_data: out std_logic_vector(31 downto 0);
    output_data_pipe_write_req: out std_logic_vector(0 downto 0);
    output_data_pipe_write_ack: in std_logic_vector(0 downto 0);
    clk, reset: in std_logic); --
  --
end entity complementerFsm;
architecture rtlThreadArch of complementerFsm is --
  type ThreadState is (s_st_empty, s_st_full);
  signal current_thread_state : ThreadState;
  constant o1: unsigned_0_downto_0 := "1";
  constant z1: unsigned_0_downto_0 := "0";
  --
begin -- 
  process(clk, reset, current_thread_state , input_data, input_data_pipe_read_ack, output_data_pipe_write_ack) --
    -- declared variables and implied variables 
    variable data_reg: unsigned_31_downto_0;
    variable next_thread_state : ThreadState;
    --
  begin -- 
    -- default values 
    next_thread_state := current_thread_state;
    --  $now  input_data$req  :=  z1
    input_data_pipe_read_req <= z1;
    --  $now  output_data$req  :=  z1
    output_data_pipe_write_req <= z1;
    -- case statement 
    case current_thread_state is -- 
      when s_st_empty => -- 
        next_thread_state := s_st_full;
        --  $now  input_data$req  :=  o1
        input_data_pipe_read_req <= o1;
        if (isTrue(input_data_pipe_read_ack)) then  -- 
          --  data_reg := ( ~  input_data) 
          data_reg := ( not input_data);
          next_thread_state := s_st_full;
          --
        else -- 
          next_thread_state := s_st_empty;
          --
        end if;
        --
      when s_st_full => -- 
        next_thread_state := s_st_full;
        --  $now  output_data$req  :=  o1
        output_data_pipe_write_req <= o1;
        --  $now  output_data :=  data_reg
        output_data <= data_reg;
        if (isTrue(output_data_pipe_write_ack)) then  -- 
          next_thread_state := s_st_empty;
          --
        else -- 
          next_thread_state := s_st_full;
          --
        end if;
        --
      --
    end case;
    if (clk'event and clk = '1') then -- 
      if (reset = '1') then -- 
        current_thread_state <= s_st_empty;
        -- 
      else -- 
        current_thread_state <= next_thread_state; 
        -- objects to be updated under tick.
        -- specified tick assignments. 
        -- 
      end if; 
      -- 
    end if; 
    --
  end process; 
  --
end rtlThreadArch;
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
  signal mid_data_left_pipe_write_data: std_logic_vector(31 downto 0);
  signal mid_data_left_pipe_write_req : std_logic_vector(0  downto 0);
  signal mid_data_left_pipe_write_ack : std_logic_vector(0  downto 0);
  signal mid_data_left_pipe_read_data: std_logic_vector(31 downto 0);
  signal mid_data_left_pipe_read_req : std_logic_vector(0  downto 0);
  signal mid_data_left_pipe_read_ack : std_logic_vector(0  downto 0);
  signal mid_data_right_pipe_write_data: std_logic_vector(31 downto 0);
  signal mid_data_right_pipe_write_req : std_logic_vector(0  downto 0);
  signal mid_data_right_pipe_write_ack : std_logic_vector(0  downto 0);
  signal mid_data_right_pipe_read_data: std_logic_vector(31 downto 0);
  signal mid_data_right_pipe_read_req : std_logic_vector(0  downto 0);
  signal mid_data_right_pipe_read_ack : std_logic_vector(0  downto 0);
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
  component complementerFsm is  -- 
    port (-- 
      input_data: in std_logic_vector(31 downto 0);
      input_data_pipe_read_req: out std_logic_vector(0 downto 0);
      input_data_pipe_read_ack: in std_logic_vector(0 downto 0);
      output_data: out std_logic_vector(31 downto 0);
      output_data_pipe_write_req: out std_logic_vector(0 downto 0);
      output_data_pipe_write_ack: in std_logic_vector(0 downto 0);
      clk, reset: in std_logic); --
    --
  end component;
  -->>>>>
  for complementer_inst :  complementerFsm -- 
    use entity shift_reg_lib.complementerFsm; -- 
  --<<<<<
  -- 
begin -- 
  sleft: shift_reg_2
  port map ( --
    in_data_pipe_write_data => in_data_pipe_write_data,
    in_data_pipe_write_req => in_data_pipe_write_req,
    in_data_pipe_write_ack => in_data_pipe_write_ack,
    out_data_pipe_read_data => mid_data_left_pipe_write_data,
    out_data_pipe_read_req => mid_data_left_pipe_write_ack,
    out_data_pipe_read_ack => mid_data_left_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  sright: shift_reg_2
  port map ( --
    in_data_pipe_write_data => mid_data_right_pipe_read_data,
    in_data_pipe_write_req => mid_data_right_pipe_read_ack,
    in_data_pipe_write_ack => mid_data_right_pipe_read_req,
    out_data_pipe_read_data => out_data_pipe_read_data,
    out_data_pipe_read_req => out_data_pipe_read_req,
    out_data_pipe_read_ack => out_data_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  complementer_inst: complementerFsm -- 
    port map ( -- 
      input_data => mid_data_left_pipe_read_data,
      input_data_pipe_read_req => mid_data_left_pipe_read_req,
      input_data_pipe_read_ack => mid_data_left_pipe_read_ack,
      output_data => mid_data_right_pipe_write_data,
      output_data_pipe_write_req => mid_data_right_pipe_write_req,
      output_data_pipe_write_ack => mid_data_right_pipe_write_ack,
      clk => clk, reset => reset--
    ); -- 
  mid_data_left_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe mid_data_left",
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
      read_req => mid_data_left_pipe_read_req,
      read_ack => mid_data_left_pipe_read_ack,
      read_data => mid_data_left_pipe_read_data,
      write_req => mid_data_left_pipe_write_req,
      write_ack => mid_data_left_pipe_write_ack,
      write_data => mid_data_left_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  mid_data_right_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe mid_data_right",
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
      read_req => mid_data_right_pipe_read_req,
      read_ack => mid_data_right_pipe_read_ack,
      read_data => mid_data_right_pipe_read_data,
      write_req => mid_data_right_pipe_write_req,
      write_ack => mid_data_right_pipe_write_ack,
      write_data => mid_data_right_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;
