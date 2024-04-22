-- (C) 2001-2013 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.auk_dspip_lib_pkg_hpfir.all;
use work.auk_dspip_math_pkg_hpfir.all;

entity mfir_0002_ast is
  generic (
  INWIDTH             : integer := 16;
  FULL_WIDTH          : integer := 37;
  BANKINWIDTH         : integer := 0;
  REM_LSB_BIT_g       : integer := 0;
  REM_LSB_TYPE_g      : string := "Rounding";
  REM_MSB_BIT_g       : integer := 5;
  REM_MSB_TYPE_g      : string := "Truncation";
  PHYSCHANIN          : integer := 1;
  PHYSCHANOUT         : integer := 1;
  CHANSPERPHYIN       : natural := 1;
  CHANSPERPHYOUT      : natural := 1;
  OUTPUTFIFODEPTH     : integer := 16;
  USE_PACKETS         : integer := 0;
  ENABLE_BACKPRESSURE : boolean := false;
  LOG2_CHANSPERPHYOUT : natural := log2_ceil_one(1);
  NUMCHANS            : integer := 1;
  DEVICE_FAMILY       : string := "Cyclone III"
    );
  port(
    clk                : in  std_logic;
    reset_n            : in  std_logic;
    ast_sink_ready     : out std_logic;
    ast_source_data    : out std_logic_vector((FULL_WIDTH - REM_LSB_BIT_g - REM_MSB_BIT_g) * PHYSCHANOUT - 1 downto 0);
    ast_sink_data      : in std_logic_vector( (INWIDTH + BANKINWIDTH) * PHYSCHANIN - 1 downto 0);
    ast_sink_valid     : in  std_logic;
    ast_source_valid   : out std_logic;    
    ast_source_ready   : in  std_logic;
    ast_source_eop     : out std_logic;
    ast_source_sop     : out std_logic;
    ast_source_channel : out std_logic_vector (LOG2_CHANSPERPHYOUT - 1 downto 0);
    ast_sink_eop       : in  std_logic;
    ast_sink_sop       : in  std_logic;
    ast_sink_error     : in  std_logic_vector (1 downto 0);
    ast_source_error   : out std_logic_vector (1 downto 0)
    );
attribute altera_attribute : string;
attribute altera_attribute of mfir_0002_ast:entity is "-name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 10036";
end mfir_0002_ast;

-- Warnings Suppression On
-- altera message_off 10036

architecture struct of mfir_0002_ast is
  
  constant OUTWIDTH          : integer   := FULL_WIDTH - REM_LSB_BIT_g - REM_MSB_BIT_g;

  signal channel_out         : std_logic_vector(LOG2_CHANSPERPHYOUT - 1 downto 0);
  
  signal core_channel_out    : std_logic_vector(2 -1 downto 0);
  signal at_source_channel   : std_logic_vector(2 -1 downto 0);
  signal sink_packet_error   : std_logic_vector(1 downto 0);
  signal data_in             : std_logic_vector((INWIDTH + BANKINWIDTH) * PHYSCHANIN - 1 downto 0);
  signal data_valid          : std_logic_vector(0 downto 0);
  
  signal data_out            : std_logic_vector(OUTWIDTH * PHYSCHANOUT -1 downto 0);
  signal reset_fir           : std_logic;
  signal sink_ready_ctrl     : std_logic;
  signal source_packet_error : std_logic_vector(1 downto 0);
  signal source_stall        : std_logic;
  signal source_valid_ctrl   : std_logic;
  signal stall               : std_logic;
  signal valid               : std_logic;
  signal core_valid          : std_logic;
  signal enable_in           : std_logic_vector(0 downto 0);
  
  signal outp_out            : std_logic_vector(OUTWIDTH * PHYSCHANOUT - 1 downto 0);
  signal outp_blk_valid      : std_logic_vector(PHYSCHANOUT - 1 downto 0);

  signal core_out            : std_logic_vector(FULL_WIDTH * PHYSCHANOUT - 1 downto 0);
  signal core_out_valid      : std_logic_vector(0 downto 0);
  signal core_out_channel    : std_logic_vector(7 downto 0);

  signal core_out_channel_0  : std_logic_vector(7 downto 0);
  
component mfir_0002_rtl is
  port (
    xIn_v              : in std_logic_vector(0 downto 0);
    xIn_c              : in std_logic_vector(7 downto 0);
    xIn_0              : in std_logic_vector(16 - 1 downto 0);
    xOut_v             : out std_logic_vector(0 downto 0);
    xOut_c             : out std_logic_vector(7 downto 0);
    xOut_0             : out std_logic_vector(37 - 1 downto 0);
    clk                : in std_logic;
    areset             : in std_logic
);
end component mfir_0002_rtl;
     
