--
library ieee;
use ieee.std_logic_1164.all;
use work.sbone;


--
entity reg_wo is
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
end entity;


--
architecture rtl of reg_wo is
 signal data: std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0);
 signal is_eq: std_ulogic;
 signal is_en: std_ulogic;
begin

 bar_addr_cmp: sbone.bar_addr_cmp
 generic map
 (
  GENERIC_BAR => GENERIC_BAR,
  GENERIC_ADDR => GENERIC_ADDR
 )
 port map
 (
  bar => req_bar,
  addr => req_addr,
  is_eq => is_eq
 );

 is_en <= is_eq and req_en and req_wr;

 process(rst, clk)
 begin
  if rst = '1' then
   data <= (others => '0');
  elsif rising_edge(clk) and is_en = '1' then
   data <= req_data;
  end if;
 end process;

end rtl;
