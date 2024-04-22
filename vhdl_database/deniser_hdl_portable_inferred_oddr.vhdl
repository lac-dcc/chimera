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

entity oddr is
  port (
    clk : in  std_ulogic;
    d0  : in  std_ulogic;
    d1  : in  std_ulogic;
    q   : out std_ulogic
  );
end;

-- FPGA-TN-02065-1-0, Figure 2.1
architecture rtl of oddr is
  signal q0   : std_ulogic;
  signal q1   : std_ulogic;
  signal d1s  : std_ulogic;
begin
  q0  <= d0   when rising_edge(clk);
  d1s <= d1   when rising_edge(clk);
  q1  <= d1s  when falling_edge(clk);

  q <= q0 when clk = '0' else q1;
end;

