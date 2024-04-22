-------------------------------------------------------------------------------
-- Title      : Parametrizable synchronous FIFO (Xilinx version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_sync_fifo.vhd
-- Author     : Tomasz Wlostowski
-- Company    : CERN BE-CO-HT
-- Created    : 2011-01-25
-- Last update: 2012-07-03
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Single-clock FIFO.
-- - configurable data width and size
-- - "show ahead" mode
-- - configurable full/empty/almost full/almost empty/word count signals
-------------------------------------------------------------------------------
-- Copyright (c) 2011 CERN
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2011-01-25  1.0      twlostow        Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.genram_pkg.all;
use work.s7_fifo_pkg.all;

entity generic_sync_fifo is

  generic (
    g_data_width : natural;
    g_size       : natural;
    g_show_ahead : boolean := false;

    -- Read-side flag selection
    g_with_empty        : boolean := true;   -- with empty flag
    g_with_full         : boolean := true;   -- with full flag
    g_with_almost_empty : boolean := false;
    g_with_almost_full  : boolean := false;
    g_with_count        : boolean := false;  -- with words counter

    g_with_fifo_inferred : boolean := false;

    g_almost_empty_threshold : integer;  -- threshold for almost empty flag
    g_almost_full_threshold  : integer;  -- threshold for almost full flag
    g_register_flag_outputs  : boolean := true
    );

  port (
    rst_n_i : in std_logic := '1';

    clk_i : in std_logic;
    d_i   : in std_logic_vector(g_data_width-1 downto 0);
    we_i  : in std_logic;

    q_o  : out std_logic_vector(g_data_width-1 downto 0);
    rd_i : in  std_logic;

    empty_o        : out std_logic;
    full_o         : out std_logic;
    almost_empty_o : out std_logic;
    almost_full_o  : out std_logic;
    count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0)
    );

end generic_sync_fifo;

architecture syn of generic_sync_fifo is


  component inferred_sync_fifo
    generic (
      g_data_width             : natural;
      g_size                   : natural;
      g_show_ahead             : boolean;
      g_with_empty             : boolean;
      g_with_full              : boolean;
      g_with_almost_empty      : boolean;
      g_with_almost_full       : boolean;
      g_with_count             : boolean;
      g_almost_empty_threshold : integer;
      g_almost_full_threshold  : integer;
      g_register_flag_outputs  : boolean);
    port (
      rst_n_i        : in  std_logic := '1';
      clk_i          : in  std_logic;
      d_i            : in  std_logic_vector(g_data_width-1 downto 0);
      we_i           : in  std_logic;
      q_o            : out std_logic_vector(g_data_width-1 downto 0);
      rd_i           : in  std_logic;
      empty_o        : out std_logic;
      full_o         : out std_logic;
      almost_empty_o : out std_logic;
      almost_full_o  : out std_logic;
      count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0));
  end component;

  component s7_hwfifo_wrapper
    generic (
      g_data_width             : natural;
      g_size                   : natural;
      g_dual_clock             : boolean;
      g_almost_empty_threshold : integer;
      g_almost_full_threshold  : integer;
      g_with_count             : boolean := true);
    port (
      rst_n_i           : in  std_logic := '1';
      clk_wr_i          : in  std_logic;
      clk_rd_i          : in  std_logic;
      d_i               : in  std_logic_vector(g_data_width-1 downto 0);
      we_i              : in  std_logic;
      q_o               : out std_logic_vector(g_data_width-1 downto 0);
      rd_i              : in  std_logic;
      rd_empty_o        : out std_logic;
      wr_full_o         : out std_logic;
      rd_almost_empty_o : out std_logic;
      wr_almost_full_o  : out std_logic;
      rd_count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0);
      wr_count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0));
  end component;

  constant m : t_s7_fifo_mapping := f_s7_fifo_find_mapping(g_data_width, g_size);

  -- Xilinx defines almost full threshold as number of available empty words in
  -- FIFO (UG363 - Virtex 6 FPGA Memory Resources
  constant c_virtex_almost_full_thr : integer := g_size - g_almost_full_threshold;

begin  -- syn

  gen_inferred : if(m.d_width = 0 or g_with_fifo_inferred) generate
    assert false report "generic_sync_fifo[xilinx]: using inferred BRAM-based FIFO." severity note;

    U_Inferred_FIFO : inferred_sync_fifo
      generic map (
        g_data_width             => g_data_width,
        g_size                   => g_size,
        g_show_ahead             => g_show_ahead,
        g_with_empty             => g_with_empty,
        g_with_full              => g_with_full,
        g_with_almost_empty      => g_with_almost_empty,
        g_with_almost_full       => g_with_almost_full,
        g_with_count             => g_with_count,
        g_almost_empty_threshold => g_almost_empty_threshold,
        g_almost_full_threshold  => g_almost_full_threshold,
        g_register_flag_outputs  => g_register_flag_outputs)

      port map (
        rst_n_i        => rst_n_i,
        clk_i          => clk_i,
        d_i            => d_i,
        we_i           => we_i,
        q_o            => q_o,
        rd_i           => rd_i,
        empty_o        => empty_o,
        full_o         => full_o,
        almost_empty_o => almost_empty_o,
        almost_full_o  => almost_full_o,
        count_o        => count_o);

  end generate gen_inferred;

  gen_native : if(m.d_width > 0 and not g_with_fifo_inferred) generate

    U_Native_FIFO: s7_hwfifo_wrapper
      generic map (
        g_data_width             => g_data_width,
        g_size                   => g_size,
        g_dual_clock             => false,
        g_almost_empty_threshold => f_empty_thr(g_with_almost_empty, g_almost_empty_threshold, g_size),
        g_almost_full_threshold  => f_empty_thr(g_with_almost_full, c_virtex_almost_full_thr, g_size),
        g_with_count             => g_with_count)
      port map (
        rst_n_i           => rst_n_i,
        clk_wr_i          => clk_i,
        clk_rd_i          => clk_i,
        d_i               => d_i,
        we_i              => we_i,
        q_o               => q_o,
        rd_i              => rd_i,
        rd_empty_o        => empty_o,
        wr_full_o         => full_o,
        rd_almost_empty_o => almost_empty_o,
        wr_almost_full_o  => almost_full_o,
        rd_count_o        => count_o,
        wr_count_o        => open);
  end generate gen_native;



end syn;
