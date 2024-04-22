library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package rashpa is

 -- block transfer descriptor fifo
 constant BTD_FIFO_WIDTH: natural := 256;
 constant BTD_FIFO_DEPTH: natural := 16;

component btd_fifo is
 port
 (
  -- clocking interface
  clk: in std_logic;
  rst: in std_logic;

  -- bgu interface
  bgu_wr_en: in std_logic;
  bgu_wr_dat: in std_logic_vector(BTD_FIFO_WIDTH - 1 downto 0);
  bgu_wr_full: out std_logic;

  -- btu interface
  btu_rd_en: in std_logic;
  btu_rd_dat: out std_logic_vector(BTD_FIFO_WIDTH - 1 downto 0);
  btu_rd_empty: out std_logic
 );
end component;

component ebs is
 port
 (
  rst: in std_logic;
  clk: in std_logic
 );
end component;

component bgu is
 port
 (
  -- synchronous logic
  rst: in std_logic;
  clk: in std_logic;

  -- btd fifo
  btd_fifo_wr_en: out std_logic;
  btd_fifo_wr_dat: in std_logic_vector(BTD_FIFO_WIDTH - 1 downto 0);
  btd_fifo_wr_full: in std_logic
 );
end component;

component btu is
 port
 (
  -- synchronous logic
  rst_i: in std_logic;
  clk_i: in std_logic;

  -- btd fifo
  btd_fifo_rd_en_o: out std_logic;
  btd_fifo_rd_dat_i: in std_logic_vector(BTD_FIFO_WIDTH - 1 downto 0);
  btd_fifo_rd_empty_i: in std_logic
 );
end component;

component dsc is
 port
 (
  -- synchronous logic
  rst: in std_logic;
  clk: in std_logic
 );
end component;

component ddc is
 port
 (
  -- synchronous logic
  rst: in std_logic;
  clk: in std_logic
 );
end component;

component dcc is
 port
 (
  -- synchronous logic
  rst: in std_logic;
  clk: in std_logic;

  -- dca
  btd_fifo_rd_en: in std_logic;
  btd_fifo_rd_dat: in std_logic_vector(BTD_FIFO_WIDTH - 1 downto 0);
  btd_fifo_rd_empty: in std_logic
 );
end component;

end package rashpa;
