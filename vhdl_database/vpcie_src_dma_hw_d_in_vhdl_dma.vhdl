--
-- pcie bar and address comparator
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pcie;


entity bar_addr_cmp is
 generic
 (
  GENERIC_BAR: natural;
  GENERIC_ADDR: natural
 );
 port
 (
  bar: in std_ulogic_vector(pcie.BAR_WIDTH - 1 downto 0);
  addr: in std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);
  is_eq: out std_ulogic
 );
end bar_addr_cmp;


architecture rtl of bar_addr_cmp is
begin
 -- combinatory logic
 process(bar, addr)
 begin
  is_eq <= '0';
  if (unsigned(bar) = GENERIC_BAR) and (unsigned(addr) = GENERIC_ADDR) then
   is_eq <= '1';
  end if;
 end process;
end rtl;


--
-- pcie write only register
--


library ieee;
use ieee.std_logic_1164.all;
use work.pcie;


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

  -- clear contents
  clr_en: in std_ulogic;

  -- pcie request
  req_en: in std_ulogic;
  req_wr: in std_ulogic;
  req_bar: in std_ulogic_vector(pcie.BAR_WIDTH - 1 downto 0);
  req_addr: in std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);
  req_data: in std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);

  -- latched data
  reg_data: out std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0)
 );
end entity;


architecture rtl of reg_wo is
 signal data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);
 signal is_eq: std_ulogic;
 signal is_en: std_ulogic;
begin

 bar_addr_cmp_entity: entity work.bar_addr_cmp
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
  elsif rising_edge(clk) then
   if clr_en = '1' then
    data <= (others => '0');
   elsif is_en = '1' then
    data <= req_data;
   end if;
   reg_data <= data;
  end if;
 end process;

end rtl;


--
-- pcie readwrite register
--

library ieee;
use ieee.std_logic_1164.all;
use work.pcie;


entity reg_ro is
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

  -- set contents
  set_en: in std_ulogic;
  set_data: in std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);

  -- pcie request
  req_en: in std_ulogic;
  req_wr: in std_ulogic;
  req_bar: in std_ulogic_vector(pcie.BAR_WIDTH - 1 downto 0);
  req_addr: in std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);

  -- pcie reply
  rep_en: out std_ulogic;
  rep_data: out std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);

  -- latched data
  reg_data: out std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0)
 );
end entity;


architecture rtl of reg_ro is
 signal data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);
 signal is_eq: std_ulogic;
 signal is_en: std_ulogic;
begin

 bar_addr_cmp_entity: entity work.bar_addr_cmp
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

 is_en <= is_eq and req_en and (not req_wr);

 process(rst, clk)
 begin
  if rst = '1' then
   data <= (others => '0');
  elsif rising_edge(clk) then
   -- always disable, even if not selected
   rep_en <= '0';

   -- forced update
   if set_en = '1' then
    data <= set_data;
   -- is_en when read request
   elsif is_en = '1' then
    rep_data <= data;
    rep_en <= '1';
   end if; -- is_en

   reg_data <= data;

  end if; -- rising_edge
 end process;

end rtl;


--
-- log2 function
--

--
-- d = s * log2(x)
--

package util is
 function log2(x: natural) return natural;
end package util;

package body util is
 function log2(x: natural) return natural is
 begin
  -- Works for up to 32 bit integers
  for i in 1 to 30 loop
   if(2 ** i > x) then
    return (i - 1);
   end if;
  end loop;
  return(30);
end function log2;
end package body util;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul_pow2 is
 generic
 (
  GENERIC_SIZE: natural;
  GENERIC_X: natural
 );
 port
 (
  s: in unsigned(GENERIC_SIZE - 1 downto 0);
  d: out unsigned(GENERIC_SIZE - 1 downto 0)
 );
end entity;

architecture rtl of mul_pow2 is
 constant log2x: natural := work.util.log2(GENERIC_X);
begin
 process(s)
 begin
  d(GENERIC_SIZE - 1 downto log2x) <= s(GENERIC_SIZE - 1 - log2x downto 0);
  d(log2x - 1 downto 0) <= (others => '0');
 end process;
end rtl;



--
-- dma engine
--
-- bar[1] 32 bits registers:
-- 0. DMA_REG_CTL
-- 1. DMA_REG_STA
-- 2. DMA_REG_ADL
-- 3. DMA_REG_ADH
-- 4. DMA_REG_BAZ
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.pcie;


