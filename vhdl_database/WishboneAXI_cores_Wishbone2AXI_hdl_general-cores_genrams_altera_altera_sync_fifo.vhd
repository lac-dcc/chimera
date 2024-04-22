-------------------------------------------------------------------------------
-- Title      : Parametrizable synchronous FIFO (Altera version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_sync_fifo.vhd
-- Author     : Tomasz Wlostowski
-- Company    : CERN BE-CO-HT
-- Created    : 2011-01-25
-- Last update: 2011-01-25
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

library altera_mf;
use altera_mf.all;

use work.genram_pkg.all;

entity altera_sync_fifo is

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

    g_almost_empty_threshold : integer;  -- threshold for almost empty flag
    g_almost_full_threshold  : integer   -- threshold for almost full flag
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

end altera_sync_fifo;

architecture syn of altera_sync_fifo is

  component scfifo
    generic (
      add_ram_output_register : string;
      almost_empty_value      : natural;
      almost_full_value       : natural;
      lpm_numwords            : natural;
      lpm_showahead           : string;
      lpm_type                : string;
      lpm_width               : natural;
      lpm_widthu              : natural;
      overflow_checking       : string;
      underflow_checking      : string;
      use_eab                 : string);
    port (
      clock        : in  std_logic;
      sclr         : in  std_logic;
      usedw        : out std_logic_vector (f_log2_size(g_size)-1 downto 0);
      empty        : out std_logic;
      full         : out std_logic;
      q            : out std_logic_vector (g_data_width-1 downto 0);
      wrreq        : in  std_logic;
      almost_empty : out std_logic;
      almost_full  : out std_logic;
      data         : in  std_logic_vector (g_data_width-1 downto 0);
      rdreq        : in  std_logic);
  end component;

  function f_bool_2_string (x : boolean) return string is
  begin
    if(x) then
      return "ON";
    else
      return "OFF";
    end if;
  end f_bool_2_string;

  signal empty        : std_logic;
  signal almost_empty : std_logic;
  signal almost_full  : std_logic;
  signal sclr         : std_logic;
  signal full         : std_logic;
  signal usedw        : std_logic_vector (f_log2_size(g_size)-1 downto 0);
  
begin  -- syn

  sclr <= not rst_n_i;

  scfifo_inst: scfifo
    generic map (
      add_ram_output_register => "OFF",
      almost_empty_value      => g_almost_empty_threshold,
      almost_full_value       => g_almost_full_threshold, 
      lpm_numwords            => g_size,
      lpm_showahead           => f_bool_2_string(g_show_ahead),
      lpm_type                => "scfifo",
      lpm_width               => g_data_width,
      lpm_widthu              => f_log2_size(g_size),
      overflow_checking       => "ON",
      underflow_checking      => "ON",
      use_eab                 => "ON" )
    port map (
      clock        => clk_i,
      sclr         => sclr,
      usedw        => usedw,
      empty        => empty,
      full         => full,
      q            => q_o,
      wrreq        => we_i,
      almost_empty => almost_empty,
      almost_full  => almost_full,
      data         => d_i,
      rdreq        => rd_i);

  count_o <= usedw;
  empty_o <= empty;
  full_o <= full;
  almost_empty_o <= almost_empty;
  almost_full_o <= almost_full;

end syn;
