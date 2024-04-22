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
library ieee;
use ieee.std_logic_1164.all;
use work.greta_pkg.all;

entity disk is
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
    ram_rdata   : in    bus_data;

    --- SECURE DIGITAL (SPI)
    SPI_CLK     : out   std_logic;
    SPI_nCS     : out   std_logic;
    SPI_DO      : out   std_logic;
    SPI_DI      : in    std_logic
  );
end;

architecture rtl of disk is
  type disk_state is (
    UNCONFIGURED, SHUT_UP_FOREVER, CONFIGURED
  );
  
  signal state : disk_state := UNCONFIGURED;
  signal addr_autoconfig_disk : boolean := false;
  signal dev_select_reg : std_logic := '0';
  signal rom_rdata : std_logic_vector(15 downto 12);
  signal disk_rdata : bus_data := x"c0de";
  signal rdata_reg : bus_data := (others => '0');
  signal addr_low7 : std_logic_vector(7 downto 0);
  signal slot : std_logic_vector(2 downto 0) := "000";

begin

  SPI_CLK <= 'Z';
  SPI_nCS <= 'Z';
  SPI_DO  <= 'Z';

  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        state <= UNCONFIGURED;
        ram.req <= '0';
        slot <= "000";
      else
        case state is
        when UNCONFIGURED =>
          if (
            req = '1' and nwe(UPPER) = '0' and
            addr_autoconfig_disk and config_in = '1'
          ) then
            if is_autoconfig_reg(ec_ShutUp, addr) then
              state <= SHUT_UP_FOREVER;
            elsif is_autoconfig_reg(ec_BaseAddress, addr) then
              state <= CONFIGURED;
              slot <= wdata(10 downto 8);
            end if;
          end if;

        when SHUT_UP_FOREVER =>
          null;

        when CONFIGURED =>
          null;

        end case;
      end if;
    end if;
  end process;

  -- Address comparator for the unconfigured or configured
  -- device.
  addr_autoconfig_disk <= is_autoconfig(addr) and
                          get_autoconfig_slot(addr) = slot;

  -- Register for rdata back to bus_interface.
  process(clk)
  begin
    if rising_edge(clk) then
      -- Create register stage for dev_select and rdata. This
      -- improves performance as the signals are heavy on logic
      -- and are used as output.
      if (addr_autoconfig_disk and config_in = '1' and
       state /= SHUT_UP_FOREVER) then
        -- We are selected.
        dev_select_reg <= '1';
        if state = UNCONFIGURED then
          -- Output AUTOCONFIG ROM data
          rdata_reg(15 downto 12) <= rom_rdata;
        else
          -- Reload rdata with disk register data.
          rdata_reg <= disk_rdata;
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
      (ERT_ZORROII)                           when x"00",
      (ERT_CHAINEDCONFIG or ERT_MEMSIZE_64K)  when x"02",
      not (DISK_PRODUCT_NUMBER)               when x"06",
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

