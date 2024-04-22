-- bar_addr_cmp: combinatorial logic bar and address comparator
-- reg_wo: write only registers
-- reg_wo_msi: write only registers, trigger msi on write
-- reg_rw: read write registers
-- rep_mux: reply multiplexer

library ieee;
use ieee.std_logic_1164.all;

package sbone is

constant ADDR_WIDTH: natural := 64;
constant DATA_WIDTH: natural := 64;
constant BAR_WIDTH: natural := 3;
constant REG_RW_COUNT: natural := 2;

subtype rep_en_array_t is std_ulogic_vector(REG_RW_COUNT - 1 downto 0);
type rep_data_array_t is array (0 to REG_RW_COUNT - 1) of
 std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0);

component reg_wo is
 generic
 (
  GENERIC_BAR: natural;
  GENERIC_ADDR: natural
 );
 port
 (
  -- synchronous logic
  rst: in std_ulogic;
  clk: in std_ulogic;

  -- mui request
  req_en: in std_ulogic;
  req_wr: in std_ulogic;
  req_bar: in std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
  req_addr: in std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
  req_data: in std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0)
 );
end component reg_wo;

component reg_wo_msi is
 generic
 (
  GENERIC_BAR: natural;
  GENERIC_ADDR: natural
 );
 port
 (
  -- synchronous logic
  rst: in std_ulogic;
  clk: in std_ulogic;

  -- mui request
  req_en: in std_ulogic;
  req_wr: in std_ulogic;
  req_bar: in std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
  req_addr: in std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
  req_data: in std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0);

  -- msi enabling
  msi_en: out std_ulogic
 );
end component reg_wo_msi;

component reg_rw is
 generic
 (
  GENERIC_BAR: natural;
  GENERIC_ADDR: natural
 );
 port
 (
  -- synchronous logic
  rst: in std_ulogic;
  clk: in std_ulogic;

  -- mui request
  req_en: in std_ulogic;
  req_wr: in std_ulogic;
  req_bar: in std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
  req_addr: in std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
  req_data: in std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0);

  -- mui reply
  rep_en: out std_ulogic;
  rep_data: out std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0)
 );
end component reg_rw;

component bar_addr_cmp
 generic
 (
  GENERIC_BAR: natural;
  GENERIC_ADDR: natural
 );
 port
 (
  bar: in std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
  addr: in std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
  is_eq: out std_ulogic
 );
end component bar_addr_cmp;

component rep_mux
 generic
 (
  GENERIC_COUNT: natural := REG_RW_COUNT
 );
 port
 (
  rst: in std_ulogic;
  clk: in std_ulogic;
  rep_en_i: in rep_en_array_t;
  rep_data_i: in rep_data_array_t;
  rep_en_o: out std_ulogic;
  rep_data_o: out std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0)
 );
end component rep_mux;

end package sbone;
