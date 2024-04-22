library ieee;
use ieee.std_logic_1164.all;
use work.pcie;


entity stimul is
 port
 (
  rst: in std_ulogic;
  clk: in std_ulogic;
  req_en: out std_ulogic;
  req_wr: out std_ulogic;
  req_bar: out std_ulogic_vector(pcie.BAR_WIDTH - 1 downto 0);
  req_addr: out std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);
  req_data: out std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0)
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
   n := n + 1;
  end if; -- rising_edge
 end process;
end behav;
