-- TODO: move rashpa_top_pkg def to rashpa_top_pkg.vhd

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package rashpa_top_pkg is
 constant EBS_SLV_NB: natural := 4;
 subtype std_slv is std_logic_vector(EBS_SLV_NB downto 1);
end package rashpa_top_pkg;


-- rashpa_top definition

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

use work.rashpa_top_pkg.all;
use work.ebs_pkg.all;

entity rashpa_top is
 generic
 (
  EBS_DWIDTH: natural := 32;
  EBS_AD_RNGE: natural := 16;
  EBFT_DWIDTH: natural := 64
 );
 port
 (
  rst: in std_logic;
  clk: in std_logic
 );
end rashpa_top;

architecture rashpa_top_arch of rashpa_top is

 -- ebone core
 signal eb_m0_clk: std_logic;
 signal eb_m0_rst: std_logic;
 signal eb_m0_brq: std_logic;
 signal eb_m0_bg: std_logic;
 signal eb_m0_as: std_logic;
 signal eb_m0_eof: std_logic;
 signal eb_m0_aef: std_logic;
 signal eb_m0_dat: std_logic_vector(31 downto 0);
 signal eb_bft: std_logic;
 signal eb_m_dat: std_logic_vector(31 downto 0);
 signal eb_m_dk: std_logic;
 signal eb_m_err: std_logic;
 signal eb_dk: std_slv;
 signal eb_err: std_slv;
 signal eb_dat_rd: std32_a(EBS_SLV_NB downto 1);
 signal eb_bmx: std_logic;
 signal eb_as: std_logic;
 signal eb_eof: std_logic;
 signal eb_aef: std_logic;
 signal eb_dat_wr: std_logic_vector(31 downto 0);

 -- second ebone master interface
 signal eb2_bmx: std_logic;
 signal eb2_brq: std_logic;
 signal eb2_bg: std_logic;
 signal eb2_as: std_logic;
 signal eb2_eof: std_logic;
 signal eb2_aef: std_logic;
 signal eb2_dk: std_logic;
 signal eb2_err: std_logic;
 signal eb2_dat_wr: std_logic_vector(EBFT_DWIDTH - 1 downto 0);
 signal eb2_dat_rd: std_logic_vector(EBFT_DWIDTH - 1 downto 0);
 signal eb2_bram_addr: std_logic_vector(31 downto 0);
 signal eb2_bram_data: std_logic_vector(EBFT_DWIDTH - 1 downto 0);

 -- fast transmitter
 signal eb_s0_dk: std_logic;
 signal eb_s0_err: std_logic;
 signal eb_ft_brq: std_logic;
 signal eb_ft_as: std_logic;
 signal eb_ft_eof: std_logic;
 signal eb_ft_aef: std_logic;
 signal eb_ft_dxt: std_logic_vector(EBFT_DWIDTH - 1 downto 0);
 signal ebft_desc_stat0: std_logic_vector(31 downto 0);
 signal ebft_desc_stat1: std_logic_vector(31 downto 0);
 signal ebft_dma_psize: std_logic_vector(15 downto 0);
 signal ebft_dma_count: std_logic_vector(15 downto 0);
 signal ebft_dma_stat: std_logic_vector(7 downto 0);
 signal ebft_dma_eot: std_logic;
 signal ebft_dma_err: std_logic;

 -- ebone slave 1, ebs_regs
 signal eb_s1_dk: std_logic;
 signal eb_s1_err: std_logic;
 signal eb_s1_dat: std_logic_vector(31 downto 0);
 signal regs_rw_dat: std32_a(7 downto 0);
 signal regs_ro_dat: std32_a(15 downto 8);

 -- ebone slave 2, ebs_bram
 signal eb_s2_dk: std_logic;
 signal eb_s2_err: std_logic;
 signal eb_s2_dat: std_logic_vector(31 downto 0);

 -- ebone slave 3, ebs_ebft
 signal eb_s3_dk: std_logic;
 signal eb_s3_err: std_logic;
 signal eb_s3_dat: std_logic_vector(31 downto 0);

 -- btd_fifo ebone slave 4
 signal eb_s4_dk: std_logic;
 signal eb_s4_err: std_logic;
 signal eb_s4_dat: std_logic_vector(31 downto 0);

 -- btd_fifo bgu (currently ebone slave) interface
 signal btd_fifo_bgu_wr_en: std_logic;
 signal btd_fifo_bgu_wr_dat: std_logic_vector
  (work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
 signal btd_fifo_bgu_wr_full: std_logic;

 -- btd_fifo btu interface
 signal btd_fifo_btu_rd_en: std_logic;
 signal btd_fifo_btu_rd_dat: std_logic_vector
  (work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
 signal btd_fifo_btu_rd_empty: std_logic;

 -- dual port bram
 -- size in bytes, width in bits
 constant BRAM_SIZE: natural := 4096;
 constant BRAM_WR_DWIDTH: natural := EBS_DWIDTH;
 constant BRAM_WR_AWIDTH: natural := Nlog2((BRAM_SIZE * 8) / BRAM_WR_DWIDTH);
 constant BRAM_RD_DWIDTH: natural := EBFT_DWIDTH;
 constant BRAM_RD_AWIDTH: natural := Nlog2((BRAM_SIZE * 8) / BRAM_RD_DWIDTH);
 
 signal bram_wr_en: std_logic;
 signal bram_wr_addr: std_logic_vector(31 downto 0);
 signal bram_wr_data: std_logic_vector(31 downto 0);

begin

 -- ebone interconnect core
 ebs_core:
 work.ebs_pkg.ebs_core
 generic map
 (
  EBS_TMO_DK => 2
 )
 port map
 (
  eb_clk_i => eb_m0_clk,
  eb_rst_i => eb_m0_rst,

  -- master 0
  eb_m0_brq_i => eb_m0_brq,
  eb_m0_bg_o => eb_m0_bg,
  eb_m0_as_i => eb_m0_as,
  eb_m0_eof_i => eb_m0_eof,
  eb_m0_aef_i => eb_m0_aef,
  eb_m0_dat_i => eb_m0_dat,
  eb_s0_dk_i => eb_s0_dk,
  eb_s0_err_i => eb_s0_err,

  -- master 1
  eb_m1_brq_i => '0',
  eb_m1_bg_o => open,
  eb_m1_as_i => '0',
  eb_m1_eof_i => '0',
  eb_m1_aef_i => '0',
  eb_m1_dat_i => (others => '0'),

  -- fast transmitter
  eb_ft_brq_i => eb_ft_brq,
  eb_ft_as_i => eb_ft_as,
  eb_ft_eof_i => eb_ft_eof,
  eb_ft_aef_i => eb_ft_aef,

  -- master shared bus
  eb_m_dk_o => eb_m_dk,
  eb_m_err_o => eb_m_err,
  eb_m_dat_o => eb_m_dat,

  -- from slave
  eb_dk_i => eb_dk,
  eb_err_i => eb_err,
  eb_dat_i => eb_dat_rd,

  -- to slave shared bus
  eb_bft_o => eb_bft,
  eb_bmx_o => eb_bmx,
  eb_as_o => eb_as,
  eb_eof_o => eb_eof,
  eb_aef_o => eb_aef,
  eb_dat_o => eb_dat_wr
 );

 -- ebone slave 1, ebs_regs

 regs_ro_dat(8) <= x"2a2a2a2a";
 regs_ro_dat(9) <= x"2a2a2a2b";
 regs_ro_dat(10) <= x"2a2a2a2c";
 regs_ro_dat(11) <= x"2a2a2a2d";

 generate_ro_regs: for i in 0 to 3 generate
  regs_ro_dat(12 + i) <= regs_rw_dat(4 + i);
 end generate;

 ebs1_regs:
 work.ebs_regs_pkg.ebs_regs
 generic map
 (
  EBS_AD_RNGE => EBS_AD_RNGE,
  EBS_AD_BASE => 1,
  EBS_AD_SIZE => 16,
  EBS_AD_OFST => 16#80#,
  EBS_MIRQ => "0000000000000010",
  REG_RO_SIZE => 8,
  REG_WO_BITS => 1
 )
 port map
 (
  eb_clk_i => eb_m0_clk,
  eb_rst_i => eb_m0_rst,

  -- ebone slave
  eb_bmx_i => eb_bmx,
  eb_as_i => eb_as,
  eb_eof_i => eb_eof,
  eb_dat_i => eb_dat_wr,
  eb_dk_o => eb_s1_dk,
  eb_err_o => eb_s1_err,
  eb_dat_o => eb_s1_dat,

  -- register
  regs_o => regs_rw_dat,
  regs_i => regs_ro_dat,
  regs_irq_i => '0',
  regs_iak_o => open,
  regs_ofsrd_o => open,
  regs_ofswr_o => open,
  regs_ofs_o => open,
  reg0_sclr_i => '0'
 );

 eb_dk(1) <= eb_s1_dk;
 eb_err(1) <= eb_s1_err;
 eb_dat_rd(1) <= eb_s1_dat;

 -- ebone slave 2, ebs_bram

 ebs2_bram:
 work.ebs_bram_pkg.ebs_bram
 generic map
 (
  EBS_AD_RNGE => EBS_AD_RNGE,
  EBS_AD_BASE => 1,
  EBS_AD_SIZE => BRAM_SIZE / 4,
  EBS_AD_OFST => 16#1000#,
  EBS_DWIDTH => EBS_DWIDTH
 )
 port map
 (
  eb_clk_i => eb_m0_clk,
  eb_rst_i => eb_m0_rst,

  -- ebone slave
  eb_bmx_i => eb_bmx,
  eb_as_i => eb_as,
  eb_eof_i => eb_eof,
  eb_aef_i => eb_aef,
  eb_dat_i => eb_dat_wr,
  eb_dk_o => eb_s2_dk,
  eb_err_o => eb_s2_err,
  eb_dat_o => eb_s2_dat,

  -- bram memory interface
  mem_addr_o => bram_wr_addr,
  mem_din_o => bram_wr_data,
  mem_dout_i => (others => '0'),
  mem_wr_o => bram_wr_en,
  mem_rd_o => open,
  mem_empty_i => '0',
  mem_full_i => '0'
 );

 eb_dk(2) <= eb_s2_dk;
 eb_err(2) <= eb_s2_err;
 eb_dat_rd(2) <= eb_s2_dat;

 -- ebone slave 3, ebft

 ebs3_ebft:
 work.ebm_ebft_pkg.ebm_ebft
 generic map
 (
  EBS_AD_RNGE => EBS_AD_RNGE,
  EBS_AD_BASE => 1,
  EBS_AD_SIZE => 16,
  EBS_AD_OFST => 16#100#,
  EBX_MSG_MID => 1,
  EBFT_DWIDTH => EBFT_DWIDTH
 )
 port map
 (
   eb_clk_i => eb_m0_clk,
   eb_rst_i => eb_m0_rst,

   -- ebone slave interface
   eb_bmx_i => eb_bmx,
   eb_as_i => eb_as,
   eb_eof_i => eb_eof,
   eb_dat_i => eb_dat_wr,
   eb_dk_o => eb_s3_dk,
   eb_err_o => eb_s3_err,
   eb_dat_o => eb_s3_dat,

   -- ebone fast transmitter
   eb_ft_brq_o => eb_ft_brq,
   eb_bft_i => eb_bft,
   eb_ft_as_o => eb_ft_as,
   eb_ft_eof_o => eb_ft_eof,
   eb_ft_aef_o => eb_ft_aef,
   eb_ft_dxt_o => eb_ft_dxt,
   eb_dk_i => eb_m_dk,
   eb_err_i => eb_m_err,

   -- second ebone master interface
   eb2_mx_brq_o => eb2_brq,
   eb2_mx_bg_i => eb2_bg,
   eb2_mx_as_o => eb2_as,
   eb2_mx_eof_o => eb2_eof,
   eb2_mx_aef_o => eb2_aef,
   eb2_mx_dat_o => eb2_dat_wr,

   -- second ebone mater shared bus
   eb2_dk_i => eb2_dk,
   eb2_err_i => eb2_err,
   eb2_dat_i => eb2_dat_rd,
   eb2_bmx_i => eb2_bmx,
   eb2_bft_i => '0',

   -- second ebone extension master
   ebx2_msg_set_o => open,
   ebx2_msg_dat_i => (others => '0'),

   -- external control ports
   cmd_go_i => '0',
   cmd_flush_i => '0',
   cmd_abort_i => '0',
   cmd_reset_i => '0',

   -- external status ports
   d0_stat_o => ebft_desc_stat0,
   d1_stat_o => ebft_desc_stat1,
   dma_stat_o => ebft_dma_stat,
   dma_psize_o => ebft_dma_psize,
   dma_count_o => ebft_dma_count,
   dma_eot_o => ebft_dma_eot,
   dma_err_o => ebft_dma_err
 );

 eb_dk(3) <= eb_s3_dk;
 eb_err(3) <= eb_s3_err;
 eb_dat_rd(3) <= eb_s3_dat;

 -- ebone slave 4, btd_fifo

 btd_fifo:
 work.rashpa.btd_fifo
 port map
 (
  clk => clk,
  rst => rst,

  -- bgu interface
  bgu_wr_en => btd_fifo_bgu_wr_en,
  bgu_wr_dat => btd_fifo_bgu_wr_dat,
  bgu_wr_full => btd_fifo_bgu_wr_full,

  -- btu interface
  btu_rd_en => btd_fifo_btu_rd_en,
  btu_rd_dat => btd_fifo_btu_rd_dat,
  btu_rd_empty => btd_fifo_btu_rd_empty
 );

 ebs4_btd_fifo:
 work.ebs_btd_fifo_pkg.ebs_btd_fifo
 generic map
 (
  EBS_AD_RNGE => EBS_AD_RNGE,
  EBS_AD_BASE => 2,
  EBS_AD_OFST => 0
)
 port map
 (
   eb_clk_i => eb_m0_clk,
   eb_rst_i => eb_m0_rst,

   -- ebone slave interface
   eb_bmx_i => eb_bmx,
   eb_as_i => eb_as,
   eb_eof_i => eb_eof,
   eb_dat_i => eb_dat_wr,
   eb_dk_o => eb_s4_dk,
   eb_err_o => eb_s4_err,
   eb_dat_o => eb_s4_dat,

   -- bgu interface
   bgu_wr_en_o => btd_fifo_bgu_wr_en,
   bgu_wr_dat_o => btd_fifo_bgu_wr_dat,
   bgu_wr_full_i => btd_fifo_bgu_wr_full
 );

 eb_dk(4) <= eb_s4_dk;
 eb_err(4) <= eb_s4_err;
 eb_dat_rd(4) <= eb_s4_dat;

 -- btu

 rashpa_btu:
 work.rashpa.btu
 port map
 (
   clk_i => eb_m0_clk,
   rst_i => eb_m0_rst,

   -- btd fifo interface
   btd_fifo_rd_en_o => btd_fifo_btu_rd_en,
   btd_fifo_rd_dat_i => btd_fifo_btu_rd_dat,
   btd_fifo_rd_empty_i => btd_fifo_btu_rd_empty
 );

 -- DACQ secondary ebone bus

 -- dual port bram and ebone slave

 dacq_ebs_bram:
 work.ebs_bram_pkg.ebs_bram
 generic map
 (
  EBS_AD_RNGE => EBS_AD_RNGE,
  EBS_AD_BASE => 2,
  EBS_AD_SIZE => BRAM_SIZE / 4,
  EBS_AD_OFST => 16#1000#,
  EBS_DWIDTH => EBFT_DWIDTH
 )
 port map
 (
  eb_clk_i => eb_m0_clk,
  eb_rst_i => eb_m0_rst,

  -- ebone slave
  eb_bmx_i => eb2_bmx,
  eb_as_i => eb2_as,
  eb_eof_i => eb2_eof,
  eb_aef_i => eb2_aef,
  eb_dat_i => eb2_dat_wr,
  eb_dk_o => eb2_dk,
  eb_err_o => eb2_err,
  eb_dat_o => eb2_dat_rd,

  -- bram memory interface
  mem_addr_o => eb2_bram_addr(31 downto 0),
  mem_din_o => open,
  mem_dout_i => eb2_bram_data,
  mem_wr_o => open,
  mem_rd_o => open,
  mem_empty_i => '0',
  mem_full_i => '0'
 );

 eb2_bg <= eb2_brq;
 eb2_bmx <= eb2_brq;

 dacq_dualport_bram:
 entity work.dualport_bram
 generic map
 (
  MEM_SIZE => BRAM_SIZE
 )
 port map
 (
  rst => eb_m0_rst,
  wr_clk => eb_m0_clk,
  wr_en => bram_wr_en,
  wr_addr => bram_wr_addr(BRAM_WR_AWIDTH - 1 downto 0),
  wr_data => bram_wr_data(BRAM_WR_DWIDTH - 1 downto 0),
  rd_clk => eb_m0_clk,
  rd_en => '1',
  rd_addr => eb2_bram_addr(BRAM_RD_AWIDTH - 1 downto 0),
  rd_data => eb2_bram_data(BRAM_RD_DWIDTH - 1 downto 0)
 );

 -- ebone master 0 pcie endpoint

 ebm0_pcie_vpcie:
 work.ebm0_pcie_vpcie_pkg.ebm0_pcie_vpcie
 generic map
 (
  EBFT_DWIDTH => EBFT_DWIDTH,
  EBS_DWIDTH => EBS_DWIDTH
 )
 port map
 (
  rst => rst,
  clk => clk,

  -- master 0
  eb_m0_clk_o => eb_m0_clk,
  eb_m0_rst_o => eb_m0_rst,
  eb_m0_brq_o => eb_m0_brq,
  eb_m0_bg_i => eb_m0_bg,
  eb_m0_as_o => eb_m0_as,
  eb_m0_eof_o => eb_m0_eof,
  eb_m0_aef_o => eb_m0_aef,
  eb_m0_dat_o => eb_m0_dat,
  eb_dk_i => eb_m_dk,
  eb_err_i => eb_m_err,
  eb_dat_i => eb_m_dat,
  
  -- fast transmitter
  eb_ft_dxt_i => eb_ft_dxt,
  eb_bmx_i => eb_bmx,
  eb_bft_i => eb_bft,
  eb_as_i => eb_as,
  eb_eof_i => eb_eof,
  eb_dk_o => eb_s0_dk,
  eb_err_o => eb_s0_err
 );

end rashpa_top_arch;
