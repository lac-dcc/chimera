-- Copyright (C) 2013, 2016 Martin Åberg
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.greta_pkg.all;
use work.gbus_bfm_pkg.all;

entity tb_fast is
end;

architecture testbench of tb_fast is
  signal clk            : std_logic := '1';
  -- GRETA bus interface
  signal gbi            : gbus_in := gbus_in_none;
  signal gbo            : gbus_out;
  -- SDRAM controller
  signal ram            : ram_bus;
  signal ram_nwe        : bus_nwe;
  signal ram_ack        : std_logic := '1';
  signal ram_rdata      : bus_data := x"1234";

  signal end_of_simulation : boolean := false;
  constant CLK_PERIOD : Delay_length := 7.5 ns;

  constant GSLAVE_DUT : gslave := 0;
  constant DUTROM : expansionrom := (
    16#00# =>     (ERT_ZORROII or ERT_MEMLIST),
    16#01# =>     (ERT_CHAINEDCONFIG or ERT_MEMSIZE_8MB),
    16#03# => not (FAST_PRODUCT_NUMBER),
    16#08# => not (HACKER_MANUFACTURER(15 downto 12)),
    16#09# => not (HACKER_MANUFACTURER(11 downto  8)),
    16#0a# => not (HACKER_MANUFACTURER( 7 downto  4)),
    16#0b# => not (HACKER_MANUFACTURER( 3 downto  0)),
    16#20# =>     "0000",
    16#21# =>     "0000",
    others => not "0000"
  );

begin
  dut : entity work.fast
  port map(
    clk             => clk,
    reset           => gbi.reset,
    req             => gbi.req,
    nwe             => gbi.nwe,
    addr            => gbi.addr,
    wdata           => gbi.wdata,
    config_in       => gbi.config(GSLAVE_DUT),
    dev_select      => gbo.dev_select,
    rdata           => gbo.rdata,
    config_out      => gbo.config,
    ram             => ram,
    ram_ack         => ram_ack,
    ram_rdata       => ram_rdata
  );

  process
  begin
    if end_of_simulation = false then
      clk <= not clk;
      wait for CLK_PERIOD / 2.0;
    else
      wait;
    end if;
  end process;

  -- Verify AUTOCONFIG0 area
  process
    procedure assert_fast_ram_silent is
    begin
      -- Test borders of the three areas in 8MB space.
      gbus_silent(clk, gbi, gbo, 16#1FFFF0#, 16#200010#);
      gbus_silent(clk, gbi, gbo, 16#3FFFF0#, 16#400010#);
      gbus_silent(clk, gbi, gbo, 16#7FFFF0#, 16#800010#);
      gbus_silent(clk, gbi, gbo, 16#9FFFF0#, 16#A00010#);
    end;

    procedure assert_rom_silent is
    begin
      -- AUTOCONFIG SPACE
      gbus_silent(clk, gbi, gbo, 16#E7FFF0#, 16#E80010#);
      gbus_silent(clk, gbi, gbo, 16#E8FFF0#, 16#E90010#);
    end;

    procedure assert_all_silent is
    begin
      assert_fast_ram_silent;
      assert_rom_silent;
    end;

    variable d16  : bus_data;
    variable d8   : bus_data8;
    variable s    : boolean;
  begin
    gbus_reset(clk, gbi, gbo);
    -- Assure that DUT doesn't set dev_select when unconfigured.
    assert_all_silent;

    gbi.config(GSLAVE_DUT) <= '1';
    -- Evaluate the UNCONFIGURED state when selected for configuraton.
    -- Area before AUTOCONFIG0
    gbus_silent(clk, gbi, gbo, 16#E7FFF0#, 16#E7FFFF#);

    -- Area after AUTOCONFIG0
    gbus_silent(clk, gbi, gbo, 16#E90000#, 16#E90010#);

    -- Test borders of the three areas in 8MB space.
    gbus_silent(clk, gbi, gbo, 16#1FFFF0#, 16#200010#);
    gbus_silent(clk, gbi, gbo, 16#3FFFF0#, 16#400010#);
    gbus_silent(clk, gbi, gbo, 16#7FFFF0#, 16#800010#);
    gbus_silent(clk, gbi, gbo, 16#9FFFF0#, 16#A00010#);

    verify_rom(clk, gbi, gbo, DUTROM);

    -- Tell the device to shut up.
    assert gbo.config = '0';
    gbus_write(clk, gbi, gbo, x"E8004C", x"abcd");
    assert gbo.config = '1';
    -- Verify that it did.
    assert_all_silent;

    -- Configure device.
    gbus_reset(clk, gbi, gbo);
    gbi.config(GSLAVE_DUT) <= '1';
    assert gbo.config = '0';
    gbus_write(clk, gbi, gbo, x"E80048", x"abcd");
    assert gbo.config = '1';
    assert_rom_silent;

    gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(16#200000#, 24)), d16, s);
    end_of_simulation <= true;
    wait;
  end process;

  -- Ensure that rdata is zero whenever we are not selected.
  process
  begin
    wait until rising_edge(clk);
    if gbi.reset = '0' and gbo.dev_select = '0' then
      assert gbo.rdata = x"0000";
    end if;
  end process;
end;

