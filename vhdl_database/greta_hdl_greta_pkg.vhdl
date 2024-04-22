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

package greta_pkg is
  subtype bus_addr        is std_logic_vector(23 downto  1);
  subtype bus_addr24      is std_logic_vector(23 downto  0);
  subtype autoconfig_slot is std_logic_vector(18 downto 16);
  subtype bus_data        is std_logic_vector(15 downto  0);
  subtype bus_data8       is std_logic_vector( 7 downto  0);
  subtype nibble          is std_logic_vector( 3 downto  0);

  -- Auto-config space. Boards appear here before the system
  -- relocates them to their final address.
  constant AUTOCONFIG_BASE  : bus_addr := x"E8_000" & o"0";
  constant AUTOCONFIG_MASK  : bus_addr := x"F8_000" & o"0";
  constant AUTOCONFIG_SLOT0 : autoconfig_slot := o"0";

  -- Because the Fast RAM area overlaps bit 23, we split it
  -- into three separate areas.
  constant FAST_RAM_BASE2 : bus_addr := x"20_000" & o"0";
  constant FAST_RAM_BASE4 : bus_addr := x"40_000" & o"0";
  constant FAST_RAM_BASE8 : bus_addr := x"80_000" & o"0";
  constant FAST_RAM_MASK2 : bus_addr := x"E0_000" & o"0";
  constant FAST_RAM_MASK4 : bus_addr := x"C0_000" & o"0";
  constant FAST_RAM_MASK8 : bus_addr := x"E0_000" & o"0";

  constant UPPER  : natural := 1;
  constant LOWER  : natural := 0;

  subtype bus_nwe is std_logic_vector(UPPER downto LOWER);

  constant WRITE_UPPER  : bus_nwe := (UPPER => '0', LOWER => '1');
  constant WRITE_LOWER  : bus_nwe := (UPPER => '1', LOWER => '0');
  constant WRITE_WORD   : bus_nwe := (UPPER => '0', LOWER => '0');
  constant READ_WORD    : bus_nwe := (UPPER => '1', LOWER => '1');

  -- Maximum number of GRETA bus slaves supported
  constant NGSLAVES     : natural := 7;
  subtype gslave        is natural range 0 to NGSLAVES-1;
  subtype config_vector is std_logic_vector(NGSLAVES-1 downto 0);

  -- GRETA bus protocol
  type gbus_in is record
    reset       : std_logic;
    req         : std_logic;
    nwe         : bus_nwe;
    addr        : bus_addr;
    wdata       : bus_data;
    -- Active high AUTOCONFIG CONFIG_IN
    config      : config_vector;
  end record;
  constant gbus_in_none : gbus_in := (
    reset       => '1',
    req         => '0',
    nwe         => (others => 'U'),
    addr        => (others => 'U'),
    wdata       => (others => 'U'),
    config      => (others => '0')
  );

  type gbus_out is record
    dev_select  : std_logic;
    rdata       : bus_data;
    interrupt   : std_logic;
    config      : std_logic;
  end record;

  -- SDRAM controller protocol
  type ram_bus is
  record
    req    : std_logic;
    nwe    : bus_nwe;
    addr   : bus_addr;
    wdata  : bus_data;
  end record;

  -- SPI
  type spi_in is
  record
    miso   : std_logic;
  end record;

  type spi_out is
  record
    clk    : std_logic;
    -- active high
    mosi   : std_logic;
    ss     : std_logic;
  end record;

  -- Note that use of the ec_BaseAddress register is
  -- tricky.  The system will actually write twice. First
  -- the low order nybble is written to the ec_BaseAddress
  -- register+2 (D15-D12). Then the entire byte is written
  -- to ec_BaseAddress (D15-D8). This allows writing of a
  -- byte-wide address to nybble size registers.
  constant ec_BaseAddress : natural := 16#48#;
  constant ec_ShutUp      : natural := 16#4C#;

  constant FAST_PRODUCT_NUMBER  : std_logic_vector := x"1";
  constant DISK_PRODUCT_NUMBER  : std_logic_vector := x"2";
  constant ASPIC_PRODUCT_NUMBER : std_logic_vector := x"3";
  constant ERT_ZORROII          : nibble := "1100";
  constant ERT_MEMLIST          : nibble := "0010";
  constant ERT_DIAGVALID        : nibble := "0001";

  constant ERT_CHAINEDCONFIG    : nibble := "1000";
  constant ERT_MEMSIZE_8MB      : nibble := "0000";
  constant ERT_MEMSIZE_64K      : nibble := "0001";

  constant ERF_MEMSPACE         : nibble := "1000";
  constant ERF_NOSHUTUP         : nibble := "0100";

  -- A special "hacker" Manufacturer ID number is reserved
  -- for test use: 2011 ($7DB).  When inverted this will look
  -- like $F824.
  constant HACKER_MANUFACTURER  :
   std_logic_vector(15 downto 0) := x"07DB";

  type expansionrom is array (0 to 63) of nibble;

  function is_autoconfig_reg(n : natural; a : bus_addr)
    return boolean;

  function is_autoconfig(a : bus_addr)
    return boolean;

  function get_autoconfig_slot(a : bus_addr)
    return autoconfig_slot;

  function is_fast_ram(a : bus_addr)
    return boolean;

end;

package body greta_pkg is

  function is_autoconfig_reg(n : natural; a : bus_addr)
    return boolean is
    variable reg_addr : std_logic_vector(6 downto 0);
  begin
    reg_addr := std_logic_vector(to_unsigned(n, reg_addr'length));
    return reg_addr(6 downto 1) = a(6 downto 1);
  end;

  function is_autoconfig(a : bus_addr)
    return boolean is
  begin
    return (a and AUTOCONFIG_MASK) = AUTOCONFIG_BASE;
  end;

  function get_autoconfig_slot(a : bus_addr)
    return autoconfig_slot is
  begin
    return a(autoconfig_slot'range);
  end;

  function is_fast_ram(a : bus_addr)
    return boolean is
  begin
    return (
      ((a and FAST_RAM_MASK2) = FAST_RAM_BASE2) or
      ((a and FAST_RAM_MASK4) = FAST_RAM_BASE4) or
      ((a and FAST_RAM_MASK8) = FAST_RAM_BASE8)
    );
  end;

end;

