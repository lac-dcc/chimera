-------------------------------------------------------------------------------
-- Title      : Parametrizable synchronous FIFO (Xilinx version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_sync_fifo.vhd
-- Author     : Tomasz Wlostowski
-- Company    : CERN BE-CO-HT
-- Created    : 2011-01-25
-- Last update: 2012-10-02
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
use work.v6_fifo_pkg.all;

entity v6_hwfifo_wraper is

  generic (
    g_data_width : natural;
    g_size       : natural;
    g_dual_clock : boolean;
    -- Read-side flag selection

    g_almost_empty_threshold : integer;  -- threshold for almost empty flag
    g_almost_full_threshold  : integer;   -- threshold for almost full flag
    g_with_count  : boolean := true
    );

  port (
    rst_n_i : in std_logic := '1';

    clk_wr_i : in std_logic;
    clk_rd_i : in std_logic;

    d_i  : in std_logic_vector(g_data_width-1 downto 0);
    we_i : in std_logic;

    q_o  : out std_logic_vector(g_data_width-1 downto 0);
    rd_i : in  std_logic;

    rd_empty_o        : out std_logic;
    wr_full_o         : out std_logic;
    rd_almost_empty_o : out std_logic;
    wr_almost_full_o  : out std_logic;
    rd_count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0);
    wr_count_o        : out std_logic_vector(f_log2_size(g_size)-1 downto 0)
    );

end v6_hwfifo_wraper;

architecture syn of v6_hwfifo_wraper is

  constant m : t_v6_fifo_mapping := f_v6_fifo_find_mapping(g_data_width, g_size);


  signal di_wide_18, do_wide_18 : std_logic_vector(35 downto 0);
  signal di_18, do_18           : std_logic_vector(31 downto 0);
  signal dip_18, dop_18         : std_logic_vector(3 downto 0);

  signal di_36, do_36           : std_logic_vector(63 downto 0);
  signal dip_36, dop_36         : std_logic_vector(7 downto 0);
  signal di_wide_36, do_wide_36 : std_logic_vector(79 downto 0);

  signal srst, srstreg          : std_logic;
  signal rd_ptr, wr_ptr : std_logic_vector(12 downto 0);

  function f_bool_2_int (x : boolean) return integer is
  begin
    if(x) then
      return 1;
    else
      return 0;
    end if;
  end f_bool_2_int;

  function f_clamp (x : integer; min_val : integer; max_val : integer)
    return integer is
  begin
    if(x < min_val) then
      return min_val;
    elsif(x > max_val) then
      return max_val;
    else
      return x;
    end if;
  end f_clamp;
  
  
