library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus_axi_decl.all;
 
entity c2c_s_ipb_wrapper is
  port (
    aclk             : in  std_logic;
    aresetn          : in  std_logic;
    c2c_stat_o       : out std_logic_vector(2 downto 0);
    gtx_stat_o       : out std_logic_vector(4 downto 0);
    
    gt_clkn          : in  std_logic;
    gt_clkp          : in  std_logic;
    gt_rxn           : in  std_logic;
    gt_rxp           : in  std_logic;
    gt_txn           : out std_logic;
    gt_txp           : out std_logic;
    
    ipb_clk_o        : out std_logic;
    ipb_ic_rst_o     : out std_logic;
    ipb_periph_rst_o : out std_logic;
    
    ipb_irq_i        : in  std_logic;
    ipb_axi_ms       : out axi4mm_ms(araddr(63 downto 0), awaddr(63 downto 0), wdata(63 downto 0));
    ipb_axi_sm       : in  axi4mm_sm(rdata(63 downto 0))
  );
end c2c_s_ipb_wrapper; 

architecture rtl of c2c_s_ipb_wrapper is
begin
c2c_s_ipb_inst: entity work.c2c_s_ipb
     port map (
     ipb_axi_awready(0)  => ipb_axi_sm.awready,
     ipb_axi_wready(0)   => ipb_axi_sm.wready,
--   ipb_axi_bid         => ipb_axi_sm.bid,
     ipb_axi_bresp       => ipb_axi_sm.bresp,
     ipb_axi_bvalid(0)   => ipb_axi_sm.bvalid,
     ipb_axi_arready(0)  => ipb_axi_sm.arready,
--   ipb_axi_rid         => ipb_axi_sm.rid,
     ipb_axi_rdata       => ipb_axi_sm.rdata,
     ipb_axi_rresp       => ipb_axi_sm.rresp,
     ipb_axi_rlast(0)    => ipb_axi_sm.rlast,
     ipb_axi_rvalid(0)   => ipb_axi_sm.rvalid,
--   ipb_axi_awid        => ipb_axi_ms.awid,
     ipb_axi_awaddr(15 downto 0) => ipb_axi_ms.awaddr(15 downto 0), ipb_axi_awaddr(31 downto 16) => open,
     ipb_axi_awlen       => ipb_axi_ms.awlen,
     ipb_axi_awsize      => ipb_axi_ms.awsize,
     ipb_axi_awburst     => ipb_axi_ms.awburst,
     ipb_axi_awprot      => ipb_axi_ms.awprot,
     ipb_axi_awvalid(0)  => ipb_axi_ms.awvalid,
     ipb_axi_awlock(0)   => ipb_axi_ms.awlock,
     ipb_axi_awcache     => ipb_axi_ms.awcache,
     ipb_axi_wdata       => ipb_axi_ms.wdata,
     ipb_axi_wstrb       => ipb_axi_ms.wstrb,
     ipb_axi_wlast(0)    => ipb_axi_ms.wlast,
     ipb_axi_wvalid(0)   => ipb_axi_ms.wvalid,
     ipb_axi_bready(0)   => ipb_axi_ms.bready,
 --  ipb_axi_arid        => ipb_axi_ms.arid,
     ipb_axi_araddr(15 downto 0) => ipb_axi_ms.araddr(15 downto 0), ipb_axi_araddr(31 downto 16) => open,
     ipb_axi_arlen       => ipb_axi_ms.arlen,
     ipb_axi_arsize      => ipb_axi_ms.arsize,
     ipb_axi_arburst     => ipb_axi_ms.arburst,
     ipb_axi_arprot      => ipb_axi_ms.arprot,
     ipb_axi_arvalid(0)  => ipb_axi_ms.arvalid,
     ipb_axi_arlock(0)   => ipb_axi_ms.arlock,
     ipb_axi_arcache     => ipb_axi_ms.arcache,
     ipb_axi_rready(0)   => ipb_axi_ms.rready,
     
--   axiclk_o            => ipb_axi_ms.aclk,
--   axirstn_o(0)        => ipb_axi_ms.aresetn,
     aclk                => aclk,
     aresetn             => aresetn,
     c2c_stat_o          => c2c_stat_o,
     gtx_stat_o          => gtx_stat_o,
               
     ipb_clk_o           => ipb_clk_o,
     ipb_ic_rst_o(0)     => ipb_ic_rst_o,
     ipb_periph_rst_o(0) => ipb_periph_rst_o,
     
     gt_clk_clk_n        => gt_clkn,
     gt_clk_clk_p        => gt_clkp,
     gt_i_rxn(0)         => gt_rxn,
     gt_i_rxp(0)         => gt_rxp,
     gt_o_txn(0)         => gt_txn,
     gt_o_txp(0)         => gt_txp

    );
    
    ipb_axi_ms.aclk <= aclk;
    ipb_axi_ms.aresetn <= aresetn;

    ipb_axi_ms.awaddr(63 downto 16) <= (others => '0');
    ipb_axi_ms.araddr(63 downto 16) <= (others => '0');

end rtl;
