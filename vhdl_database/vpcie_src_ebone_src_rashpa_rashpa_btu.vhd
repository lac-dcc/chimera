-- block transfer unit

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use std.textio.all;

entity btu is
 port
 (
  -- synchronous logic
  rst_i: in std_logic;
  clk_i: in std_logic;

  -- btd fifo
  btd_fifo_rd_en_o: out std_logic;
  btd_fifo_rd_dat_i: in std_logic_vector(work.rashpa.BTD_FIFO_WIDTH - 1 downto 0);
  btd_fifo_rd_empty_i: in std_logic
 );
end btu;

architecture btu_arch of btu is
begin

 process(clk_i, rst_i)
  variable l: line;
 begin
  if rst_i = '1' then
   btd_fifo_rd_en_o <= '0';
  elsif rising_edge(clk_i) then
   btd_fifo_rd_en_o <= '0';
   if btd_fifo_rd_empty_i = '0' then
    btd_fifo_rd_en_o <= '1';
    write(l, String'("BTU event"));
    writeline(output, l);
   end if;
  end if;
 end process;

end btu_arch;