begin  -- syn

  srst <= not rst_n_i;

  srstreg <= '0';
  
  gen_fifo36 : if(m.is_36 and m.d_width > 0) generate
    assert false report "generic_sync_fifo[xilinx]: using FIFO36E1 primitive." severity note;

    di_wide_36 <= std_logic_vector(resize(unsigned(d_i), di_wide_36'length));

    di_36(m.d_width-1 downto 0)   <= di_wide_36(m.d_width-1 downto 0);
    dip_36(m.dp_width-1 downto 0) <= di_wide_36(m.dp_width + m.d_width-1 downto m.d_width);

    do_wide_36 (m.d_width-1 downto 0)                      <= do_36(m.d_width-1 downto 0);
    do_wide_36 (m.d_width + m.dp_width-1 downto m.d_width) <= dop_36(m.dp_width-1 downto 0);

    q_o <= do_wide_36(g_data_width-1 downto 0);

    U_Wrapped_FIFO36 : FIFO36E1
      generic map (
        ALMOST_FULL_OFFSET      => to_bitvector(std_logic_vector(to_unsigned(g_almost_full_threshold, 16))),
        ALMOST_EMPTY_OFFSET     => to_bitvector(std_logic_vector(to_unsigned(g_almost_empty_threshold, 16))),
        DATA_WIDTH              => m.d_width + m.dp_width,
        DO_REG                  => f_bool_2_int(g_dual_clock),
        EN_SYN                  => not g_dual_clock,
        FIFO_MODE               => f_v6_fifo_mode(m),
        FIRST_WORD_FALL_THROUGH => false)
      port map (
        ALMOSTEMPTY   => rd_almost_empty_o,
        ALMOSTFULL    => wr_almost_full_o,
        DO            => do_36,
        DOP           => dop_36,
        EMPTY         => rd_empty_o,
        FULL          => wr_full_o,
        RDCOUNT       => rd_ptr(12 downto 0),
        WRCOUNT       => wr_ptr(12 downto 0),
        INJECTDBITERR => '0',
        INJECTSBITERR => '0',
        DI            => di_36,
        DIP           => dip_36,
        RDCLK         => clk_rd_i,
        RDEN          => rd_i,
        REGCE         => '1',
        RST           => srst,
        RSTREG        => srstreg,
        WRCLK         => clk_wr_i,
        WREN          => we_i);

    
  end generate gen_fifo36;

  gen_fifo18 : if(not m.is_36 and m.d_width > 0) generate


    di_wide_18 <= std_logic_vector(resize(unsigned(d_i), di_wide_18'length));

    di_18(m.d_width-1 downto 0)   <= di_wide_18(m.d_width-1 downto 0);
    dip_18(m.dp_width-1 downto 0) <= di_wide_18(m.dp_width + m.d_width-1 downto m.d_width);

    do_wide_18 (m.d_width-1 downto 0)                      <= do_18(m.d_width-1 downto 0);
    do_wide_18 (m.d_width + m.dp_width-1 downto m.d_width) <= dop_18(m.dp_width-1 downto 0);

    q_o <= do_wide_18(g_data_width-1 downto 0);



    assert false report "generic_sync_fifo[xilinx]: using FIFO18E1 primitive [dw=" & integer'image(g_data_width) &"]." severity note;

    U_Wrapped_FIFO18 : FIFO18E1
      generic map (
        ALMOST_FULL_OFFSET      => to_bitvector(std_logic_vector(to_unsigned(f_clamp(g_almost_full_threshold,  5, 2043), 16))),
        ALMOST_EMPTY_OFFSET     => to_bitvector(std_logic_vector(to_unsigned(f_clamp(g_almost_empty_threshold, 5, 2043), 16))),
        DATA_WIDTH              => m.d_width + m.dp_width,
        DO_REG                  => f_bool_2_int(g_dual_clock),
        EN_SYN                  => not g_dual_clock,
        FIFO_MODE               => f_v6_fifo_mode(m),
        FIRST_WORD_FALL_THROUGH => false)
      port map (
        ALMOSTEMPTY => rd_almost_empty_o,
        ALMOSTFULL  => wr_almost_full_o,
        DO          => do_18,
        DOP         => dop_18,
        EMPTY       => rd_empty_o,
        FULL        => wr_full_o,
        RDCOUNT     => rd_ptr(11 downto 0),
        WRCOUNT     => wr_ptr(11 downto 0),
        DI          => di_18,
        DIP         => dip_18,
        RDCLK       => clk_rd_i,
        RDEN        => rd_i,
        REGCE       => '1',
        RST         => srst,
        RSTREG      => srstreg,
        WRCLK       => clk_wr_i,
        WREN        => we_i);

    rd_ptr(12) <= '0';
    wr_ptr(12) <= '0';

    
  end generate gen_fifo18;


  gen_pointers : if(g_dual_clock = false and g_with_count = true) generate
    rd_count_o <= std_logic_vector(resize(unsigned(wr_ptr) - unsigned(rd_ptr), rd_count_o'length));
    wr_count_o <= std_logic_vector(resize(unsigned(wr_ptr) - unsigned(rd_ptr), wr_count_o'length));
  end generate gen_pointers;


end syn;
