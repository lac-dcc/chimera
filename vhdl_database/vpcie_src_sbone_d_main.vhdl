library ieee;
use ieee.std_logic_1164.all;
use work.sbone;
use work.pcie;

entity main is end main;

architecture rtl of main is
 -- generate options
 constant GENERATE_RST_CLK: boolean := true;
 constant GENERATE_STIMULI: boolean := false;

 -- synchronous logic
 signal rst: std_ulogic := '0';
 signal clk: std_ulogic;

 -- mui request signals
 signal req_en: std_ulogic;
 signal req_wr: std_ulogic;
 signal req_bar: std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
 signal req_addr: std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
 signal req_data: std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0);

 -- mui reply signals, one per rw register
 signal rep_en: sbone.rep_en_array_t;
 signal rep_data: sbone.rep_data_array_t;

 -- reg_rw_mux singals
 signal mux_rep_en: std_ulogic;
 signal mux_rep_data: std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0);

 -- reg_rw_msi
 signal msi_en: std_ulogic;

begin

 sbone_reg_wo_0: sbone.reg_wo
 generic map
 (
  GENERIC_BAR => 1,
  GENERIC_ADDR => 16#00#
 )
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data
 );

 sbone_reg_wo_1: sbone.reg_wo
 generic map
 (
  GENERIC_BAR => 1,
  GENERIC_ADDR => 16#08#
 )
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data
 );

 sbone_reg_rw_0: sbone.reg_rw
 generic map
 (
  GENERIC_BAR => 1,
  GENERIC_ADDR => 16#10#
 )
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  rep_en => rep_en(0),
  rep_data => rep_data(0)
 );

 sbone_reg_rw_1: sbone.reg_rw
 generic map
 (
  GENERIC_BAR => 1,
  GENERIC_ADDR => 16#18#
 )
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  rep_en => rep_en(1),
  rep_data => rep_data(1)
 );

 sbone_reg_wo_msi: sbone.reg_wo_msi
 generic map
 (
  GENERIC_BAR => 1,
  GENERIC_ADDR => 16#20#
 )
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  msi_en => msi_en
 );

 sbone_rep_mux: sbone.rep_mux
 port map
 (
  rst => rst,
  clk => clk,
  rep_en_i => rep_en,
  rep_data_i => rep_data,
  rep_en_o => mux_rep_en,
  rep_data_o => mux_rep_data
 );

 -- pcie endpoint
 pcie_endpoint: pcie.endpoint
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_ack => '1', -- fixme
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  rep_en => mux_rep_en,
  rep_data => mux_rep_data,
  mwr_en => '0',
  mwr_addr => (others => '0'),
  mwr_data => (others => '0'),
  mwr_size => (others => '0'),
  msi_en => msi_en
 );

 -- reset and clock generation
 rst_clk_generate_1: if GENERATE_RST_CLK = true generate
 rst_clk_entity: entity work.rst_clk
 port map
 (
  rst => rst,
  clk => clk
 );
 end generate;

 -- unit testing
 stimul_generate: if GENERATE_STIMULI = true generate
 stimul_entity: entity work.stimul
 port map
 (
  rst => rst,
  clk => clk,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data
 );
 end generate;

end rtl;
