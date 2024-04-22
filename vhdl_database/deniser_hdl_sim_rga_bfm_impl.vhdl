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
use work.rga_bfm.all;
use work.ocs.all;
use work.text.all;

entity rga_bfm_impl is
  port (
    clk7  : in    std_ulogic;
    cck   : in    std_ulogic;
    deni  : out   denise_in_t;
    deno  : in    denise_out_t
  );
end;

architecture beh of rga_bfm_impl is
begin
  process
  begin
    info(rgacmd, "power-on");
    deni.drd <= (others => 'Z');
    deni.rga <= (others => '1');
    wait until rising_edge(cck);
    wait until rising_edge(cck);

    for i in 2 to 9 loop
      wait until rising_edge(cck);
    end loop;

    info(rgacmd, "power-up reset done");

    -- Main loop Ready to take BFM commands
    loop
      if rgacmd.req /= '1' then
        wait until rgacmd.req = '1';
      end if;
      rgacmd.ack <= '1';
      wait for 0 ns;

      case rgacmd.op is
      when WRITE|READ =>
          wait until rising_edge(cck);
          wait for 110 ns - 70 ns;
          deni.rga <= rgacmd.addr(8 downto 1);
          wait until falling_edge(cck);
          wait for 10 ns;
          deni.rga <= (others => '1');

          wait for 40 ns;
          if rgacmd.op = WRITE then
            deni.drd <= rgacmd.wdata;
          end if;
          wait until rising_edge(cck);
          if rgacmd.op = WRITE then
            deni.drd <= (others => 'Z') after 20 ns;
          else
            rgacmd.rdata <= deno.drd;
          end if;

      when others =>
        fail(rgacmd, "Unimplemented operation: " & rga_op'image(rgacmd.op));

      end case;
      rgacmd.ack <= '0';
      wait for 0 ns;
      while rgacmd.req = '1' loop
      end loop;
    end loop;
  end process;

  deni.clk7   <= clk7;
  deni.cck    <= cck;
  deni.m0v    <= '0';
  deni.m0h    <= '0';
  deni.m1v    <= '0';
  deni.m1h    <= '0';
  deni.ncsync <= 'X';
  deni.ncdac  <= 'X';
end;

