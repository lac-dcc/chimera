-- block generation unit

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity bgu is
 port
 (
  -- synchronous logic
  rst: in std_logic;
  clk: in std_logic;

  -- btd fifo
  btd_fifo_wr_en: out std_logic;
  btd_fifo_wr_dat: in std_logic_vector(work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
  btd_fifo_wr_full: in std_logic
 );
end bgu;

architecture bgu_arch of bgu is
 signal btd_fifo_rd_en: std_logic;
begin

 bgu_dcc:
 work.rashpa.dcc
 port map
 (
  rst => rst,
  clk => clk,
  btd_fifo_rd_en => btd_fifo_rd_en,
  btd_fifo_rd_dat => btd_fifo_wr_dat,
  btd_fifo_rd_empty => '0'
 );

end bgu_arch;
