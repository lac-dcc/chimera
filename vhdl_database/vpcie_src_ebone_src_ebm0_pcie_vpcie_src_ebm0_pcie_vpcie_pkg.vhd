-- reduced version of ebm0_pcie_a using the VPCIE endpoint

library ieee;
use ieee.std_logic_1164.all;
use work.ebs_pkg.all;

package ebm0_pcie_vpcie_pkg is

 component ebm0_pcie_vpcie
 generic
 (
  EBFT_DWIDTH: natural := 64;
  EBS_DWIDTH: natural := 32
 );
 port
 (
  clk: in std_logic;
  rst: in std_logic;
  
  -- master 0
  eb_m0_clk_o: out std_logic;
  eb_m0_rst_o: out std_logic;
  eb_m0_brq_o: out std_logic;
  eb_m0_bg_i: in std_logic;
  eb_m0_as_o: out std_logic;
  eb_m0_eof_o: out std_logic;
  eb_m0_aef_o: out std_logic;
  eb_m0_dat_o: out std32;
  eb_dk_i: in std_logic;
  eb_err_i: in std_logic;
  eb_dat_i: in std32;

  -- fast transmitter
  eb_ft_dxt_i: in std_logic_vector(EBFT_DWIDTH - 1 downto 0);
  eb_bmx_i: in std_logic;
  eb_bft_i: in std_logic;
  eb_as_i: in std_logic;
  eb_eof_i: in std_logic;
  eb_dk_o: out std_logic;
  eb_err_o: out std_logic
 );
 end component;

end package ebm0_pcie_vpcie_pkg;
