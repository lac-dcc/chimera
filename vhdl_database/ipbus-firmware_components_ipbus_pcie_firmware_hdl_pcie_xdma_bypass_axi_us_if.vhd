----------------------------------------------------------------------------------
-- Module encapsulating Xilinx xdma core and interface to native dual BRAM
-- Raghunandan Shukla, TIFR
--

----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;

library unisim;
use unisim.VComponents.all;

use work.ipbus_axi_decl.all;


entity pcie_xdma_axi_us_if is
  generic (
      G_PCI_VENDOR_ID           : std_logic_vector(15 downto 0) := x"10ee";
      G_PCI_DEVICE_ID           : std_logic_vector(15 downto 0) := x"8031";
      G_PCI_REVISION_ID         : std_logic_vector(7 downto 0)  := x"00";
      G_PCI_SUBSYSTEM_VENDOR_ID : std_logic_vector(15 downto 0) := x"10ee";
      G_PCI_SUBSYSTEM_ID        : std_logic_vector(15 downto 0) := x"0007"
  );
  port (
    pcie_sys_clk_p: in std_logic;
    pcie_sys_clk_n: in std_logic;
    pcie_sys_rst_n: in std_logic;

    pcie_tx_p: out std_logic_vector (0 downto 0 );
    pcie_tx_n: out std_logic_vector (0 downto 0 );
    pcie_rx_p: in std_logic_vector (0 downto 0 );
    pcie_rx_n: in std_logic_vector (0 downto 0 );

    pcie_user_lnk_up: out std_logic;

    axi_ms : out axi4mm_ms(araddr(63 downto 0), awaddr(63 downto 0), wdata(63 downto 0));
    axi_sm : in axi4mm_sm(rdata(63 downto 0));

    -- User interrupts
    pcie_int_event0: in std_logic
  );
end pcie_xdma_axi_us_if;


