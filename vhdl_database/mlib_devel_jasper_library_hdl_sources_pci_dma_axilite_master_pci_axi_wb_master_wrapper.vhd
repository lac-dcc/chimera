--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1.3 (lin64) Build 2644227 Wed Sep  4 09:44:18 MDT 2019
--Date        : Mon Feb 15 20:24:06 2021
--Host        : rtr-dev1 running 64-bit Ubuntu 18.04.4 LTS
--Command     : generate_target pci_axi_wb_master_wrapper.bd
--Design      : pci_axi_wb_master_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pci_axi_wb_master_wrapper is
  port (
    ACK_I : in STD_LOGIC;
    ADR_O : out STD_LOGIC_VECTOR ( 19 downto 0 );
    CYC_O : out STD_LOGIC;
    DAT_I : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DAT_O : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RST_O : out STD_LOGIC;
    SEL_O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    STB_O : out STD_LOGIC;
    WE_O : out STD_LOGIC;
    axi_aclk : out STD_LOGIC;
    axi_aresetn : out STD_LOGIC;
    m_axil_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axil_arready : in STD_LOGIC;
    m_axil_arvalid : out STD_LOGIC;
    m_axil_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axil_awready : in STD_LOGIC;
    m_axil_awvalid : out STD_LOGIC;
    m_axil_bready : out STD_LOGIC;
    m_axil_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axil_bvalid : in STD_LOGIC;
    m_axil_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_rready : out STD_LOGIC;
    m_axil_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axil_rvalid : in STD_LOGIC;
    m_axil_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_wready : in STD_LOGIC;
    m_axil_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axil_wvalid : out STD_LOGIC;
    pci_exp_rxn : in STD_LOGIC_VECTOR ( 0 downto 0 );
    pci_exp_rxp : in STD_LOGIC_VECTOR ( 0 downto 0 );
    pci_exp_txn : out STD_LOGIC_VECTOR ( 0 downto 0 );
    pci_exp_txp : out STD_LOGIC_VECTOR ( 0 downto 0 );
    sys_clk : in STD_LOGIC;
    sys_clk_gt : in STD_LOGIC;
    sys_rst_n : in STD_LOGIC;
    usr_irq_req : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end pci_axi_wb_master_wrapper;

architecture STRUCTURE of pci_axi_wb_master_wrapper is
  component pci_axi_wb_master is
  port (
    ACK_I : in STD_LOGIC;
    ADR_O : out STD_LOGIC_VECTOR ( 19 downto 0 );
    CYC_O : out STD_LOGIC;
    DAT_I : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DAT_O : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RST_O : out STD_LOGIC;
    SEL_O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    STB_O : out STD_LOGIC;
    WE_O : out STD_LOGIC;
    axi_aclk : out STD_LOGIC;
    axi_aresetn : out STD_LOGIC;
    pci_exp_rxn : in STD_LOGIC_VECTOR ( 0 downto 0 );
    pci_exp_rxp : in STD_LOGIC_VECTOR ( 0 downto 0 );
    pci_exp_txn : out STD_LOGIC_VECTOR ( 0 downto 0 );
    pci_exp_txp : out STD_LOGIC_VECTOR ( 0 downto 0 );
    sys_clk : in STD_LOGIC;
    sys_clk_gt : in STD_LOGIC;
    sys_rst_n : in STD_LOGIC;
    usr_irq_req : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axil_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axil_awvalid : out STD_LOGIC;
    m_axil_awready : in STD_LOGIC;
    m_axil_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axil_wvalid : out STD_LOGIC;
    m_axil_wready : in STD_LOGIC;
    m_axil_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axil_bvalid : in STD_LOGIC;
    m_axil_bready : out STD_LOGIC;
    m_axil_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axil_arvalid : out STD_LOGIC;
    m_axil_arready : in STD_LOGIC;
    m_axil_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axil_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axil_rvalid : in STD_LOGIC;
    m_axil_rready : out STD_LOGIC
  );
  end component pci_axi_wb_master;
begin
pci_axi_wb_master_i: component pci_axi_wb_master
     port map (
      ACK_I => ACK_I,
      ADR_O(19 downto 0) => ADR_O(19 downto 0),
      CYC_O => CYC_O,
      DAT_I(31 downto 0) => DAT_I(31 downto 0),
      DAT_O(31 downto 0) => DAT_O(31 downto 0),
      RST_O => RST_O,
      SEL_O(3 downto 0) => SEL_O(3 downto 0),
      STB_O => STB_O,
      WE_O => WE_O,
      axi_aclk => axi_aclk,
      axi_aresetn => axi_aresetn,
      m_axil_araddr(31 downto 0) => m_axil_araddr(31 downto 0),
      m_axil_arprot(2 downto 0) => m_axil_arprot(2 downto 0),
      m_axil_arready => m_axil_arready,
      m_axil_arvalid => m_axil_arvalid,
      m_axil_awaddr(31 downto 0) => m_axil_awaddr(31 downto 0),
      m_axil_awprot(2 downto 0) => m_axil_awprot(2 downto 0),
      m_axil_awready => m_axil_awready,
      m_axil_awvalid => m_axil_awvalid,
      m_axil_bready => m_axil_bready,
      m_axil_bresp(1 downto 0) => m_axil_bresp(1 downto 0),
      m_axil_bvalid => m_axil_bvalid,
      m_axil_rdata(31 downto 0) => m_axil_rdata(31 downto 0),
      m_axil_rready => m_axil_rready,
      m_axil_rresp(1 downto 0) => m_axil_rresp(1 downto 0),
      m_axil_rvalid => m_axil_rvalid,
      m_axil_wdata(31 downto 0) => m_axil_wdata(31 downto 0),
      m_axil_wready => m_axil_wready,
      m_axil_wstrb(3 downto 0) => m_axil_wstrb(3 downto 0),
      m_axil_wvalid => m_axil_wvalid,
      pci_exp_rxn(0 downto 0) => pci_exp_rxn(0 downto 0),
      pci_exp_rxp(0 downto 0) => pci_exp_rxp(0 downto 0),
      pci_exp_txn(0 downto 0) => pci_exp_txn(0 downto 0),
      pci_exp_txp(0 downto 0) => pci_exp_txp(0 downto 0),
      sys_clk => sys_clk,
      sys_clk_gt => sys_clk_gt,
      sys_rst_n => sys_rst_n,
      usr_irq_req(0) => usr_irq_req(0)
    );
end STRUCTURE;
