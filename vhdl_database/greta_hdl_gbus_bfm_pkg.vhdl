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

-- Bus functional model for GRETA bus protocol
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.greta_pkg.all;

package gbus_bfm_pkg is
  procedure gbus_reset(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out
  );

  procedure gbus_write(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  a     : in    bus_addr24;
    constant  d     : in    std_logic_vector
  );

  procedure gbus_read(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  a     : in    bus_addr24;
    variable  rd    : out   std_logic_vector;
    variable  sel   : out   boolean
  );

  -- Asserts that reads from the the memory area from a to b are silent. That
  -- is they hold both dev_select and rdata to zero.
  procedure gbus_silent(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  a     : in    integer;
    constant  b     : in    integer
  );

  procedure verify_rom(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  rom  : expansionrom
  );
end;

package body gbus_bfm_pkg is
  -- Wait for a specified number rising edges.
  procedure wredge(
    signal    clk   : in    std_logic;
    constant  n     : in    natural
  ) is
  begin
    for i in 1 to n loop
      wait until rising_edge(clk);
    end loop;
  end;

  procedure gbus_reset(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out
  ) is
  begin
    gbi <= gbus_in_none;
    wredge(clk, 7);
    gbi.reset <= '0';
  end;

  procedure gbus_write(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  a     : in    bus_addr24;
    constant  d     : in    std_logic_vector
  ) is
  begin
    wait until rising_edge(clk);
    gbi.addr <= a(gbi.addr'range);
    wredge(clk, 7);

    if d'length = 8 and a(0) = '0' then
      gbi.wdata <= d & "UUUUUUUU";
      gbi.nwe <= WRITE_UPPER;
    elsif d'length = 8 and a(0) = '1' then
      gbi.wdata <= "UUUUUUUU" & d;
      gbi.nwe <= WRITE_LOWER;
    elsif d'length = 16 then
      assert a(0) = '0'
        report "dev_write: Illegal address alignment for word write."
        severity failure;
      gbi.wdata <= d;
      gbi.nwe <= WRITE_WORD;
    else
      report "dev_write: Illegal data width. Only byte and word supported."
        severity failure;
    end if;

    wredge(clk, 3);
    gbi.req <= '1';
    wait until rising_edge(clk);
    gbi.req <= '0';
    wredge(clk, 2);
  end;

  procedure gbus_read(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  a     : in    bus_addr24;
    variable  rd    : out   std_logic_vector;
    variable  sel   : out   boolean
  ) is
  begin
    wait until rising_edge(clk);
    gbi.addr <= a(gbi.addr'range);
    wredge(clk, 3);
    if rd'length = 8 then
      gbi.nwe <= READ_WORD;
    elsif rd'length = 16 then
      assert a(0) = '0'
        report "dev_read: Illegal address alignment for word read."
        severity failure;
      gbi.nwe <= READ_WORD;
    else
      report "dev_read: Illegal data width. Only byte and word supported."
        severity failure;
    end if;
    wait until rising_edge(clk);
    gbi.req <= '1';
    wait until rising_edge(clk);
    gbi.req <= '0';
    wredge(clk, 7);
    if gbo.dev_select = '1' then
      sel := true;
    else
      sel := false;
    end if;
    wait until rising_edge(clk);

    if rd'length = 8 and a(0) = '0' then
      rd := gbo.rdata(15 downto 8);
    elsif rd'length = 8 and a(0) = '1' then
      rd := gbo.rdata(7 downto 0);
    else
      rd := gbo.rdata;
    end if;
    wait until rising_edge(clk);
  end;

  procedure gbus_silent(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  a     : in    integer;
    constant  b     : in    integer
  ) is
    variable  d     : bus_data;
    variable  s     : boolean;
  begin
    for i in a to b loop
      if i mod 2 = 0 then
        gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(i, 24)), d, s);
        assert s = false;
        assert d = x"0000";
      end if;
    end loop;
  end;

  procedure verify_rom(
    signal    clk   : in    std_logic;
    signal    gbi   : out   gbus_in;
    signal    gbo   : in    gbus_out;
    constant  rom  : expansionrom
  ) is
    variable d16  : bus_data;
    variable s    : boolean;
    variable addr : natural;
  begin
    -- Compare with ROM definition
    for i in rom'range loop
      addr := 16#E80000# + i*2;
      gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(addr, 24)), d16, s);
      assert d16(15 downto 12) = rom(i);
      assert s = true;
    end loop;

    -- Reserved, must be 0
    for i in 16#E8000A# to 16#E8000E# loop
      if i mod 2 = 0 then
        gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(i, 24)), d16, s);
        assert d16(15 downto 12) = not "0000";
        assert s = true;
      end if;
    end loop;

    -- Reserved, must be 0
    for i in 16#E80030# to 16#E8003E# loop
      if i mod 2 = 0 then
        gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(i, 24)), d16, s);
        assert d16(15 downto 12) = not "0000";
        assert s = true;
      end if;
    end loop;

    -- Optional control status register
    gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(16#E80040#, 24)), d16, s);
    assert d16(15 downto 12) = "0000";
    assert s = true;

    gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(16#E80042#, 24)), d16, s);
    assert d16(15 downto 12) = "0000";
    assert s = true;

    -- Reserved, must be 0
    for i in 16#E80044# to 16#E8007E# loop
      if i mod 2 = 0 then
        gbus_read(clk, gbi, gbo, std_logic_vector(to_unsigned(i, 24)), d16, s);
        assert d16(15 downto 12) = not "0000";
        assert s = true;
      end if;
    end loop;
  end;

end;

