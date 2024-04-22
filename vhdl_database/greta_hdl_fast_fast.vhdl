--
-- Copyright (C) 2013 Martin Åberg
--
--  This program is free software: you can redistribute it
--  and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation,
--  either version 3 of the License, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General
--  Public License along with this program.  If not, see
--  <http://www.gnu.org/licenses/>.
--

-- Amiga Fast RAM
library ieee;
use ieee.std_logic_1164.all;
use work.greta_pkg.all;

entity fast is
  port(
    clk         : in    std_logic;
    reset       : in    std_logic;

    req         : in    std_logic;
    nwe         : in    bus_nwe;
    dev_select  : out   std_logic;
    addr        : in    bus_addr;
    wdata       : in    bus_data;
    rdata       : out   bus_data;
    config_in   : in    std_logic;
    config_out  : out   std_logic;

    ram         : out   ram_bus;
    ram_ack     : in    std_logic;
    ram_rdata   : in    bus_data
  );
end;

architecture rtl of fast is
  type fast_state is (
    UNCONFIGURED, SHUT_UP_FOREVER, CONFIGURED, RAM_ACCESS
  );
  
  signal state : fast_state := UNCONFIGURED;
  signal addr_autoconfig0 : boolean := false;
  signal addr_fast_ram : boolean := false;
  signal dev_select_reg : std_logic := '0';
  signal rom_rdata : std_logic_vector(15 downto 12);
  signal rdata_reg : bus_data := (others => '0');
  signal addr_low7 : std_logic_vector(7 downto 0);

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        state <= UNCONFIGURED;
        ram.req <= '0';
      else
        case state is
        when UNCONFIGURED =>
          if (
            req = '1' and nwe(UPPER) = '0' and
            addr_autoconfig0 and config_in = '1'
          ) then
            if is_autoconfig_reg(ec_ShutUp, addr) then
              state <= SHUT_UP_FOREVER;
            elsif is_autoconfig_reg(ec_BaseAddress, addr) then
              state <= CONFIGURED;
            end if;
          end if;

        when SHUT_UP_FOREVER =>
          null;

        when CONFIGURED =>
          if req = '1' and addr_fast_ram then
            ram.req <= '1';
            state <= RAM_ACCESS;
          end if;

        when RAM_ACCESS =>
          if ram_ack = '1' then
            ram.req <= '0';
            state <= CONFIGURED;
          end if;
        end case;
      end if;
    end if;
  end process;

  -- Address comparator for the unconfigured device.
  addr_autoconfig0 <=  is_autoconfig(addr) and
                         get_autoconfig_slot(addr) = "000";
  -- Address comparator for the configured device.
  addr_fast_ram   <=  is_fast_ram(addr);

  -- Register for rdata back to bus_interface.
  process(clk)
  begin
    if rising_edge(clk) then
      -- Create register stage for dev_select and rdata. This
      -- improves performance as the signals are heavy on logic
      -- and are used as output.
      if (addr_autoconfig0 and state = UNCONFIGURED and
       config_in = '1')
      or  (addr_fast_ram and state /= UNCONFIGURED and
       state /= SHUT_UP_FOREVER)

      then
        -- Selected for AUTOCONFIG or Fast RAM
        dev_select_reg <= '1';
        if state = UNCONFIGURED then
          -- Output AUTOCONFIG ROM data
          rdata_reg(15 downto 12) <= rom_rdata;
        elsif ram_ack = '1' then
          -- Reload rdata when SDRAM has given us a read word.
          rdata_reg <= ram_rdata;
        end if;
      else
        -- We must give zeroes out when not selected.
        dev_select_reg <= '0';
        rdata_reg <= x"0000";
      end if;
    end if;
  end process;

  -- AUTOCONFIG ROM
  addr_low7 <= '0' & addr(6 downto 1) & '0';
  with addr_low7 select
    rom_rdata <=
      -- ERT_MEMLIST links memory into memory free list.
      (ERT_ZORROII or ERT_MEMLIST)            when x"00",
      (ERT_CHAINEDCONFIG or ERT_MEMSIZE_8MB)  when x"02",
      not (FAST_PRODUCT_NUMBER)               when x"06",
      not (HACKER_MANUFACTURER(15 downto 12)) when x"10",
      not (HACKER_MANUFACTURER(11 downto  8)) when x"12",
      not (HACKER_MANUFACTURER( 7 downto  4)) when x"14",
      not (HACKER_MANUFACTURER( 3 downto  0)) when x"16",
      "0000"                                  when x"40",
      "0000"                                  when x"42",
      "1111" when others;

  dev_select  <= dev_select_reg;
  rdata       <= rdata_reg;
  config_out  <=  '0' when state = UNCONFIGURED else
                  '1';
  ram.nwe <= nwe;
  ram.addr <= addr;
  ram.wdata <= wdata;
end;