entity dma is
 generic
 (
  GENERIC_BAR: natural := 0;
  -- address in bar
  GENERIC_ADDR: natural := 16#00#
 );
 port
 (
  rst: in std_ulogic;
  clk: in std_ulogic;

  req_en: in std_ulogic;
  req_ack: out std_ulogic;
  req_wr: in std_ulogic;
  req_bar: in std_ulogic_vector(pcie.BAR_WIDTH - 1 downto 0);
  req_addr: in std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);
  req_data: in std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);

  rep_en: out std_ulogic;
  rep_data: out std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);

  mwr_en: out std_ulogic;
  mwr_addr: out std_ulogic_vector(pcie.ADDR_WIDTH - 1 downto 0);
  mwr_data: out std_ulogic_vector(pcie.PAYLOAD_WIDTH - 1 downto 0);
  mwr_size: out std_ulogic_vector(pcie.SIZE_WIDTH - 1 downto 0);

  msi_en: out std_ulogic
 );
end entity;


architecture rtl of dma is

 -- register latched values
 signal ctl_data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);
 signal sta_data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);
 signal adl_data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);
 signal adh_data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);
 signal baz_data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);

 -- status register signals
 signal sta_set_en: std_ulogic;
 signal sta_set_data: std_ulogic_vector(pcie.DATA_WIDTH - 1 downto 0);

 -- clear control register
 signal ctl_clr_en: std_ulogic;

 -- dma engine
 type dma_state_t is (idle, write_start, write_one, write_next, write_done);
 attribute enum_encoding: string;
 attribute enum_encoding of dma_state_t :
  type is ("00001 00010 00100 01000 10000");
 signal dma_state: dma_state_t;
 signal dma_next_state: dma_state_t;
 signal dma_data: std_ulogic_vector(pcie.PAYLOAD_WIDTH - 1 downto 0);
 signal dma_addr: unsigned(pcie.ADDR_WIDTH - 1 downto 0);
 signal dma_size: unsigned(15 downto 0);
 signal dma_msi_en: std_ulogic;

 -- current destination pointer and offset
 signal dma_ptr: unsigned(pcie.ADDR_WIDTH - 1 downto 0);
 signal dma_off: unsigned(15 downto 0);

 -- dma counter
 signal dma_counter_reg: unsigned(15 downto 0);
 signal dma_counter_clr: std_ulogic;
 signal dma_counter_en: std_ulogic; 

 constant DMA_BLOCK_SIZE: natural := pcie.PAYLOAD_WIDTH / 8;

