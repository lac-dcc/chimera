library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- note
-- EBONE assumes 2 levels pipelines for BRAM
-- addr register latched, then data latched

-- note
-- pow(addr_width, 2) * data_width = mem_size * 8
-- addr_width the addressing bus width, in bits
-- data_width the data bus width, in bits
-- mem_size the memory size, in bytes

-- Nlog2
use work.ebs_pkg.Nlog2;

entity dualport_bram is

 generic
 (
  MEM_SIZE: natural; -- memory size, in bytes
  WR_DWIDTH: natural := 32; -- write data bus width, in bits
  RD_DWIDTH: natural := 64 -- read data bus width, in bits
 );
 port
 (
  rst: in std_ulogic;

  wr_clk: in std_ulogic;
  wr_en: in std_ulogic;
  wr_addr: in std_logic_vector(Nlog2((MEM_SIZE * 8) / WR_DWIDTH) - 1 downto 0);
  wr_data: in std_logic_vector(WR_DWIDTH - 1 downto 0);

  rd_clk: in std_ulogic;
  rd_en: in std_ulogic;
  rd_addr: in std_logic_vector(Nlog2((MEM_SIZE * 8) / RD_DWIDTH) - 1 downto 0);
  rd_data: out std_logic_vector(RD_DWIDTH - 1 downto 0)
 );
end dualport_bram;

architecture dualport_bram_archi of dualport_bram is

 type bram_type is array(0 to MEM_SIZE / 4 - 1) of
  std_logic_vector(WR_DWIDTH - 1 downto 0);
 signal bram_array: bram_type;

 -- latched registers
 signal latched_rd_addr: integer;

 -- null address
 signal rd_addr_zero: std_logic_vector(rd_addr'range);

begin

 -- FIXME
 assert WR_DWIDTH = 32 report "WR_DWIDTH != 32" severity failure;
 assert RD_DWIDTH = 64 report "RD_DWIDTH != 64" severity failure;

 -- write process
 process(wr_clk, rst)
 begin
  if rst = '1' then
  elsif rising_edge(wr_clk) then
   if wr_en = '1' then
    bram_array(to_integer(unsigned(wr_addr))) <= wr_data;
   end if;
  end if;
 end process;

 -- read addr latch process
 process(rd_clk, rst)
 begin
  if rst = '1' then
   latched_rd_addr <= to_integer(unsigned(rd_addr_zero));
  elsif rising_edge(rd_clk) then
   -- note: op & '0' == op * 2
   latched_rd_addr <= to_integer(unsigned(rd_addr) & '0');
  end if;
 end process;

 -- read data process
 process(rd_clk, rst)
 begin
  if rst = '1' then
  elsif rising_edge(rd_clk) then
   if rd_en = '1' then
    rd_data(63 downto 32) <= bram_array(latched_rd_addr + 1);
    rd_data(31 downto 0) <= bram_array(latched_rd_addr);
   end if;
  end if;
 end process;

end;
