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

entity syncer is
  generic (
    width   : positive := 2
  );
  port (
    clk     : in  std_ulogic;
    d       : in  std_ulogic;
    q       : out std_ulogic
  );
end;

architecture rtl of syncer is
  signal rlev0_async, rlev1_async : std_ulogic;
  signal r : std_ulogic_vector(width-1 downto 0);

begin
  r0 : process(clk)
  begin
    if rising_edge(clk) then
      rlev0_async <= d;
      rlev1_async <= rlev0_async;
    end if;
  end process;

  many : if 2 < width generate
    r1 : process(clk)
    begin
      if rising_edge(clk) then
        r <= r(r'high-1 downto 0) & rlev1_async;
      end if;
    end process;
  end generate;

  q <= rlev1_async when width <= 2 else r(r'high);
end;

