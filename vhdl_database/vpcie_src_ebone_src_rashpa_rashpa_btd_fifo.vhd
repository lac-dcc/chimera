library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity btd_fifo is

 port
 (
  -- clocking interface
  clk: in std_logic;
  rst: in std_logic;

  -- bgu interface
  bgu_wr_en: in std_logic;
  bgu_wr_dat: in std_logic_vector(work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
  bgu_wr_full: out std_logic;

  -- btu interface
  btu_rd_en: in std_logic;
  btu_rd_dat: out std_logic_vector(work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
  btu_rd_empty: out std_logic
 );

end btd_fifo;


architecture btd_fifo_arch of btd_fifo is
begin

 eb_fifo:
 work.eb_common_pkg.fifo_s
 generic map
 (
  DWIDTH => work.rashpa.BTD_FIFO_WIDTH,
  ADEPTH => work.rashpa.BTD_FIFO_DEPTH
 )
 port map
 (
  arst => rst,
  clk => clk,
  wr_en => bgu_wr_en,
  wr_dat => bgu_wr_dat,
  wr_cnt => open,
  wr_afull => open,
  wr_full => bgu_wr_full,
  rd_en => btu_rd_en,
  rd_dat => btu_rd_dat,
  rd_aempty => open,
  rd_empty => btu_rd_empty
 );

end btd_fifo_arch;