architecture rtl of pcie_xdma_axi_us_if is

  constant C_NUM_PCIE_LANES : integer := 1;
  constant C_AXI_DATA_WIDTH : natural := 64;
  constant C_AXI_ADDR_WIDTH : natural := 64;
  constant C_NUM_USR_IRQ : natural := 1;

  -- signals

  signal sys_clk, sys_clk_gt: std_logic;

  signal usr_irq_req: std_logic_vector ( C_NUM_USR_IRQ - 1 downto 0 );
  signal usr_irq_ack: std_logic_vector ( C_NUM_USR_IRQ - 1 downto 0 );

  signal msi_vector_width: std_logic_vector ( 2 downto 0 );
  signal msi_enable: std_logic;

  signal dma_axi_sm : axi4mm_sm(rdata(63 downto 0));
  signal dma_axi_ms, axib_ms_i: axi4mm_ms(araddr(63 downto 0), awaddr(63 downto 0), wdata(C_AXI_DATA_WIDTH - 1 downto 0));

  -- components

  COMPONENT xdma_0
    PORT (
      sys_clk : IN STD_LOGIC;
      sys_clk_gt : IN STD_LOGIC;
      sys_rst_n : IN STD_LOGIC;
      user_lnk_up : OUT STD_LOGIC;
      pci_exp_txp : OUT STD_LOGIC_VECTOR(C_NUM_PCIE_LANES - 1 DOWNTO 0);
      pci_exp_txn : OUT STD_LOGIC_VECTOR(C_NUM_PCIE_LANES - 1 DOWNTO 0);
      pci_exp_rxp : IN STD_LOGIC_VECTOR(C_NUM_PCIE_LANES - 1 DOWNTO 0);
      pci_exp_rxn : IN STD_LOGIC_VECTOR(C_NUM_PCIE_LANES - 1 DOWNTO 0);
      cfg_subsys_vend_id : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_vend_id : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_dev_id_pf0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_rev_id_pf0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cfg_subsys_id_pf0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      axi_aclk : OUT STD_LOGIC;
      axi_aresetn : OUT STD_LOGIC;
      usr_irq_req : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      usr_irq_ack : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      msi_enable : OUT STD_LOGIC;
      msi_vector_width : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_awready : IN STD_LOGIC;
      m_axi_wready : IN STD_LOGIC;
      m_axi_bid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_bvalid : IN STD_LOGIC;
      m_axi_arready : IN STD_LOGIC;
      m_axi_rid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_rdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_rlast : IN STD_LOGIC;
      m_axi_rvalid : IN STD_LOGIC;
      m_axi_awid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_awaddr : OUT STD_LOGIC_VECTOR(C_AXI_ADDR_WIDTH - 1 DOWNTO 0);
      m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_awvalid : OUT STD_LOGIC;
      m_axi_awlock : OUT STD_LOGIC;
      m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_wdata : OUT STD_LOGIC_VECTOR(C_AXI_DATA_WIDTH - 1 DOWNTO 0);
      m_axi_wstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_wlast : OUT STD_LOGIC;
      m_axi_wvalid : OUT STD_LOGIC;
      m_axi_bready : OUT STD_LOGIC;
      m_axi_arid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_araddr : OUT STD_LOGIC_VECTOR(C_AXI_ADDR_WIDTH - 1 DOWNTO 0);
      m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_arvalid : OUT STD_LOGIC;
      m_axi_arlock : OUT STD_LOGIC;
      m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_rready : OUT STD_LOGIC;

      cfg_mgmt_addr : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
      cfg_mgmt_write : IN STD_LOGIC;
      cfg_mgmt_write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cfg_mgmt_byte_enable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cfg_mgmt_read : IN STD_LOGIC;
      cfg_mgmt_read_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      cfg_mgmt_read_write_done : OUT STD_LOGIC;
      cfg_mgmt_type1_cfg_reg_access : IN STD_LOGIC;

      m_axib_awid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axib_awaddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axib_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axib_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axib_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axib_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axib_awvalid : OUT STD_LOGIC;
      m_axib_awready : IN STD_LOGIC;
      m_axib_awlock : OUT STD_LOGIC;
      m_axib_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axib_wdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axib_wstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axib_wlast : OUT STD_LOGIC;
      m_axib_wvalid : OUT STD_LOGIC;
      m_axib_wready : IN STD_LOGIC;
      m_axib_bid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axib_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axib_bvalid : IN STD_LOGIC;
      m_axib_bready : OUT STD_LOGIC;
      m_axib_arid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axib_araddr : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axib_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axib_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axib_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axib_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axib_arvalid : OUT STD_LOGIC;
      m_axib_arready : IN STD_LOGIC;
      m_axib_arlock : OUT STD_LOGIC;
      m_axib_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axib_rid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axib_rdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axib_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axib_rlast : IN STD_LOGIC;
      m_axib_rvalid : IN STD_LOGIC;
      m_axib_rready : OUT STD_LOGIC;

      c2h_sts_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      h2c_sts_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      --int_qpll1lock_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      --int_qpll1outrefclk_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      --int_qpll1outclk_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT;

COMPONENT axi_bram_ctrl_1
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    s_axi_awid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_awaddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_awlock : IN STD_LOGIC;
    s_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_wlast : IN STD_LOGIC;
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_arid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_araddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_arlock : IN STD_LOGIC;
    s_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_rdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rlast : OUT STD_LOGIC;
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
    bram_rst_a : OUT STD_LOGIC;
    bram_clk_a : OUT STD_LOGIC;
    bram_en_a : OUT STD_LOGIC;
    bram_we_a : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    bram_addr_a : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    bram_wrdata_a : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    bram_rddata_a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    bram_rst_b : OUT STD_LOGIC;
    bram_clk_b : OUT STD_LOGIC;
    bram_en_b : OUT STD_LOGIC;
    bram_we_b : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    bram_addr_b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    bram_wrdata_b : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    bram_rddata_b : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END COMPONENT;

begin

  ibufds_sys_clk : IBUFDS_GTE3
    generic map (
      REFCLK_HROW_CK_SEL => "00"        -- clock divider 1 for ODiv2
      )
    port map (
      O     => sys_clk_gt,              -- 100 MHz output clock
      ODIV2 => sys_clk,                 -- also 100 mHz
      CEB   => '0',
      I     => pcie_sys_clk_p,
      IB    => pcie_sys_clk_n
      );

  xdma : xdma_0
    port map (
      sys_clk            => sys_clk,
      sys_clk_gt         => sys_clk_gt,
      sys_rst_n          => pcie_sys_rst_n,
      user_lnk_up        => pcie_user_lnk_up,
      pci_exp_txp        => pcie_tx_p,
      pci_exp_txn        => pcie_tx_n,
      pci_exp_rxp        => pcie_rx_p,
      pci_exp_rxn        => pcie_rx_n,
      cfg_subsys_vend_id => G_PCI_SUBSYSTEM_VENDOR_ID,
      cfg_vend_id        => G_PCI_VENDOR_ID,
      cfg_dev_id_pf0     => G_PCI_DEVICE_ID,
      cfg_rev_id_pf0     => G_PCI_REVISION_ID,
      cfg_subsys_id_pf0  => G_PCI_SUBSYSTEM_ID,
      axi_aclk           => axib_ms_i.aclk,
      axi_aresetn        => axib_ms_i.aresetn,
      usr_irq_req        => usr_irq_req,
      usr_irq_ack        => usr_irq_ack,
      msi_enable         => msi_enable,
      msi_vector_width   => msi_vector_width,

      m_axi_awready      => dma_axi_sm.awready,
      m_axi_wready       => dma_axi_sm.wready,
      m_axi_bid          => dma_axi_sm.bid,
      m_axi_bresp        => dma_axi_sm.bresp,
      m_axi_bvalid       => dma_axi_sm.bvalid,
      m_axi_arready      => dma_axi_sm.arready,
      m_axi_rid          => dma_axi_sm.rid,
      m_axi_rdata        => dma_axi_sm.rdata,
      m_axi_rresp        => dma_axi_sm.rresp,
      m_axi_rlast        => dma_axi_sm.rlast,
      m_axi_rvalid       => dma_axi_sm.rvalid,
      m_axi_awid         => dma_axi_ms.awid,
      m_axi_awaddr       => dma_axi_ms.awaddr,
      m_axi_awlen        => dma_axi_ms.awlen,
      m_axi_awsize       => dma_axi_ms.awsize,
      m_axi_awburst      => dma_axi_ms.awburst,
      m_axi_awprot       => dma_axi_ms.awprot,
      m_axi_awvalid      => dma_axi_ms.awvalid,
      m_axi_awlock       => dma_axi_ms.awlock,
      m_axi_awcache      => dma_axi_ms.awcache,
      m_axi_wdata        => dma_axi_ms.wdata,
      m_axi_wstrb        => dma_axi_ms.wstrb,
      m_axi_wlast        => dma_axi_ms.wlast,
      m_axi_wvalid       => dma_axi_ms.wvalid,
      m_axi_bready       => dma_axi_ms.bready,
      m_axi_arid         => dma_axi_ms.arid,
      m_axi_araddr       => dma_axi_ms.araddr,
      m_axi_arlen        => dma_axi_ms.arlen,
      m_axi_arsize       => dma_axi_ms.arsize,
      m_axi_arburst      => dma_axi_ms.arburst,
      m_axi_arprot       => dma_axi_ms.arprot,
      m_axi_arvalid      => dma_axi_ms.arvalid,
      m_axi_arlock       => dma_axi_ms.arlock,
      m_axi_arcache      => dma_axi_ms.arcache,
      m_axi_rready       => dma_axi_ms.rready,
      -- CFG
      cfg_mgmt_addr        => "000" & X"0000",
      cfg_mgmt_write       => '0',
      cfg_mgmt_write_data  => X"00000000",
      cfg_mgmt_byte_enable => X"0",
      cfg_mgmt_read        => '0',
      cfg_mgmt_read_data   => open,
      cfg_mgmt_type1_cfg_reg_access => '0',

      m_axib_awready     => axi_sm.awready,
      m_axib_wready      => axi_sm.wready,
      m_axib_bid         => axi_sm.bid,
      m_axib_bresp       => axi_sm.bresp,
      m_axib_bvalid      => axi_sm.bvalid,
      m_axib_arready     => axi_sm.arready,
      m_axib_rid         => axi_sm.rid,
      m_axib_rdata       => axi_sm.rdata,
      m_axib_rresp       => axi_sm.rresp,
      m_axib_rlast       => axi_sm.rlast,
      m_axib_rvalid      => axi_sm.rvalid,
      m_axib_awid        => axib_ms_i.awid,
      m_axib_awaddr      => axib_ms_i.awaddr,
      m_axib_awlen       => axib_ms_i.awlen,
      m_axib_awsize      => axib_ms_i.awsize,
      m_axib_awburst     => axib_ms_i.awburst,
      m_axib_awprot      => axib_ms_i.awprot,
      m_axib_awvalid     => axib_ms_i.awvalid,
      m_axib_awlock      => axib_ms_i.awlock,
      m_axib_awcache     => axib_ms_i.awcache,
      m_axib_wdata       => axib_ms_i.wdata,
      m_axib_wstrb       => axib_ms_i.wstrb,
      m_axib_wlast       => axib_ms_i.wlast,
      m_axib_wvalid      => axib_ms_i.wvalid,
      m_axib_bready      => axib_ms_i.bready,
      m_axib_arid        => axib_ms_i.arid,
      m_axib_araddr      => axib_ms_i.araddr,
      m_axib_arlen       => axib_ms_i.arlen,
      m_axib_arsize      => axib_ms_i.arsize,
      m_axib_arburst     => axib_ms_i.arburst,
      m_axib_arprot      => axib_ms_i.arprot,
      m_axib_arvalid     => axib_ms_i.arvalid,
      m_axib_arlock      => axib_ms_i.arlock,
      m_axib_arcache     => axib_ms_i.arcache,
      m_axib_rready      => axib_ms_i.rready,

      c2h_sts_0            => open,
      h2c_sts_0            => open

      --int_qpll1lock_out      => open,
      --int_qpll1outrefclk_out => open,
      --int_qpll1outclk_out    => open
    );
  dma_axi_ms.aclk    <= axib_ms_i.aclk;
  dma_axi_ms.aresetn <= axib_ms_i.aresetn;
  axi_ms.aresetn <= axib_ms_i.aresetn;
  axi_ms.aclk <= axib_ms_i.aclk;

  axi_ms <= axib_ms_i;

  null_bram_ctrl : axi_bram_ctrl_1
    port map (
      s_axi_aclk => dma_axi_ms.aclk,
      s_axi_aresetn => dma_axi_ms.aresetn,
      s_axi_awid => dma_axi_ms.awid,
      s_axi_awaddr => dma_axi_ms.awaddr(15 downto 0),
      s_axi_awlen => dma_axi_ms.awlen,
      s_axi_awsize => dma_axi_ms.awsize,
      s_axi_awburst => dma_axi_ms.awburst,
      s_axi_awlock => dma_axi_ms.awlock,
      s_axi_awcache => dma_axi_ms.awcache,
      s_axi_awprot => dma_axi_ms.awprot,
      s_axi_awvalid => dma_axi_ms.awvalid,
      s_axi_awready => dma_axi_sm.awready,
      s_axi_wdata => dma_axi_ms.wdata,
      s_axi_wstrb => dma_axi_ms.wstrb,
      s_axi_wlast => dma_axi_ms.wlast,
      s_axi_wvalid => dma_axi_ms.wvalid,
      s_axi_wready => dma_axi_sm.wready,
      s_axi_bid => dma_axi_sm.bid,
      s_axi_bresp => dma_axi_sm.bresp,
      s_axi_bvalid => dma_axi_sm.bvalid,
      s_axi_bready => dma_axi_ms.bready,
      s_axi_arid => dma_axi_ms.arid,
      s_axi_araddr => dma_axi_ms.araddr(15 downto 0),
      s_axi_arlen => dma_axi_ms.arlen,
      s_axi_arsize => dma_axi_ms.arsize,
      s_axi_arburst => dma_axi_ms.arburst,
      s_axi_arlock => dma_axi_ms.arlock,
      s_axi_arcache => dma_axi_ms.arcache,
      s_axi_arprot => dma_axi_ms.arprot,
      s_axi_arvalid => dma_axi_ms.arvalid,
      s_axi_arready => dma_axi_sm.arready,
      s_axi_rid => dma_axi_sm.rid,
      s_axi_rdata => dma_axi_sm.rdata,
      s_axi_rresp => dma_axi_sm.rresp,
      s_axi_rlast => dma_axi_sm.rlast,
      s_axi_rvalid => dma_axi_sm.rvalid,
      s_axi_rready => dma_axi_ms.rready,
--      bram_rst_a : OUT STD_LOGIC;
--      bram_clk_a : OUT STD_LOGIC;
--      bram_en_a : OUT STD_LOGIC;
--      bram_we_a : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--      bram_addr_a : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
--      bram_wrdata_a : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      bram_rddata_a => (Others => '0'),
--      bram_rst_b : OUT STD_LOGIC;
--      bram_clk_b : OUT STD_LOGIC;
      bram_rddata_b => (Others => '0')
    );

  irq_gen: entity work.pcie_int_gen_msix
    port map (
      pcie_usr_clk     => axib_ms_i.aclk,
      pcie_sys_rst_n   => axib_ms_i.aresetn,
      pcie_usr_int_req => usr_irq_req(0),
      pcie_usr_int_ack => usr_irq_ack(0),
      pcie_event0      => pcie_int_event0
    );

end rtl;
