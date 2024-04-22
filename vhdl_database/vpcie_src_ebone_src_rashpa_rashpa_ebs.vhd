library ieee;
use ieee.std_logic_1164.all;

entity ebs is
 port
 (
  rst: in std_logic;
  clk: in std_logic
 );
end ebs;

architecture ebs_arch of ebs is

 constant FIFO_WIDTH: natural := work.rashpa.BTD_FIFO_WIDTH;
 constant FIFO_DEPTH: natural := work.rashpa.BTD_FIFO_DEPTH;

 signal wr_en: std_logic;
 signal wr_dat: std_logic_vector(FIFO_WIDTH - 1 downto 0);
 signal wr_cnt: std_logic_vector(work.ebs_pkg.Nlog2(FIFO_DEPTH) downto 0);
 signal wr_afull: std_logic;
 signal wr_full: std_logic;
 signal rd_en: std_logic;
 signal rd_dat: std_logic_vector(FIFO_WIDTH - 1 downto 0);
 signal rd_aempty: std_logic;
 signal rd_empty: std_logic;

begin

 rashpa_bgu:
 work.rashpa.bgu
 port map
 (
  -- synchronous logic
  rst => rst,
  clk => clk,

  -- btd fifo
  btd_fifo_wr_en => wr_en,
  btd_fifo_wr_dat => wr_dat,
  btd_fifo_wr_full => wr_full
 );

 rashpa_btu:
 work.rashpa.btu
 port map
 (
  -- synchronous logic
  rst => rst,
  clk => clk,

  -- btd fifo
  btd_fifo_rd_en => rd_en,
  btd_fifo_rd_dat => rd_dat,
  btd_fifo_rd_empty => rd_empty
 );

 rashpa_btd_fifo:
 work.eb_common_pkg.fifo_s
 generic map
 (
  DWIDTH => FIFO_WIDTH,
  ADEPTH => FIFO_DEPTH,
  RAMTYP => "block"
 )
 port map
 (
  arst => rst,
  clk => clk,
  wr_en => wr_en,
  wr_dat => wr_dat,
  wr_cnt => wr_cnt,
  wr_afull => wr_afull,
  wr_full => wr_full,
  rd_en => rd_en,
  rd_dat => rd_dat,
  rd_aempty => rd_aempty,
  rd_empty => rd_empty
 );

end ebs_arch;
