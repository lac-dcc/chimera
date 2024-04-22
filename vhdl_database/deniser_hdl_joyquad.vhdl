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
use ieee.numeric_std.all;
use work.priv.all;

-- "mv" is a time multiplexed input signal which carries both phases. Current
-- phase is indicated by "cck".
entity joyquad is
  port (
    clk7    : in  std_ulogic;
    cck     : in  std_ulogic;
    mv      : in  std_ulogic;
    wen     : in  std_ulogic;
    wdata   : in  std_ulogic_vector(7 downto 2);
    rdata   : out std_ulogic_vector(7 downto 0)
  );
end;

architecture rtl of joyquad is
  type reg_t is record
    d   : unsigned(7 downto 0);
    v   : std_ulogic;
    vq  : std_ulogic;
  end record;

  signal r    : reg_t;
  signal rin  : reg_t;
begin

  process (r, cck, mv, wen, wdata)
    variable v : reg_t;
  begin
    v := r;
    -- demux the two phases
    if cck = '1' then
      v.v := mv;
    else
      v.vq := mv;
    end if;
    -- (r.vq, r.v)  cycles through states "00", "01", "11", "10", or reverse
    -- (r.d1, r.d0) cycles through states "10", "11", "00", "01", or reverse
    v.d(0) := r.v xor r.vq;
    v.d(1) := not r.vq;
    if isx(std_ulogic_vector(r.d)) or isx(std_ulogic_vector(v.d)) then
      null;
    else
      -- Detect increment and decrement conditions.
      if r.d(1 downto 0) = "11" and v.d(1 downto 0) = "00" then
        v.d(7 downto 2) := r.d(7 downto 2) + 1;
      end if;
      if r.d(1 downto 0) = "00" and v.d(1 downto 0) = "11" then
        v.d(7 downto 2) := r.d(7 downto 2) - 1;
      end if;
    end if;

    if wen = '1' then
      -- Parallel load has been requested by user.
      v.d(wdata'range) := unsigned(wdata);
    end if;
    rdata <= std_ulogic_vector(r.d);

    rin <= v;
  end process;

  r <= rin when rising_edge(clk7);
end;

