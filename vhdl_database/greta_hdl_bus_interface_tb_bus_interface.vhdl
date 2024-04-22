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
use ieee.numeric_std.all;
use work.greta_pkg.all;
use work.bus_bfm_pkg.all;

entity tb_bus_interface is
end;

architecture testbench of tb_bus_interface is
  --- GRETA
  signal clk            : std_logic := '1';
  signal cpu_reset      : std_logic;
  signal req            : std_logic;
  signal nwe            : bus_nwe;
  signal addr           : bus_addr;
  signal wdata          : bus_data;
  signal rdata          : bus_data := (others => 'U');
  signal dev_select     : std_logic := '1';
  --- ROCK LOBSTER
  signal nRST           : std_logic;
  signal nAS            : std_logic;
  signal nUDS           : std_logic;
  signal nLDS           : std_logic;
  signal RnW            : std_logic;
  signal CDAC           : std_logic;
  signal nOVR           : std_logic;
  signal nINT2          : std_logic;
  signal nINT6          : std_logic;
  signal nINT7          : std_logic;
  signal nDTACK         : std_logic;
  signal A              : bus_addr;
  signal D              : bus_data;
  signal D_nOE          : std_logic;
  signal D_TO_GRETA     : std_logic;

  constant CLK_PERIOD   : Delay_length := 7.5 ns;
begin

  bus0 : entity work.bus_bfm port map(
    nRST => nRST,
    nAS => nAS,
    nUDS => nUDS,
    nLDS => nLDS,
    RnW => RnW,
    CDAC => CDAC,
    nDTACK => nDTACK,
    nOVR => nOVR,
    nINT2 => nINT2,
    nINT6 => nINT6,
    nINT7 => nINT7,
    A => A,
    D => D
  );

  dut : entity work.bus_interface port map(
    --- GRETA
    clk             => clk,
    cpu_reset       => cpu_reset,
    dcm_locked      => '1',
    req             => req,
    nwe             => nwe,
    addr            => addr,
    wdata           => wdata,
    rdata           => rdata,
    dev_select      => dev_select,
    --- ROCK LOBSTER
    nRST            => nRST,
    nAS             => nAS,
    nUDS            => nUDS,
    nLDS            => nLDS,
    RnW             => RnW,
    CDAC            => CDAC,
    nOVR            => nOVR,
    nINT2           => nINT2,
    nINT6           => nINT6,
    nINT7           => nINT7,
    nDTACK          => nDTACK,
    A               => A,
    D               => D,
    D_nOE           => D_nOE,
    D_TO_GRETA      => D_TO_GRETA
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

  process
    procedure assert_write(
      constant a      : in    bus_addr24;
      constant d      : in    std_logic_vector;
      signal cmd      : inout bus_cmd_t
    ) is
    begin
      bus_write(a, d, cmd);
      wait until req = '1';
      assert addr = a(addr'range);

      if d'length = 8 and a(0) = '0' then
        assert wdata(15 downto 8) = d;
        assert nwe = "01";
      elsif d'length = 8 and a(0) = '1' then
        assert wdata(7 downto 0) = d;
        assert nwe = "10";
      else
        assert wdata = d;
        assert nwe = "00";
      end if;
    end;

    procedure assert_read(
      constant a      : in    bus_addr24;
      constant dtest  : in    std_logic_vector;
      signal cmd      : inout bus_cmd_t
    ) is
    variable rd       : bus_data;
    begin
      if dtest'length = 8 and a(0) = '0' then
        rdata <= dtest & "UUUUUUUU";
      elsif dtest'length = 8 and a(0) = '1' then
        rdata <= "UUUUUUUU" & dtest;
      elsif dtest'length = 16 and a(0) = '0' then
        rdata <= dtest;
      else
        report "assert_read: invalid addressing"
          severity failure;
      end if;
      bus_read_begin(a, rd(dtest'range), cmd);
      wait until req = '1';
      assert addr = a(addr'range);
      assert nwe = READ_WORD;

      bus_read_end(a, rd(dtest'range), cmd);

      if dtest'length = 8 and a(0) = '0' then
        assert rd(dtest'range) = dtest;
      elsif dtest'length = 8 and a(0) = '1' then
        assert rd(dtest'range) = dtest;
      else
        assert rd = dtest;
      end if;
      rdata <= "UUUUUUUUUUUUUUUU";
    end;

    variable val8   : integer range 0 to 2**8 - 1;
    variable val16  : integer range 0 to 2**16 - 1;
  begin
    bus_reset(bus_cmd);
    for i in 16#e80000# to 16#e8087f# loop
      val8  := i mod 2**8;
      val16 := i mod 2**16;
      assert_write(std_logic_vector(to_unsigned(i, 24)), x"bb",
       bus_cmd);
      assert_read(std_logic_vector(to_unsigned(i, 24)),
       std_logic_vector(to_unsigned(val8, 8)), bus_cmd);
      if i mod 2 = 0 then
        assert_write(std_logic_vector(to_unsigned(i, 24)),
         x"cafe", bus_cmd);
        assert_read(std_logic_vector(to_unsigned(i, 24)),
         std_logic_vector(to_unsigned(val16, 16)), bus_cmd);
      end if;
    end loop;
    bus_end(bus_cmd);
    wait for 1500 ns;
    end_of_simulation <= true;
    wait;
  end process;
end;

