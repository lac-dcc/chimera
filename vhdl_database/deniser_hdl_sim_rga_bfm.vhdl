--  Copyright (C) 2020-2021 Martin Åberg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License along
--  with this program; if not, write to the Free Software Foundation, Inc.,
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--

-- Bus Functional Model for RGA bus

library ieee;
use ieee.std_logic_1164.all;
use work.ocs.all;
use work.text.all;

package rga_bfm is
  type rga_op is (
    IDLE,
    READ,
    WRITE
  );

  type rga_log is (LOG_FAIL, LOG_ERROR, LOG_INFO, LOG_DEBUG);
  type rga_cmd is record
    op    : rga_op;
    addr  : std_logic_vector(11 downto 0);
    wdata : std_logic_vector(15 downto 0);
    rdata : std_logic_vector(15 downto 0);
    req   : std_logic;
    ack   : std_logic;
    log   : rga_log;
  end record;

  signal rgacmd : rga_cmd := (
    op    => IDLE,
    addr  => (others => 'X'),
    wdata => (others => 'X'),
    rdata => (others => 'Z'),
    req   => '0',
    ack   => 'Z',
    log   => LOG_INFO
  );

  procedure rga_loglevel (
    signal cmd      : inout rga_cmd;
    constant level  : rga_log
  );

  procedure dbg (constant cmd : rga_cmd; str : string);
  procedure info(constant cmd : rga_cmd; str : string);
  procedure fail(constant cmd : rga_cmd; str : string);

  procedure rga_write (
    signal cmd      : inout rga_cmd;
    constant addr   : in    addr_t;
    constant data   : in    word_t
  );

  procedure rga_read (
    signal cmd      : inout rga_cmd;
    constant addr   : in    addr_t;
    variable data   : out   word_t
  );

end;

package body rga_bfm is

  procedure dbg(constant cmd : rga_cmd; str : string) is
  begin
    if cmd.log < LOG_DEBUG then return; end if;
    puts("DEBUG RGA: " & str);
  end;

  procedure info(constant cmd : rga_cmd; str : string) is
  begin
    if cmd.log < LOG_INFO then return; end if;
    puts("INFO  RGA: " & str);
  end;

  procedure fail(constant cmd : rga_cmd; str : string) is
  begin
    report "FAIL  RGA: " & str severity failure;
  end;

  procedure rga_loglevel (
    signal cmd      : inout rga_cmd;
    constant level  : rga_log
  ) is
  begin
    cmd.log <= level;
  end;

  procedure rga_begin (
    signal cmd      : inout rga_cmd
  ) is
  begin
    cmd.req <= '1';
    wait for 0 ns;
    if cmd.ack /= '1' then
      wait until cmd.ack = '1';
    end if;
  end;

  procedure rga_end (
    signal cmd      : inout rga_cmd
  ) is
  begin
    cmd.req <= '0';
    wait for 0 ns;
    if cmd.ack /= '0' then
      wait until cmd.ack = '0';
    end if;
  end;

  procedure rga_write (
    signal cmd      : inout rga_cmd;
    constant addr   : in    addr_t;
    constant data   : in    word_t
  ) is
  begin
    cmd.addr <= addr;
    cmd.wdata <= data;
    cmd.op <= WRITE;

    rga_begin(cmd);
    rga_end(cmd);
    dbg(cmd, "write $" & to_hstring(addr) & " <- $" & to_hstring(data));
  end;

  procedure rga_read (
    signal cmd      : inout rga_cmd;
    constant addr   : in    addr_t;
    variable data   : out   word_t
  ) is
  begin
    cmd.addr <= addr;
    cmd.op <= READ;

    rga_begin(cmd);
    rga_end(cmd);
    data := cmd.rdata;

    dbg(cmd, "read  $" & to_hstring(addr) & " -> $" & to_hstring(data));
  end;

end;

