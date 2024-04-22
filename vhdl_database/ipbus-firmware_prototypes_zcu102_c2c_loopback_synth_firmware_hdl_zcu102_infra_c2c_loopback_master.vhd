library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.ipbus_trans_decl.all;
use work.ipbus_axi_decl.all;

library UNISIM;
use UNISIM.VComponents.all;

entity zcu102_infra_c2c_loopback_master is
generic(
      BUFWIDTH  : natural := 2;
      ADDRWIDTH : natural := 11
);
  port (
      ext_rst   : in  std_logic;
      
      aclk_o    : out std_logic;
      aresetn_o : out std_logic;
      
      gt_clkn   : in  std_logic;
      gt_clkp   : in  std_logic;
      gt_rxn    : in  std_logic;
      gt_rxp    : in  std_logic;
      gt_txn    : out std_logic;
      gt_txp    : out std_logic;

      c2c_aresetn : in std_logic;
      c2c_stat  : out std_logic_vector(9 downto 0);

      ipb_clk   : out std_logic;
      ipb_rst   : out std_logic;
      ipb_in    : in  ipb_rbus;
      ipb_out   : out ipb_wbus
  );
end zcu102_infra_c2c_loopback_master;
 

architecture rtl of zcu102_infra_c2c_loopback_master is

  signal clk_ipb      : std_logic;
  signal rst_ipb      : std_logic;
  signal rst_ipb_ctrl : std_logic;

  signal axi_ms       : axi4mm_ms(araddr(63 downto 0), awaddr(63 downto 0), wdata(63 downto 0));
  signal axi_sm       : axi4mm_sm(rdata(63 downto 0));

  signal ipb_pkt_done : std_logic;
  signal trans_in     : ipbus_trans_in;
  signal trans_out    : ipbus_trans_out;
    
    
begin


bd_inst: entity work.c2c_m_ipb_wrapper
  port map (
    ext_rst           => ext_rst,
    --
    aclk_o            => aclk_o,
    aresetn_o         => aresetn_o,
    --
    gt_clkn           => gt_clkn,
    gt_clkp           => gt_clkp,
    gt_rxn            => gt_rxn,
    gt_rxp            => gt_rxp,
    gt_txn            => gt_txn,
    gt_txp            => gt_txp,
    --
    c2c_aresetn       => c2c_aresetn,
    c2c_stat          => c2c_stat,
    --
    ipb_clk_o         => clk_ipb,
    ipb_ic_rst_o      => rst_ipb_ctrl,
    ipb_periph_rst_o  => rst_ipb,
    ipb_irq_i         => ipb_pkt_done,
    ipb_axi_ms        => axi_ms,
    ipb_axi_sm        => axi_sm
  );
  
  ipb_axi_inst: entity work.ipbus_transport_axi_if
    generic map (
      BUFWIDTH        => BUFWIDTH,
      ADDRWIDTH       => ADDRWIDTH)
    port map (
      ipb_clk         => clk_ipb,
      rst_ipb         => rst_ipb_ctrl,
      axi_in          => axi_ms,
      axi_out         => axi_sm,
      pkt_done        => ipb_pkt_done,
      ipb_trans_rx    => trans_in, 
      ipb_trans_tx    => trans_out
    );


  ipb_trans_inst: entity work.transactor
    port map (
      clk             => clk_ipb,
      rst             => rst_ipb_ctrl,
      ipb_out         => ipb_out,
      ipb_in          => ipb_in,
      ipb_req         => open,
      ipb_grant       => '1',
      trans_in        => trans_in,
      trans_out       => trans_out,
      cfg_vector_in   => (others => '0'),
      cfg_vector_out  => open
    );
    
    ipb_clk  <= clk_ipb;
    ipb_rst  <= rst_ipb;

end rtl;
