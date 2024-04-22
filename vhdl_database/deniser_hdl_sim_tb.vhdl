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

library ieee;
use ieee.std_logic_1164.all;
use work.tbtest.all;
library ocs;
use ocs.ocs.all;
use ocs.text.all;

entity tb is
end;

architecture beh of tb is
  constant CCK_PERIOD : time := 280 ns;
  signal clk7       : std_ulogic := '0';
  signal cck        : std_ulogic := '0';
  signal deni       : denise_in_t;
  signal deno       : denise_out_t;

  signal drd            : std_logic_vector (15 downto  0);
begin

  rga_bfm0 : entity ocs.rga_bfm_impl
  port map (
    -- clocks are driven out on deni
    clk7      => clk7,
    cck       => cck,
    deni      => deni,
    deno      => deno
  );

  deno.drd <= drd;
  drd <= deni.drd;

  dut : entity ocs.top
  port map (
    clk7    => clk7,
    cck     => cck,
    rga     => deni.rga,
    drd     => drd,
    m0v     => deni.m0v,
    m0h     => deni.m0h,
    m1v     => deni.m1v,
    m1h     => deni.m1h,
    ncsync  => 'X',
    ncdac   => 'X'
  );

  stim_cck : process
  begin
    if end_of_simulation then
      -- may have PLL or similar running so force stop
      -- std.env.stop(0);
      wait;
    else
      cck <= '0';
      wait for CCK_PERIOD / 2;
      cck <= '1';
      wait for CCK_PERIOD / 2;
    end if;
  end process;

  stim_7m : process
  begin
    wait for 15 ns;
    loop
      if end_of_simulation then
        wait;
      else
        clk7 <= '0';
        wait for CCK_PERIOD / 4;
        clk7 <= '1';
        wait for CCK_PERIOD / 4;
      end if;
    end loop;
  end process;

  tc: component testcode;

  confinfo : process
  begin
    ocs.text.puts("sysfreq:  " & integer'image((1000.0 us) / CCK_PERIOD) & " KHz");
    ocs.text.puts("period:   " & time'image(CCK_PERIOD));
    ocs.text.puts("--- simulation begin");
    wait until end_of_simulation;
    wait for 0 ns;
    ocs.text.puts("--- simulation end");
    wait;
  end process;
end;

