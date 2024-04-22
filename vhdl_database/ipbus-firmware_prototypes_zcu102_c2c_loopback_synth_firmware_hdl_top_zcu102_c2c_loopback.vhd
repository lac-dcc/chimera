library ieee;
use ieee.std_logic_1164.all;

use work.ipbus.all;

entity top is 
  port(
    ext_rst             : in  std_logic;
    dipsw               : in  std_logic_vector(7 downto 0);
    leds                : out std_logic_vector(7 downto 0);
    --
    c2c_m_gt_clkn       : in  std_logic;
    c2c_m_gt_clkp       : in  std_logic;
    c2c_m_gt_rxn        : in  std_logic;
    c2c_m_gt_rxp        : in  std_logic;
    c2c_m_gt_txn        : out std_logic;
    c2c_m_gt_txp        : out std_logic;
    
    c2c_s_gt_clkn       : in  std_logic;
    c2c_s_gt_clkp       : in  std_logic;
    c2c_s_gt_rxn        : in  std_logic;
    c2c_s_gt_rxp        : in  std_logic;
    c2c_s_gt_txn        : out std_logic;
    c2c_s_gt_txp        : out std_logic
  );

end top;

architecture rtl of top is
  
 
  signal local_ipb_clk  : std_logic;
  signal local_ipb_rst  : std_logic;
    
  signal local_ipb_out  : ipb_wbus;
  signal local_ipb_in   : ipb_rbus;

  signal remote_ipb_clk : std_logic;
  signal remote_ipb_rst : std_logic;
    
  signal remote_ipb_out : ipb_wbus;
  signal remote_ipb_in  : ipb_rbus;
  
  signal aclk           : std_logic;
  signal aresetn        : std_logic;

  signal ipb_soft_rst   : std_logic;
  signal c2c_areset     : std_logic;
  signal c2c_aresetn    : std_logic;
  
  signal c2c_master_stat_axiclk, c2c_master_stat_ipbclk : std_logic_vector(9 downto 0);
  signal c2c_slave_stat_axiclk, c2c_slave_stat_ipbclk : std_logic_vector(7 downto 0);


begin

  local_infra_inst: entity work.zcu102_infra_c2c_loopback_master
    generic map (
      BUFWIDTH   => 0, 
      ADDRWIDTH  => 11
      )
    port map(
      ext_rst    => ext_rst,
      --
      aclk_o     => aclk, 
      aresetn_o  => aresetn,
      --
      gt_clkn    => c2c_m_gt_clkn,
      gt_clkp    => c2c_m_gt_clkp,
      gt_rxn     => c2c_m_gt_rxn,
      gt_rxp     => c2c_m_gt_rxp,
      gt_txn     => c2c_m_gt_txn,
      gt_txp     => c2c_m_gt_txp,
      --
      c2c_aresetn => c2c_aresetn,
      c2c_stat   => c2c_master_stat_axiclk,
      --
      ipb_clk    => local_ipb_clk,
      ipb_rst    => local_ipb_rst,
      ipb_in     => local_ipb_in,
      ipb_out    => local_ipb_out
      );
      

  local_slaves: entity work.ipbus_example
    port map(
      ipb_clk    => local_ipb_clk,
      ipb_rst    => local_ipb_rst,
      ipb_in     => local_ipb_out,
      ipb_out    => local_ipb_in,
      userled    => leds(0),
      status(7 downto 0)  => c2c_slave_stat_ipbclk,
      status(17 downto 8) => c2c_master_stat_ipbclk,
      status(19 downto 18) => "00",
      status(31 downto 20) => X"abc"
      );

  c2c_reset_cdc: entity work.ipbus_cdc_reg
    port map (
      clk  => local_ipb_clk,
      clks => aclk,
      d(0) => ipb_soft_rst,
      q(0) => c2c_areset
      );

  c2c_aresetn <= not c2c_areset;

  c2c_stat_cdc: entity work.ipbus_cdc_reg
    generic map (
      N => 18
      )
    port map (
      clk  => aclk,
      clks => local_ipb_clk,
      d(7 downto 0)  => c2c_slave_stat_axiclk,
      d(17 downto 8) => c2c_master_stat_axiclk,
      q(7 downto 0)  => c2c_slave_stat_ipbclk,
      q(17 downto 8) => c2c_master_stat_ipbclk
      );


  remote_infra_inst: entity work.zcu102_infra_c2c_loopback_slave
    generic map (
      BUFWIDTH   => 0, 
      ADDRWIDTH  => 11
      )
    port map(
      aclk       => aclk,
      aresetn    => aresetn,
      c2c_stat_o => c2c_slave_stat_axiclk(2 downto 0), --leds(2 downto 0),
      gtx_stat_o => c2c_slave_stat_axiclk(7 downto 3), --leds(7 downto 3),
            --
      gt_clkn    => c2c_s_gt_clkn,
      gt_clkp    => c2c_s_gt_clkp,
      gt_rxn     => c2c_s_gt_rxn,
      gt_rxp     => c2c_s_gt_rxp,
      gt_txn     => c2c_s_gt_txn,
      gt_txp     => c2c_s_gt_txp, 
      --
      ipb_clk    => remote_ipb_clk,
      ipb_rst    => remote_ipb_rst,
      ipb_in     => remote_ipb_in,
      ipb_out    => remote_ipb_out
      );

  remote_slaves: entity work.ipbus_example
    port map(
      ipb_clk    => remote_ipb_clk,
      ipb_rst    => remote_ipb_rst,
      ipb_in     => remote_ipb_out,
      ipb_out    => remote_ipb_in,
      userled    => leds(1)
      );

  leds(7 downto 2) <= (others => '0');

end rtl;
