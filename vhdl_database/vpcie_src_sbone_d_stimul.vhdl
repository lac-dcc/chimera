library ieee;
use ieee.std_logic_1164.all;
use work.sbone;


entity stimul is
 port
 (
  rst: in std_ulogic;
  clk: in std_ulogic;
  req_en: out std_ulogic;
  req_wr: out std_ulogic;
  req_bar: out std_ulogic_vector(sbone.BAR_WIDTH - 1 downto 0);
  req_addr: out std_ulogic_vector(sbone.ADDR_WIDTH - 1 downto 0);
  req_data: out std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0)
 );
end entity;


architecture behav of stimul is
begin
 process(rst, clk)
  variable n: integer;
 begin
  if rst = '1' then
   n := 0;
   req_en <= '0';
  elsif rising_edge(clk) then
   req_en <= '0';
   -- post a write request to reg_rw_0
   if n = 3 then
    req_en <= '1';
    req_wr <= '1';
    req_bar <= b"001";
    req_addr <= x"0000000000000010";
    req_data <= x"1010101010101010";
   -- post a write request to reg_rw_1
   elsif n = 6 then
    req_en <= '1';
    req_wr <= '1';
    req_bar <= b"001";
    req_addr <= x"0000000000000018";
    req_data <= x"1818181818181818";
   -- post a read request to reg_rw_0
   elsif n = 9 then
    req_en <= '1';
    req_wr <= '0';
    req_bar <= b"001";
    req_addr <= x"0000000000000010";
   -- post a read request to reg_rw_1
   elsif n = 12 then
    req_en <= '1';
    req_wr <= '0';
    req_bar <= b"001";
    req_addr <= x"0000000000000018";
   end if;
   n := n + 1;
  end if; -- rising_edge
 end process;
end behav;