begin
  sink : auk_dspip_avalon_streaming_sink_hpfir
    generic map (
      WIDTH_g          => (INWIDTH + BANKINWIDTH) * PHYSCHANIN,
      DATA_WIDTH       => (INWIDTH + BANKINWIDTH),
      DATA_PORT_COUNT  => PHYSCHANIN,
      PACKET_SIZE_g    => CHANSPERPHYIN)
    port map (
      clk             => clk,
      reset_n         => reset_n,
      data            => data_in,
      data_valid      => data_valid,
      sink_ready_ctrl => sink_ready_ctrl,
      packet_error    => sink_packet_error,
      at_sink_ready   => ast_sink_ready,
      at_sink_valid   => ast_sink_valid,
      at_sink_data    => ast_sink_data,
      at_sink_sop     => ast_sink_sop,
      at_sink_eop     => ast_sink_eop,
      at_sink_error   => ast_sink_error);
  
  source : auk_dspip_avalon_streaming_source_hpfir
    generic map (
      WIDTH_g           => OUTWIDTH * PHYSCHANOUT,
      DATA_WIDTH        => OUTWIDTH,
      DATA_PORT_COUNT   => PHYSCHANOUT,
      FIFO_DEPTH_g      => OUTPUTFIFODEPTH,
      USE_PACKETS       => USE_PACKETS,
      HAVE_COUNTER_g    => false,
      PACKET_SIZE_g     => CHANSPERPHYOUT,
      COUNTER_LIMIT_g   => CHANSPERPHYOUT,
      ENABLE_BACKPRESSURE_g => ENABLE_BACKPRESSURE)
    port map (
      clk               => clk,
      reset_n           => reset_n,
      data_in           => data_out,
      data_count        => channel_out,
      source_valid_ctrl => source_valid_ctrl,
      source_stall      => source_stall,
      packet_error      => source_packet_error,
      at_source_ready   => ast_source_ready,
      at_source_valid   => ast_source_valid,
      at_source_data    => ast_source_data,
      at_source_channel => ast_source_channel,
      at_source_sop     => ast_source_sop,
      at_source_eop     => ast_source_eop,
      at_source_error   => ast_source_error);
   
   
  intf_ctrl : auk_dspip_avalon_streaming_controller_hpfir
    port map (
      clk                 => clk,
      reset_n             => reset_n,
      sink_packet_error   => sink_packet_error,
      source_stall        => source_stall,
      valid               => valid,
      reset_design        => reset_fir,
      sink_ready_ctrl     => sink_ready_ctrl,
      source_packet_error => source_packet_error,
      source_valid_ctrl   => source_valid_ctrl,
      stall               => stall);

hpfircore: mfir_0002_rtl
   port map (
     xIn_v     => data_valid,
     xIn_c     => "00000000",
     xIn_0     => data_in((0 + 16) * 0 + 16 - 1 downto (0 + 16) * 0),
     xOut_v    => core_out_valid,
     xOut_c    => core_out_channel,
     xOut_0   => core_out(37 * 0 + 37 - 1 downto 37 * 0),
     clk       => clk,
     areset    => reset_fir
   );

  gen_outp_blk : for i in PHYSCHANOUT-1 downto 0 generate  
  begin
    outp_blk : auk_dspip_roundsat_hpfir
      generic map (
        IN_WIDTH_g        =>  FULL_WIDTH      ,
        REM_LSB_BIT_g     =>  REM_LSB_BIT_g   ,
        REM_LSB_TYPE_g    =>  REM_LSB_TYPE_g  ,
        REM_MSB_BIT_g     =>  REM_MSB_BIT_g   ,
        REM_MSB_TYPE_g    =>  REM_MSB_TYPE_g
      )
      port map (
        clk               =>  clk,
        reset_n           =>  reset_n,
        enable            =>  core_out_valid(0),
        datain            =>  core_out(((i*FULL_WIDTH)+FULL_WIDTH-1) downto (i*FULL_WIDTH)),
        valid             =>  outp_blk_valid(i),
        dataout           =>  outp_out(((i*OUTWIDTH)+OUTWIDTH-1) downto (i*OUTWIDTH))
      );
  end generate gen_outp_blk;
  
  multi_data_out: for m in PHYSCHANOUT-1 downto 0 generate  
    data_out(((m*OUTWIDTH)+OUTWIDTH-1) downto (m*OUTWIDTH)) <= outp_out(((m*OUTWIDTH)+OUTWIDTH-1) downto (m*OUTWIDTH));
  end generate multi_data_out;

  channel_pipe_lsb: if REM_LSB_TYPE_g = "Rounding" and REM_LSB_BIT_g > 0 generate
  begin
    out_lsb_p : process (clk, reset_n)
    begin
      if reset_n = '0' then
        core_out_channel_0 <= (others => '0');
      elsif rising_edge(clk) then
        core_out_channel_0 <= core_out_channel;
      end if;
    end process out_lsb_p;
  end generate channel_pipe_lsb;
  
  channel_wire_lsb: if REM_LSB_TYPE_g = "Truncation" or REM_LSB_BIT_g = 0 generate
  begin
    core_out_channel_0 <= core_out_channel;
  end generate channel_wire_lsb;  
  
  channel_pipe_msb: if REM_MSB_TYPE_g = "Saturating" and REM_MSB_BIT_g > 0 generate
  begin
    out_p : process (clk, reset_n)
    begin
      if reset_n = '0' then
        channel_out <= (others => '0');
      elsif rising_edge(clk) then
        channel_out <= core_out_channel_0(LOG2_CHANSPERPHYOUT-1 downto 0);
      end if;
    end process out_p;
  end generate channel_pipe_msb;

  channel_wire_msb: if REM_MSB_TYPE_g = "Truncation" or REM_MSB_BIT_g = 0 generate
  begin
    channel_out <= core_out_channel_0(LOG2_CHANSPERPHYOUT-1 downto 0);
  end generate channel_wire_msb;

  valid <= outp_blk_valid(0);
  
  enable_in(0) <= not stall;

end struct;



