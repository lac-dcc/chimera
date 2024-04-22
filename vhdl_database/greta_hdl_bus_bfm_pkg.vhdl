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

-- Simulate the Amiga side
library ieee;
use ieee.std_logic_1164.all;
use work.greta_pkg.all;

package bus_bfm_pkg is
  type bus_op         is (XXX, RESET, READ, READ_U, READ_L,
   WRITE, WRITE_U, WRITE_L, RMW);

  type bus_cmd_t is record
    op : bus_op;
      addr : bus_addr;
      wdata : bus_data;
      rdata : bus_data;
      nUDS : std_logic;
      nLDS : std_logic;
      req : std_logic;
      ack : std_logic;
  end record;

  signal bus_cmd : bus_cmd_t := (
    op      => XXX,
    addr    => (others => 'U'),
    wdata   => (others => 'U'),
    rdata   => (others => 'Z'),
    nUDS    => 'U',
    nLDS    => 'U',
    req     => '0',
    ack     => 'Z'
  );

  signal end_of_simulation : boolean := false;

  -- Write 8 bit or 16 bit.
  procedure bus_write(
    constant addr   : in    bus_addr24;
    constant data   : in    std_logic_vector;
    signal cmd      : inout bus_cmd_t
  );

  -- Read 8 bit or 16 bit.
  procedure bus_read(
    constant addr   : in    bus_addr24;
    variable data   : out   std_logic_vector;
    signal cmd      : inout bus_cmd_t
  );

  procedure bus_read_begin(
    constant addr   : in    bus_addr24;
    variable data   : out   std_logic_vector;
    signal cmd      : inout bus_cmd_t
  );

  procedure bus_read_end(
    constant addr   : in    bus_addr24;
    variable data   : out   std_logic_vector;
    signal cmd      : inout bus_cmd_t
  );

  procedure bus_reset(
    signal cmd      : inout bus_cmd_t
  );

  procedure bus_end(
    signal cmd      : inout bus_cmd_t
  );

end;

package body bus_bfm_pkg is

  procedure bus_begin(
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    cmd.req <= '1';
    wait for 0 ns;
    if bus_cmd.ack /= '1' then
      wait until bus_cmd.ack = '1';
    end if;
  end;

  procedure bus_end(
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    cmd.req <= '0';
    wait for 0 ns;
    if bus_cmd.ack /= '0' then
      wait until bus_cmd.ack = '0';
    end if;
  end;

  procedure bus_do(
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    bus_begin(cmd);
    bus_end(cmd);
  end;

  procedure bus_write(
    constant addr   : in    bus_addr24;
    constant data   : in    std_logic_vector;
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    bus_end(cmd);
    cmd.op <= WRITE;
    cmd.addr <= addr(23 downto 1);
    if data'length = 8 and addr(0) = '0' then
      cmd.wdata <= data & "UUUUUUUU";
      cmd.nUDS <= '0';
      cmd.nLDS <= '1';
    elsif data'length = 8 and addr(0) = '1' then
      cmd.wdata <= "UUUUUUUU" & data;
      cmd.nUDS <= '1';
      cmd.nLDS <= '0';
    elsif data'length = 16 then
      assert addr(0) = '0'
        report "bus_write: Illegal address alignment for word " &
         "write."
        severity failure;
      cmd.wdata <= data;
      cmd.nUDS <= '0';
      cmd.nLDS <= '0';
    else
      report "bus_write: Illegal data width. Only byte and " &
       "word access supported."
        severity failure;
    end if;
    bus_begin(cmd);
  end;

  procedure bus_read(
    constant addr   : in bus_addr24;
    variable data   : out std_logic_vector;
    signal cmd      : inout bus_cmd_t
  ) is
  begin
      bus_read_begin(addr, data, cmd);
      bus_read_end(addr, data, cmd);
  end;

  procedure bus_read_begin(
    constant addr   : in bus_addr24;
    variable data   : out std_logic_vector;
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    bus_end(cmd);
    cmd.op <= READ;
    cmd.addr <= addr(23 downto 1);
    if data'length = 8 and addr(0) = '0' then
      cmd.nUDS <= '0';
      cmd.nLDS <= '1';
    elsif data'length = 8 and addr(0) = '1' then
      cmd.nUDS <= '1';
      cmd.nLDS <= '0';
    elsif data'length = 16 then
      assert addr(0) = '0'
        report "bus_read: Illegal address alignment for word " &
         "read."
        severity failure;
      cmd.nUDS <= '0';
      cmd.nLDS <= '0';
    else
      report "bus_read: Illegal data width. Only byte and " &
       " word supported."
        severity failure;
    end if;

    bus_begin(cmd);
  end;

  procedure bus_read_end(
    constant addr   : in bus_addr24;
    variable data   : out std_logic_vector;
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    bus_end(cmd);

    if data'length = 8 and addr(0) = '0' then
      data := cmd.rdata(15 downto 8);
    elsif data'length = 8 and addr(0) = '1' then
      data := cmd.rdata(7 downto 0);
    elsif data'length = 16 then
      data := cmd.rdata;
    end if;
  end;

  procedure bus_reset(
    signal cmd      : inout bus_cmd_t
  ) is
  begin
    cmd.op <= RESET;
    bus_do(cmd);
  end;
end;

