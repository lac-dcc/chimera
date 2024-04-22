-- Copyright (C) 2016 Martin Åberg
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- NOTE: This unit does not test the SPI controller. It tests the ASPIC
-- AUTOCONFIG.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.greta_pkg.all;
use work.gbus_bfm_pkg.all;
use work.aspic_regs.all;

entity tb_aspic is
end;

architecture testbench of tb_aspic is
  signal clk            : std_logic := '1';
  -- GRETA bus interface
  signal gbi            : gbus_in := gbus_in_none;
  signal gbo            : gbus_out;
  -- SPI I/O
  signal spii           : spi_in;
  signal spio           : spi_out;

  signal end_of_simulation : boolean := false;
  constant CLK_PERIOD : Delay_length := 7.5 ns;

  constant GSLAVE_DUT : gslave := 0;
  constant DUTROM : expansionrom := (
    16#00# =>     (ERT_ZORROII),
    16#01# =>     (ERT_CHAINEDCONFIG or ERT_MEMSIZE_64K),
    16#03# => not (ASPIC_PRODUCT_NUMBER),
    16#08# => not (HACKER_MANUFACTURER(15 downto 12)),
    16#09# => not (HACKER_MANUFACTURER(11 downto  8)),
    16#0a# => not (HACKER_MANUFACTURER( 7 downto  4)),
    16#0b# => not (HACKER_MANUFACTURER( 3 downto  0)),
    16#20# =>     "0000",
    16#21# =>     "0000",
    others => not "0000"
  );

  function addr(
    slot  : autoconfig_slot;
    offs  : std_logic_vector
  ) return bus_addr24 is
    variable ret : bus_addr24;
  begin
    ret := x"e80000";
    ret(slot'range) := slot;
    ret(15 downto 0) := offs(15 downto 0);
    return ret;
  end;
begin
  dut : entity work.aspic
  generic map(
    gslave  => 0
  )
  port map(
    clk   => clk,
    gbi   => gbi,
    gbo   => gbo,
    spii  => spii,
    spio  => spio
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

  -- Loop back MOSI to MISO
  spii.miso <= spio.mosi;

  process
    procedure assert_fast_ram_silent is
    begin
      -- Test borders of the three areas in 8MB space.
      gbus_silent(clk, gbi, gbo, 16#1FFFF0#, 16#200010#);
      gbus_silent(clk, gbi, gbo, 16#3FFFF0#, 16#400010#);
      gbus_silent(clk, gbi, gbo, 16#7FFFF0#, 16#800010#);
      gbus_silent(clk, gbi, gbo, 16#9FFFF0#, 16#A00010#);
    end;

    procedure assert_rom0_silent is
    begin
      -- AUTOCONFIG0 SPACE
      gbus_silent(clk, gbi, gbo, 16#E80000#, 16#E80400#);
      gbus_silent(clk, gbi, gbo, 16#E8FF00#, 16#E8FF00#);
    end;

    procedure assert_allrom_silent is
    begin
      -- AUTOCONFIG SPACE
      gbus_silent(clk, gbi, gbo, 16#E7FFF0#, 16#E80010#);
      gbus_silent(clk, gbi, gbo, 16#E8FFF0#, 16#E90010#);
      gbus_silent(clk, gbi, gbo, 16#E9FFF0#, 16#EA0010#);
      gbus_silent(clk, gbi, gbo, 16#EAFFF0#, 16#EB0010#);
      gbus_silent(clk, gbi, gbo, 16#EBFFF0#, 16#EC0010#);
      gbus_silent(clk, gbi, gbo, 16#ECFFF0#, 16#ED0010#);
      gbus_silent(clk, gbi, gbo, 16#EDFFF0#, 16#EE0010#);
      gbus_silent(clk, gbi, gbo, 16#EEFFF0#, 16#EF0010#);
      gbus_silent(clk, gbi, gbo, 16#EFFFF0#, 16#F00010#);
    end;

    procedure assert_all_silent is
    begin
      assert_fast_ram_silent;
      assert_allrom_silent;
    end;

    variable d16  : bus_data;
    variable d8   : bus_data8;
    variable s    : boolean;
    variable slot : autoconfig_slot;
  begin
    gbus_reset(clk, gbi, gbo);
    assert spio.ss = '0';
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
    assert gbo.interrupt = '0';
    gbi.config(GSLAVE_DUT) <= '1';
    assert gbo.config = '0';
    -- Locate in slot "001", corresponding with $E90000.
    slot := o"1";
    gbus_write(clk, gbi, gbo, x"E80048", x"0" & "0" & slot & x"00");
    assert gbo.config = '1';
    assert gbo.interrupt = '0';
    assert_rom0_silent;

    -- Status bits are write on clear.
    gbus_write(clk, gbi, gbo, addr(slot, STATUS_OFFSET), x"ffff");
    gbus_read(clk, gbi, gbo, addr(slot, STATUS_OFFSET), d16, s);
    assert d16 = x"0000";

    -- Only control bits ss and tcim are writable.
    gbus_write(clk, gbi, gbo, addr(slot, CTRL_OFFSET), x"ffff");
    gbus_read(clk, gbi, gbo, addr(slot, CTRL_OFFSET), d16, s);
    assert d16 = x"0003";
    assert gbo.interrupt = '0';
    assert spio.ss = '1';

    gbus_write(clk, gbi, gbo, addr(slot, CTRL_OFFSET), x"0000");
    gbus_read(clk, gbi, gbo, addr(slot, CTRL_OFFSET), d16, s);
    assert d16 = x"0000";
    assert gbo.interrupt = '0';
    assert spio.ss = '0';

    gbus_write(clk, gbi, gbo, addr(slot, CTRL_OFFSET), x"0003");
    gbus_read(clk, gbi, gbo, addr(slot, CTRL_OFFSET), d16, s);
    assert d16 = x"0003";
    assert gbo.interrupt = '0';
    assert spio.ss = '1';

    -- Not all scaler bits can be set.
    gbus_write(clk, gbi, gbo, addr(slot, SCALER_OFFSET), x"ffff");
    gbus_read(clk, gbi, gbo, addr(slot, SCALER_OFFSET), d16, s);
    assert d16 = x"0fff";

    gbus_write(clk, gbi, gbo, addr(slot, SCALER_OFFSET), x"0011");
    gbus_read(clk, gbi, gbo, addr(slot, SCALER_OFFSET), d16, s);
    assert d16 = x"0011";

    -- We have now initialized:
    -- - status.tc=0
    -- - ctrl.ss=1, ctrl.tcim=1
    -- - scaler.reload=$11

    -- Start a transfer by writing TXDATA
    gbus_write(clk, gbi, gbo, addr(slot, TXDATA_OFFSET), x"5555");
    gbus_read(clk, gbi, gbo, addr(slot, TXDATA_OFFSET), d16, s);
    assert d16 = x"0055";

    -- Expecting status.tip=1, status.tic=0
    gbus_read(clk, gbi, gbo, addr(slot, STATUS_OFFSET), d16, s);
    assert d16 = x"0001";
    assert gbo.interrupt = '0';

    -- Wait for status.tip=0
    loop
      gbus_read(clk, gbi, gbo, addr(slot, STATUS_OFFSET), d16, s);
      if d16(0) = '1' then
        assert d16 = x"0001";
        assert gbo.interrupt = '0';
      else
        assert d16 = x"0002";
        exit;
      end if;
    end loop;

    assert gbo.interrupt = '1';
    -- Mask interrupt
    gbus_write(clk, gbi, gbo, addr(slot, CTRL_OFFSET), x"0001");
    assert gbo.interrupt = '0';
    assert spio.ss = '1';
    gbus_write(clk, gbi, gbo, addr(slot, CTRL_OFFSET), x"0003");
    assert gbo.interrupt = '1';
    assert spio.ss = '1';

    -- Clear interrupt
    gbus_write(clk, gbi, gbo, addr(slot, STATUS_OFFSET), x"0002");
    assert gbo.interrupt = '0';
    gbus_read(clk, gbi, gbo, addr(slot, STATUS_OFFSET), d16, s);
    assert d16 = x"0000";

    -- Deselect slave
    gbus_write(clk, gbi, gbo, addr(slot, CTRL_OFFSET), x"0002");
    assert gbo.interrupt = '0';
    assert spio.ss = '0';

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