begin

 -- equivalent to dma_off = dma_counter_reg * DMA_BLOCK_SIZE
 mul_pow2_entity: entity work.mul_pow2
 generic map
 (
  GENERIC_SIZE => 16,
  GENERIC_X => DMA_BLOCK_SIZE
 )
 port map
 (
  s => dma_counter_reg,
  d => dma_off
 );

 dma_ptr <= dma_addr + dma_off;

 mwr_data_generate: for i in 0 to (DMA_BLOCK_SIZE - 1) generate
  mwr_data(((i + 1) * 8 - 1) downto (i * 8)) <= baz_data(7 downto 0);
  -- std_ulogic_vector(dma_off(7 downto 0));
 end generate;

 -- state register
 process(rst, clk)
 begin
  if rst = '1' then
   dma_state <= idle;
  elsif rising_edge(clk) then
   dma_state <= dma_next_state;
  end if;
 end process;

 -- next state logic
 process(dma_state, ctl_data)
  variable l: line;
 begin
  case dma_state is

   when idle =>
    write(l, String'("idle_to_idle"));
    writeline(output, l);

    dma_next_state <= idle;
    if ctl_data(31) = '1' then
     write(l, String'("idle_to_write"));
     writeline(output, l);
     dma_next_state <= write_start;
    end if;

   when write_start =>
    write(l, String'("write_start_to_write"));
    writeline(output, l);
    dma_next_state <= write_one;

   when write_one =>
    write(l, String'("one_to_next"));
    writeline(output, l);
    dma_next_state <= write_next;

   when write_next =>
    write(l, String'("next_to_one"));
    writeline(output, l);
    dma_next_state <= write_one;
    if dma_off = dma_size then
     write(l, String'("next_to_done"));
     writeline(output, l);
     dma_next_state <= write_done;
    end if;

   when write_done =>
    write(l, String'("done_to_idle"));
    writeline(output, l);
    dma_next_state <= idle;

   when others =>
    write(l, String'("others_to_idle"));
    writeline(output, l);
    dma_next_state <= idle;

  end case;
 end process;

 -- moore output logic
 process(dma_state)
  variable l: line;
 begin
  dma_counter_clr <= '0';
  dma_counter_en <= '0';
  req_ack <= '0';
  mwr_en <= '0';
  msi_en <= '0';
  sta_set_en <= '0';
  ctl_clr_en <= '0';

  case dma_state is
   when idle =>

    write(l, String'("dma_state_idle"));
    writeline(output, l);

   when write_start =>

    dma_size <= unsigned(ctl_data(15 downto 0));
    dma_addr <= unsigned(adh_data(31 downto 0) & adl_data(31 downto 0));
    dma_counter_clr <= '1';

    sta_set_data(31 downto 0) <= x"00000000";
    sta_set_en <= '1';

    dma_msi_en <= ctl_data(30);
    ctl_clr_en <= '1';

    write(l, String'("dma_state_write_start"));
    writeline(output, l);

   when write_one =>

    write(l, String'("write_one "));

    mwr_addr <= std_ulogic_vector(dma_ptr);
    mwr_size <= std_ulogic_vector(to_unsigned(DMA_BLOCK_SIZE, pcie.SIZE_WIDTH));
    mwr_en <= '1';

   when write_next =>

    write(l, String'("write_next"));
    writeline(output, l);

    dma_counter_en <= '1';

   when write_done =>

    write(l, String'("write_done"));
    writeline(output, l);

    sta_set_data(31 downto 0) <= x"8000" & std_ulogic_vector(dma_off);
    sta_set_en <= '1';

    msi_en <= dma_msi_en;

    -- FIXME, could be done earlier
    req_ack <= '1';

   when others =>

    write(l, String'("dma_state_others"));
    writeline(output, l);

  end case;
 end process;

 -- dma counter
 process(rst, clk)
 begin
  if rst = '1' then
   dma_counter_reg <= (others => '0');
  elsif rising_edge(clk) then
   if dma_counter_clr = '1' then
    dma_counter_reg <= (others => '0');
   elsif dma_counter_en = '1' then
    dma_counter_reg <= dma_counter_reg + 1;
   end if;
  end if;
 end process;

 -- registers instanciation

 dma_reg_ctl: entity work.reg_wo
 generic map
 (
  GENERIC_BAR => GENERIC_BAR,
  GENERIC_ADDR => 16#00#
 )
 port map
 (
  rst => rst,
  clk => clk,
  clr_en => ctl_clr_en,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  reg_data => ctl_data
 );

 dma_reg_sta: entity work.reg_ro
 generic map
 (
  GENERIC_BAR => GENERIC_BAR,
  GENERIC_ADDR => 16#04#
 )
 port map
 (
  rst => rst,
  clk => clk,
  set_en => sta_set_en,
  set_data => sta_set_data,
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  rep_en => rep_en,
  rep_data => rep_data,
  reg_data => sta_data
 );

 dma_reg_adl: entity work.reg_wo
 generic map
 (
  GENERIC_BAR => GENERIC_BAR,
  GENERIC_ADDR => 16#08#
 )
 port map
 (
  rst => rst,
  clk => clk,
  clr_en => '0',
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  reg_data => adl_data
 );

 dma_reg_adh: entity work.reg_wo
 generic map
 (
  GENERIC_BAR => GENERIC_BAR,
  GENERIC_ADDR => 16#0c#
 )
 port map
 (
  rst => rst,
  clk => clk,
  clr_en => '0',
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  reg_data => adh_data
 );

 dma_reg_baz: entity work.reg_wo
 generic map
 (
  GENERIC_BAR => GENERIC_BAR,
  GENERIC_ADDR => 16#10#
 )
 port map
 (
  rst => rst,
  clk => clk,
  clr_en => '0',
  req_en => req_en,
  req_wr => req_wr,
  req_bar => req_bar,
  req_addr => req_addr,
  req_data => req_data,
  reg_data => baz_data
 );


end rtl;
