
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.memory_subsystem_package.all;

entity system is
  port(
    clk : in std_logic;
    env_call_ack : out std_logic;
    env_call_data : in std_logic_vector(0 downto 0);
    env_call_req : in std_logic;
    env_call_tag : in std_logic_vector(3 downto 0);
    env_lc_ack : out std_logic;
    env_lc_data : out std_logic_vector(7 downto 0);
    env_lc_req : in std_logic;
    env_lc_tag : out std_logic_vector(7 downto 0);
    env_lr_ack : out std_logic;
    env_lr_addr : in std_logic_vector(15 downto 0);
    env_lr_req : in std_logic;
    env_lr_tag : in std_logic_vector(7 downto 0);
    env_return_ack : in std_logic;
    env_return_data : out std_logic_vector(32 downto 0);
    env_return_req : out std_logic;
    env_return_tag : out std_logic_vector(3 downto 0);
    env_sr_ack : out std_logic;
    env_sr_addr : in std_logic_vector(15 downto 0);
    env_sr_data : in std_logic_vector(7 downto 0);
    env_sr_req : in std_logic;
    env_sr_tag : in std_logic_vector(7 downto 0);
    reset : in std_logic);
end system;


architecture default_arch of system is

  signal lc_ack : std_logic_vector(120 downto 0);
  signal lc_data : std_logic_vector(967 downto 0);
  signal lc_req : std_logic_vector(120 downto 0);
  signal lc_tag : std_logic_vector(967 downto 0);
  signal lr_ack : std_logic_vector(120 downto 0);
  signal lr_addr : std_logic_vector(1935 downto 0);
  signal lr_req : std_logic_vector(120 downto 0);
  signal lr_tag : std_logic_vector(967 downto 0);
  signal sc_req : std_logic_vector(162 downto 0);
  signal sr_ack : std_logic_vector(162 downto 0);
  signal sr_addr : std_logic_vector(2607 downto 0);
  signal sr_data : std_logic_vector(1303 downto 0);
  signal sr_req : std_logic_vector(162 downto 0);
  signal sr_tag : std_logic_vector(1303 downto 0);
  signal start_cp_LambdaIn : BooleanArray(292 downto 1);
  signal start_cp_LambdaOut : BooleanArray(294 downto 1);
  signal start_dp_SigmaIn : BooleanArray(294 downto 1);
  signal start_dp_SigmaOut : BooleanArray(292 downto 1);
  signal start_dp_call_dpe_183_ack : std_logic;
  signal start_dp_call_dpe_183_data : std_logic_vector(0 downto 0);
  signal start_dp_call_dpe_183_req : std_logic;
  signal start_dp_call_dpe_185_ack : std_logic;
  signal start_dp_call_dpe_185_data : std_logic_vector(0 downto 0);
  signal start_dp_call_dpe_185_req : std_logic;
  signal start_dp_call_dpe_188_ack : std_logic;
  signal start_dp_call_dpe_188_data : std_logic_vector(0 downto 0);
  signal start_dp_call_dpe_188_req : std_logic;
  signal start_dp_return_dpe_183_ack : std_logic;
  signal start_dp_return_dpe_183_data : std_logic_vector(32 downto 0);
  signal start_dp_return_dpe_183_req : std_logic;
  signal start_dp_return_dpe_185_ack : std_logic;
  signal start_dp_return_dpe_185_data : std_logic_vector(32 downto 0);
  signal start_dp_return_dpe_185_req : std_logic;
  signal start_dp_return_dpe_188_ack : std_logic;
  signal start_dp_return_dpe_188_data : std_logic_vector(16 downto 0);
  signal start_dp_return_dpe_188_req : std_logic;
  signal test_floats_arbiter_call_acks : std_logic_vector(0 downto 0);
  signal test_floats_arbiter_call_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal test_floats_arbiter_call_mack : std_logic;
  signal test_floats_arbiter_call_mdata : std_logic_vector(0 downto 0);
  signal test_floats_arbiter_call_mreq : std_logic;
  signal test_floats_arbiter_call_mtag : std_logic_vector(3 downto 0);
  signal test_floats_arbiter_call_reqs : std_logic_vector(0 downto 0);
  signal test_floats_arbiter_return_acks : std_logic_vector(0 downto 0);
  signal test_floats_arbiter_return_data : StdLogicArray2D(0 downto 0, 32 downto 0);
  signal test_floats_arbiter_return_mack : std_logic;
  signal test_floats_arbiter_return_mdata : std_logic_vector(32 downto 0);
  signal test_floats_arbiter_return_mreq : std_logic;
  signal test_floats_arbiter_return_mtag : std_logic_vector(3 downto 0);
  signal test_floats_arbiter_return_reqs : std_logic_vector(0 downto 0);
  signal test_floats_cp_LambdaIn : BooleanArray(323 downto 1);
  signal test_floats_cp_LambdaOut : BooleanArray(323 downto 1);
  signal test_floats_dp_SigmaIn : BooleanArray(323 downto 1);
  signal test_floats_dp_SigmaOut : BooleanArray(323 downto 1);
  signal test_floats_dp_call_ack : std_logic;
  signal test_floats_dp_call_data : std_logic_vector(0 downto 0);
  signal test_floats_dp_call_req : std_logic;
  signal test_floats_dp_call_tag : std_logic_vector(3 downto 0);
  signal test_floats_dp_return_ack : std_logic;
  signal test_floats_dp_return_data : std_logic_vector(32 downto 0);
  signal test_floats_dp_return_req : std_logic;
  signal test_floats_dp_return_tag : std_logic_vector(3 downto 0);
  signal test_ints_arbiter_call_acks : std_logic_vector(0 downto 0);
  signal test_ints_arbiter_call_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal test_ints_arbiter_call_mack : std_logic;
  signal test_ints_arbiter_call_mdata : std_logic_vector(0 downto 0);
  signal test_ints_arbiter_call_mreq : std_logic;
  signal test_ints_arbiter_call_mtag : std_logic_vector(3 downto 0);
  signal test_ints_arbiter_call_reqs : std_logic_vector(0 downto 0);
  signal test_ints_arbiter_return_acks : std_logic_vector(0 downto 0);
  signal test_ints_arbiter_return_data : StdLogicArray2D(0 downto 0, 32 downto 0);
  signal test_ints_arbiter_return_mack : std_logic;
  signal test_ints_arbiter_return_mdata : std_logic_vector(32 downto 0);
  signal test_ints_arbiter_return_mreq : std_logic;
  signal test_ints_arbiter_return_mtag : std_logic_vector(3 downto 0);
  signal test_ints_arbiter_return_reqs : std_logic_vector(0 downto 0);
  signal test_ints_cp_LambdaIn : BooleanArray(355 downto 1);
  signal test_ints_cp_LambdaOut : BooleanArray(355 downto 1);
  signal test_ints_dp_SigmaIn : BooleanArray(355 downto 1);
  signal test_ints_dp_SigmaOut : BooleanArray(355 downto 1);
  signal test_ints_dp_call_ack : std_logic;
  signal test_ints_dp_call_data : std_logic_vector(0 downto 0);
  signal test_ints_dp_call_req : std_logic;
  signal test_ints_dp_call_tag : std_logic_vector(3 downto 0);
  signal test_ints_dp_return_ack : std_logic;
  signal test_ints_dp_return_data : std_logic_vector(32 downto 0);
  signal test_ints_dp_return_req : std_logic;
  signal test_ints_dp_return_tag : std_logic_vector(3 downto 0);
  signal test_shorts_arbiter_call_acks : std_logic_vector(0 downto 0);
  signal test_shorts_arbiter_call_data : StdLogicArray2D(0 downto 0, 0 downto 0);
  signal test_shorts_arbiter_call_mack : std_logic;
  signal test_shorts_arbiter_call_mdata : std_logic_vector(0 downto 0);
  signal test_shorts_arbiter_call_mreq : std_logic;
  signal test_shorts_arbiter_call_mtag : std_logic_vector(3 downto 0);
  signal test_shorts_arbiter_call_reqs : std_logic_vector(0 downto 0);
  signal test_shorts_arbiter_return_acks : std_logic_vector(0 downto 0);
  signal test_shorts_arbiter_return_data : StdLogicArray2D(0 downto 0, 16 downto 0);
  signal test_shorts_arbiter_return_mack : std_logic;
  signal test_shorts_arbiter_return_mdata : std_logic_vector(16 downto 0);
  signal test_shorts_arbiter_return_mreq : std_logic;
  signal test_shorts_arbiter_return_mtag : std_logic_vector(3 downto 0);
  signal test_shorts_arbiter_return_reqs : std_logic_vector(0 downto 0);
  signal test_shorts_cp_LambdaIn : BooleanArray(355 downto 1);
  signal test_shorts_cp_LambdaOut : BooleanArray(355 downto 1);
  signal test_shorts_dp_SigmaIn : BooleanArray(355 downto 1);
  signal test_shorts_dp_SigmaOut : BooleanArray(355 downto 1);
  signal test_shorts_dp_call_ack : std_logic;
  signal test_shorts_dp_call_data : std_logic_vector(0 downto 0);
  signal test_shorts_dp_call_req : std_logic;
  signal test_shorts_dp_call_tag : std_logic_vector(3 downto 0);
  signal test_shorts_dp_return_ack : std_logic;
  signal test_shorts_dp_return_data : std_logic_vector(16 downto 0);
  signal test_shorts_dp_return_req : std_logic;
  signal test_shorts_dp_return_tag : std_logic_vector(3 downto 0);

  component start_cp is
    port(
      LambdaIn : in BooleanArray(292 downto 1);
      LambdaOut : out BooleanArray(294 downto 1);
      clk : in std_logic;
      reset : in std_logic);
  end component;

  component start_dp is
    port(
      SigmaIn : in BooleanArray(294 downto 1);
      SigmaOut : out BooleanArray(292 downto 1);
      call_ack : out std_logic;
      call_data : in std_logic_vector(0 downto 0);
      call_dpe_183_ack : in std_logic;
      call_dpe_183_data : out std_logic_vector(0 downto 0);
      call_dpe_183_req : out std_logic;
      call_dpe_185_ack : in std_logic;
      call_dpe_185_data : out std_logic_vector(0 downto 0);
      call_dpe_185_req : out std_logic;
      call_dpe_188_ack : in std_logic;
      call_dpe_188_data : out std_logic_vector(0 downto 0);
      call_dpe_188_req : out std_logic;
      call_req : in std_logic;
      call_tag : in std_logic_vector(3 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      return_ack : in std_logic;
      return_data : out std_logic_vector(32 downto 0);
      return_dpe_183_ack : in std_logic;
      return_dpe_183_data : in std_logic_vector(32 downto 0);
      return_dpe_183_req : out std_logic;
      return_dpe_185_ack : in std_logic;
      return_dpe_185_data : in std_logic_vector(32 downto 0);
      return_dpe_185_req : out std_logic;
      return_dpe_188_ack : in std_logic;
      return_dpe_188_data : in std_logic_vector(16 downto 0);
      return_dpe_188_req : out std_logic;
      return_req : out std_logic;
      return_tag : out std_logic_vector(3 downto 0);
      sr_ack : in std_logic_vector(59 downto 0);
      sr_addr : out std_logic_vector(959 downto 0);
      sr_data : out std_logic_vector(479 downto 0);
      sr_req : out std_logic_vector(59 downto 0);
      sr_tag : out std_logic_vector(479 downto 0));
  end component;

  component start_ln is
    port(
      clk : in std_logic;
      reset : in std_logic;
      start_cp_LambdaIn : out BooleanArray(292 downto 1);
      start_cp_LambdaOut : in BooleanArray(294 downto 1);
      start_dp_SigmaIn : out BooleanArray(294 downto 1);
      start_dp_SigmaOut : in BooleanArray(292 downto 1));
  end component;

  component test_floats_cp is
    port(
      LambdaIn : in BooleanArray(323 downto 1);
      LambdaOut : out BooleanArray(323 downto 1);
      clk : in std_logic;
      reset : in std_logic);
  end component;

  component test_floats_dp is
    port(
      SigmaIn : in BooleanArray(323 downto 1);
      SigmaOut : out BooleanArray(323 downto 1);
      call_ack : out std_logic;
      call_data : in std_logic_vector(0 downto 0);
      call_req : in std_logic;
      call_tag : in std_logic_vector(3 downto 0);
      clk : in std_logic;
      lc_ack : in std_logic_vector(47 downto 0);
      lc_data : in std_logic_vector(383 downto 0);
      lc_req : out std_logic_vector(47 downto 0);
      lc_tag : in std_logic_vector(383 downto 0);
      lr_ack : in std_logic_vector(47 downto 0);
      lr_addr : out std_logic_vector(767 downto 0);
      lr_req : out std_logic_vector(47 downto 0);
      lr_tag : out std_logic_vector(383 downto 0);
      reset : in std_logic;
      return_ack : in std_logic;
      return_data : out std_logic_vector(32 downto 0);
      return_req : out std_logic;
      return_tag : out std_logic_vector(3 downto 0);
      sr_ack : in std_logic_vector(35 downto 0);
      sr_addr : out std_logic_vector(575 downto 0);
      sr_data : out std_logic_vector(287 downto 0);
      sr_req : out std_logic_vector(35 downto 0);
      sr_tag : out std_logic_vector(287 downto 0));
  end component;

  component test_floats_ln is
    port(
      clk : in std_logic;
      reset : in std_logic;
      test_floats_cp_LambdaIn : out BooleanArray(323 downto 1);
      test_floats_cp_LambdaOut : in BooleanArray(323 downto 1);
      test_floats_dp_SigmaIn : out BooleanArray(323 downto 1);
      test_floats_dp_SigmaOut : in BooleanArray(323 downto 1));
  end component;

  component test_ints_cp is
    port(
      LambdaIn : in BooleanArray(355 downto 1);
      LambdaOut : out BooleanArray(355 downto 1);
      clk : in std_logic;
      reset : in std_logic);
  end component;

  component test_ints_dp is
    port(
      SigmaIn : in BooleanArray(355 downto 1);
      SigmaOut : out BooleanArray(355 downto 1);
      call_ack : out std_logic;
      call_data : in std_logic_vector(0 downto 0);
      call_req : in std_logic;
      call_tag : in std_logic_vector(3 downto 0);
      clk : in std_logic;
      lc_ack : in std_logic_vector(47 downto 0);
      lc_data : in std_logic_vector(383 downto 0);
      lc_req : out std_logic_vector(47 downto 0);
      lc_tag : in std_logic_vector(383 downto 0);
      lr_ack : in std_logic_vector(47 downto 0);
      lr_addr : out std_logic_vector(767 downto 0);
      lr_req : out std_logic_vector(47 downto 0);
      lr_tag : out std_logic_vector(383 downto 0);
      reset : in std_logic;
      return_ack : in std_logic;
      return_data : out std_logic_vector(32 downto 0);
      return_req : out std_logic;
      return_tag : out std_logic_vector(3 downto 0);
      sr_ack : in std_logic_vector(43 downto 0);
      sr_addr : out std_logic_vector(703 downto 0);
      sr_data : out std_logic_vector(351 downto 0);
      sr_req : out std_logic_vector(43 downto 0);
      sr_tag : out std_logic_vector(351 downto 0));
  end component;

  component test_ints_ln is
    port(
      clk : in std_logic;
      reset : in std_logic;
      test_ints_cp_LambdaIn : out BooleanArray(355 downto 1);
      test_ints_cp_LambdaOut : in BooleanArray(355 downto 1);
      test_ints_dp_SigmaIn : out BooleanArray(355 downto 1);
      test_ints_dp_SigmaOut : in BooleanArray(355 downto 1));
  end component;

  component test_shorts_cp is
    port(
      LambdaIn : in BooleanArray(355 downto 1);
      LambdaOut : out BooleanArray(355 downto 1);
      clk : in std_logic;
      reset : in std_logic);
  end component;

  component test_shorts_dp is
    port(
      SigmaIn : in BooleanArray(355 downto 1);
      SigmaOut : out BooleanArray(355 downto 1);
      call_ack : out std_logic;
      call_data : in std_logic_vector(0 downto 0);
      call_req : in std_logic;
      call_tag : in std_logic_vector(3 downto 0);
      clk : in std_logic;
      lc_ack : in std_logic_vector(23 downto 0);
      lc_data : in std_logic_vector(191 downto 0);
      lc_req : out std_logic_vector(23 downto 0);
      lc_tag : in std_logic_vector(191 downto 0);
      lr_ack : in std_logic_vector(23 downto 0);
      lr_addr : out std_logic_vector(383 downto 0);
      lr_req : out std_logic_vector(23 downto 0);
      lr_tag : out std_logic_vector(191 downto 0);
      reset : in std_logic;
      return_ack : in std_logic;
      return_data : out std_logic_vector(16 downto 0);
      return_req : out std_logic;
      return_tag : out std_logic_vector(3 downto 0);
      sr_ack : in std_logic_vector(21 downto 0);
      sr_addr : out std_logic_vector(351 downto 0);
      sr_data : out std_logic_vector(175 downto 0);
      sr_req : out std_logic_vector(21 downto 0);
      sr_tag : out std_logic_vector(175 downto 0));
  end component;

  component test_shorts_ln is
    port(
      clk : in std_logic;
      reset : in std_logic;
      test_shorts_cp_LambdaIn : out BooleanArray(355 downto 1);
      test_shorts_cp_LambdaOut : in BooleanArray(355 downto 1);
      test_shorts_dp_SigmaIn : out BooleanArray(355 downto 1);
      test_shorts_dp_SigmaOut : in BooleanArray(355 downto 1));
  end component;


begin

  sc_req <= (others => '1');
  lr_req(0) <= env_lr_req;
  env_lr_ack <= lr_ack(0);
  lr_addr(15 downto 0) <= env_lr_addr;
  lr_tag(7 downto 0) <= env_lr_tag;
  
  lc_req(0) <= env_lc_req;
  env_lc_ack <= lc_ack(0);
  env_lc_data <= lc_data(7 downto 0);
  env_lc_tag <= lc_tag(7 downto 0);
  
  sr_req(0) <= env_sr_req;
  env_sr_ack <= sr_ack(0);
  sr_addr(15 downto 0) <= env_sr_addr;
  sr_data(7 downto 0) <= env_sr_data;
  sr_tag(7 downto 0) <= env_sr_tag;
  
  start_cp_inst : start_cp -- 
  -- configuration: 
    port map(
      LambdaIn => start_cp_LambdaIn,
      LambdaOut => start_cp_LambdaOut,
      clk => clk,
      reset => reset);

  start_dp_inst : start_dp -- 
  -- configuration: start_dp_config
    port map(
      SigmaIn => start_dp_SigmaIn,
      SigmaOut => start_dp_SigmaOut,
      call_ack => env_call_ack,
      call_data => env_call_data,
      call_dpe_183_ack => start_dp_call_dpe_183_ack,
      call_dpe_183_data => start_dp_call_dpe_183_data,
      call_dpe_183_req => start_dp_call_dpe_183_req,
      call_dpe_185_ack => start_dp_call_dpe_185_ack,
      call_dpe_185_data => start_dp_call_dpe_185_data,
      call_dpe_185_req => start_dp_call_dpe_185_req,
      call_dpe_188_ack => start_dp_call_dpe_188_ack,
      call_dpe_188_data => start_dp_call_dpe_188_data,
      call_dpe_188_req => start_dp_call_dpe_188_req,
      call_req => env_call_req,
      call_tag => env_call_tag,
      clk => clk,
      reset => reset,
      return_ack => env_return_ack,
      return_data => env_return_data,
      return_dpe_183_ack => start_dp_return_dpe_183_ack,
      return_dpe_183_data => start_dp_return_dpe_183_data,
      return_dpe_183_req => start_dp_return_dpe_183_req,
      return_dpe_185_ack => start_dp_return_dpe_185_ack,
      return_dpe_185_data => start_dp_return_dpe_185_data,
      return_dpe_185_req => start_dp_return_dpe_185_req,
      return_dpe_188_ack => start_dp_return_dpe_188_ack,
      return_dpe_188_data => start_dp_return_dpe_188_data,
      return_dpe_188_req => start_dp_return_dpe_188_req,
      return_req => env_return_req,
      return_tag => env_return_tag,
      sr_ack => sr_ack(60 downto 1),
      sr_addr => sr_addr(975 downto 16),
      sr_data => sr_data(487 downto 8),
      sr_req => sr_req(60 downto 1),
      sr_tag => sr_tag(487 downto 8));

  start_ln_inst : start_ln -- 
  -- configuration: 
    port map(
      clk => clk,
      reset => reset,
      start_cp_LambdaIn => start_cp_LambdaIn,
      start_cp_LambdaOut => start_cp_LambdaOut,
      start_dp_SigmaIn => start_dp_SigmaIn,
      start_dp_SigmaOut => start_dp_SigmaOut);

  test_floats_cp_inst : test_floats_cp -- 
  -- configuration: 
    port map(
      LambdaIn => test_floats_cp_LambdaIn,
      LambdaOut => test_floats_cp_LambdaOut,
      clk => clk,
      reset => reset);

  test_floats_dp_inst : test_floats_dp -- 
  -- configuration: test_floats_dp_config
    port map(
      SigmaIn => test_floats_dp_SigmaIn,
      SigmaOut => test_floats_dp_SigmaOut,
      call_ack => test_floats_dp_call_ack,
      call_data => test_floats_dp_call_data,
      call_req => test_floats_dp_call_req,
      call_tag => test_floats_dp_call_tag,
      clk => clk,
      lc_ack => lc_ack(48 downto 1),
      lc_data => lc_data(391 downto 8),
      lc_req => lc_req(48 downto 1),
      lc_tag => lc_tag(391 downto 8),
      lr_ack => lr_ack(48 downto 1),
      lr_addr => lr_addr(783 downto 16),
      lr_req => lr_req(48 downto 1),
      lr_tag => lr_tag(391 downto 8),
      reset => reset,
      return_ack => test_floats_dp_return_ack,
      return_data => test_floats_dp_return_data,
      return_req => test_floats_dp_return_req,
      return_tag => test_floats_dp_return_tag,
      sr_ack => sr_ack(96 downto 61),
      sr_addr => sr_addr(1551 downto 976),
      sr_data => sr_data(775 downto 488),
      sr_req => sr_req(96 downto 61),
      sr_tag => sr_tag(775 downto 488));

  test_floats_ln_inst : test_floats_ln -- 
  -- configuration: 
    port map(
      clk => clk,
      reset => reset,
      test_floats_cp_LambdaIn => test_floats_cp_LambdaIn,
      test_floats_cp_LambdaOut => test_floats_cp_LambdaOut,
      test_floats_dp_SigmaIn => test_floats_dp_SigmaIn,
      test_floats_dp_SigmaOut => test_floats_dp_SigmaOut);

  test_floats_dp_call_req <= test_floats_arbiter_call_mreq;
  test_floats_arbiter_call_mack <= test_floats_dp_call_ack;
  test_floats_dp_call_data <= test_floats_arbiter_call_mdata;
  test_floats_dp_call_tag <= test_floats_arbiter_call_mtag;

  test_floats_arbiter_return_mreq <= test_floats_dp_return_req;
  test_floats_dp_return_ack <= test_floats_arbiter_return_mack;
  test_floats_arbiter_return_mdata <= test_floats_dp_return_data;
  test_floats_arbiter_return_mtag <= test_floats_dp_return_tag;

  test_floats_arbiter_call_reqs(0) <= start_dp_call_dpe_185_req;
  start_dp_call_dpe_185_ack <= test_floats_arbiter_call_acks(0);
  test_floats_arbiter_return_reqs(0) <= start_dp_return_dpe_185_req;
  start_dp_return_dpe_185_ack <= test_floats_arbiter_return_acks(0);
  start_dp_return_dpe_185_data <= extract(test_floats_arbiter_return_data, 0);

  unflatten(test_floats_arbiter_call_data,
    start_dp_call_dpe_185_data);
  test_floats_arbiter : CallArbiter -- 
  -- configuration: 
    port map(
      call_acks => test_floats_arbiter_call_acks,
      call_data => test_floats_arbiter_call_data,
      call_mack => test_floats_arbiter_call_mack,
      call_mdata => test_floats_arbiter_call_mdata,
      call_mreq => test_floats_arbiter_call_mreq,
      call_mtag => test_floats_arbiter_call_mtag,
      call_reqs => test_floats_arbiter_call_reqs,
      clk => clk,
      reset => reset,
      return_acks => test_floats_arbiter_return_acks,
      return_data => test_floats_arbiter_return_data,
      return_mack => test_floats_arbiter_return_mack,
      return_mdata => test_floats_arbiter_return_mdata,
      return_mreq => test_floats_arbiter_return_mreq,
      return_mtag => test_floats_arbiter_return_mtag,
      return_reqs => test_floats_arbiter_return_reqs);

  test_ints_cp_inst : test_ints_cp -- 
  -- configuration: 
    port map(
      LambdaIn => test_ints_cp_LambdaIn,
      LambdaOut => test_ints_cp_LambdaOut,
      clk => clk,
      reset => reset);

  test_ints_dp_inst : test_ints_dp -- 
  -- configuration: test_ints_dp_config
    port map(
      SigmaIn => test_ints_dp_SigmaIn,
      SigmaOut => test_ints_dp_SigmaOut,
      call_ack => test_ints_dp_call_ack,
      call_data => test_ints_dp_call_data,
      call_req => test_ints_dp_call_req,
      call_tag => test_ints_dp_call_tag,
      clk => clk,
      lc_ack => lc_ack(96 downto 49),
      lc_data => lc_data(775 downto 392),
      lc_req => lc_req(96 downto 49),
      lc_tag => lc_tag(775 downto 392),
      lr_ack => lr_ack(96 downto 49),
      lr_addr => lr_addr(1551 downto 784),
      lr_req => lr_req(96 downto 49),
      lr_tag => lr_tag(775 downto 392),
      reset => reset,
      return_ack => test_ints_dp_return_ack,
      return_data => test_ints_dp_return_data,
      return_req => test_ints_dp_return_req,
      return_tag => test_ints_dp_return_tag,
      sr_ack => sr_ack(140 downto 97),
      sr_addr => sr_addr(2255 downto 1552),
      sr_data => sr_data(1127 downto 776),
      sr_req => sr_req(140 downto 97),
      sr_tag => sr_tag(1127 downto 776));

  test_ints_ln_inst : test_ints_ln -- 
  -- configuration: 
    port map(
      clk => clk,
      reset => reset,
      test_ints_cp_LambdaIn => test_ints_cp_LambdaIn,
      test_ints_cp_LambdaOut => test_ints_cp_LambdaOut,
      test_ints_dp_SigmaIn => test_ints_dp_SigmaIn,
      test_ints_dp_SigmaOut => test_ints_dp_SigmaOut);

  test_ints_dp_call_req <= test_ints_arbiter_call_mreq;
  test_ints_arbiter_call_mack <= test_ints_dp_call_ack;
  test_ints_dp_call_data <= test_ints_arbiter_call_mdata;
  test_ints_dp_call_tag <= test_ints_arbiter_call_mtag;

  test_ints_arbiter_return_mreq <= test_ints_dp_return_req;
  test_ints_dp_return_ack <= test_ints_arbiter_return_mack;
  test_ints_arbiter_return_mdata <= test_ints_dp_return_data;
  test_ints_arbiter_return_mtag <= test_ints_dp_return_tag;

  test_ints_arbiter_call_reqs(0) <= start_dp_call_dpe_183_req;
  start_dp_call_dpe_183_ack <= test_ints_arbiter_call_acks(0);
  test_ints_arbiter_return_reqs(0) <= start_dp_return_dpe_183_req;
  start_dp_return_dpe_183_ack <= test_ints_arbiter_return_acks(0);
  start_dp_return_dpe_183_data <= extract(test_ints_arbiter_return_data, 0);

  unflatten(test_ints_arbiter_call_data,
    start_dp_call_dpe_183_data);
  test_ints_arbiter : CallArbiter -- 
  -- configuration: 
    port map(
      call_acks => test_ints_arbiter_call_acks,
      call_data => test_ints_arbiter_call_data,
      call_mack => test_ints_arbiter_call_mack,
      call_mdata => test_ints_arbiter_call_mdata,
      call_mreq => test_ints_arbiter_call_mreq,
      call_mtag => test_ints_arbiter_call_mtag,
      call_reqs => test_ints_arbiter_call_reqs,
      clk => clk,
      reset => reset,
      return_acks => test_ints_arbiter_return_acks,
      return_data => test_ints_arbiter_return_data,
      return_mack => test_ints_arbiter_return_mack,
      return_mdata => test_ints_arbiter_return_mdata,
      return_mreq => test_ints_arbiter_return_mreq,
      return_mtag => test_ints_arbiter_return_mtag,
      return_reqs => test_ints_arbiter_return_reqs);

  test_shorts_cp_inst : test_shorts_cp -- 
  -- configuration: 
    port map(
      LambdaIn => test_shorts_cp_LambdaIn,
      LambdaOut => test_shorts_cp_LambdaOut,
      clk => clk,
      reset => reset);

  test_shorts_dp_inst : test_shorts_dp -- 
  -- configuration: test_shorts_dp_config
    port map(
      SigmaIn => test_shorts_dp_SigmaIn,
      SigmaOut => test_shorts_dp_SigmaOut,
      call_ack => test_shorts_dp_call_ack,
      call_data => test_shorts_dp_call_data,
      call_req => test_shorts_dp_call_req,
      call_tag => test_shorts_dp_call_tag,
      clk => clk,
      lc_ack => lc_ack(120 downto 97),
      lc_data => lc_data(967 downto 776),
      lc_req => lc_req(120 downto 97),
      lc_tag => lc_tag(967 downto 776),
      lr_ack => lr_ack(120 downto 97),
      lr_addr => lr_addr(1935 downto 1552),
      lr_req => lr_req(120 downto 97),
      lr_tag => lr_tag(967 downto 776),
      reset => reset,
      return_ack => test_shorts_dp_return_ack,
      return_data => test_shorts_dp_return_data,
      return_req => test_shorts_dp_return_req,
      return_tag => test_shorts_dp_return_tag,
      sr_ack => sr_ack(162 downto 141),
      sr_addr => sr_addr(2607 downto 2256),
      sr_data => sr_data(1303 downto 1128),
      sr_req => sr_req(162 downto 141),
      sr_tag => sr_tag(1303 downto 1128));

  test_shorts_ln_inst : test_shorts_ln -- 
  -- configuration: 
    port map(
      clk => clk,
      reset => reset,
      test_shorts_cp_LambdaIn => test_shorts_cp_LambdaIn,
      test_shorts_cp_LambdaOut => test_shorts_cp_LambdaOut,
      test_shorts_dp_SigmaIn => test_shorts_dp_SigmaIn,
      test_shorts_dp_SigmaOut => test_shorts_dp_SigmaOut);

  test_shorts_dp_call_req <= test_shorts_arbiter_call_mreq;
  test_shorts_arbiter_call_mack <= test_shorts_dp_call_ack;
  test_shorts_dp_call_data <= test_shorts_arbiter_call_mdata;
  test_shorts_dp_call_tag <= test_shorts_arbiter_call_mtag;

  test_shorts_arbiter_return_mreq <= test_shorts_dp_return_req;
  test_shorts_dp_return_ack <= test_shorts_arbiter_return_mack;
  test_shorts_arbiter_return_mdata <= test_shorts_dp_return_data;
  test_shorts_arbiter_return_mtag <= test_shorts_dp_return_tag;

  test_shorts_arbiter_call_reqs(0) <= start_dp_call_dpe_188_req;
  start_dp_call_dpe_188_ack <= test_shorts_arbiter_call_acks(0);
  test_shorts_arbiter_return_reqs(0) <= start_dp_return_dpe_188_req;
  start_dp_return_dpe_188_ack <= test_shorts_arbiter_return_acks(0);
  start_dp_return_dpe_188_data <= extract(test_shorts_arbiter_return_data, 0);

  unflatten(test_shorts_arbiter_call_data,
    start_dp_call_dpe_188_data);
  test_shorts_arbiter : CallArbiter -- 
  -- configuration: 
    port map(
      call_acks => test_shorts_arbiter_call_acks,
      call_data => test_shorts_arbiter_call_data,
      call_mack => test_shorts_arbiter_call_mack,
      call_mdata => test_shorts_arbiter_call_mdata,
      call_mreq => test_shorts_arbiter_call_mreq,
      call_mtag => test_shorts_arbiter_call_mtag,
      call_reqs => test_shorts_arbiter_call_reqs,
      clk => clk,
      reset => reset,
      return_acks => test_shorts_arbiter_return_acks,
      return_data => test_shorts_arbiter_return_data,
      return_mack => test_shorts_arbiter_return_mack,
      return_mdata => test_shorts_arbiter_return_mdata,
      return_mreq => test_shorts_arbiter_return_mreq,
      return_mtag => test_shorts_arbiter_return_mtag,
      return_reqs => test_shorts_arbiter_return_reqs);

  memory_subsystem_inst : memory_subsystem -- system memory
  -- configuration: 
    generic map(
      addr_width => 16,
      base_bank_addr_width => 8,
      base_bank_data_width => 8,
      data_width => 8,
      demux_degree => 2,
      mux_degree => 2,
      num_loads => 121,
      num_stores => 163,
      number_of_banks => 1,
      tag_width => 8)
    port map(
      clock => clk,
      lc_ack_out => lc_ack,
      lc_data_out => lc_data,
      lc_req_in => lc_req,
      lc_tag_out => lc_tag,
      lr_ack_out => lr_ack,
      lr_addr_in => lr_addr,
      lr_req_in => lr_req,
      lr_tag_in => lr_tag,
      reset => reset,
      sc_req_in => sc_req,
      sr_ack_out => sr_ack,
      sr_addr_in => sr_addr,
      sr_data_in => sr_data,
      sr_req_in => sr_req,
      sr_tag_in => sr_tag);


end default_arch;