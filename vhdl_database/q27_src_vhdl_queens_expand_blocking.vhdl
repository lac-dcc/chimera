-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-------------------------------------------------------------------------------
-- This file is part of the Queens@TUD solver suite
-- for enumerating and counting the solutions of an N-Queens Puzzle.
--
-- Copyright (C) 2008-2015
--      Thomas B. Preusser <thomas.preusser@utexas.edu>
-------------------------------------------------------------------------------
-- This design is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with this design.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.utils.all;

entity expand_blocking is
  generic(
    N : positive;
    L : positive
  );
  port(
    pre : in std_logic_vector(4*L*log2ceil(N)-2 downto 0);

    bh  : out std_logic_vector(L to N-L-1);
    bv  : out std_logic_vector(L to N-L-1);
    bu  : out std_logic_vector(0 to 2*N-4*L-2);
    bd  : out std_logic_vector(0 to 2*N-4*L-2)
  );
end entity;


library IEEE;
use IEEE.numeric_std.all;

architecture rtl of expand_blocking is

  constant M : positive := log2ceil(N);

  -- Decoded Placement
  -- Frame Indices: 0 - west, 1 - north, 2 - east, 3 - south
  subtype tRow   is std_logic_vector(0 to N-1);
  type    tEdge  is array(0 to L-1) of tRow;
  type    tFrame is array(0 to   3) of tEdge;

  -- Normalized Pre-Placement with full first Coordinate West(0)
  signal pp : std_logic_vector(0 to 4*L*log2ceil(N)-1);

  signal frame : tFrame;

begin

  -- Normalize the Pre-Placement
  pp <= '0' & pre;

  -- Placement Decoder
  genFrame: for i in tFrame'range generate
    genEdge: for j in tEdge'range generate
      genAlias: for k in 0 to L-1 generate
        frame(i)(j)(k) <= frame((i+3) mod 4)(k)(N-1-j);
      end generate genAlias;
      genCells: for k in L to N-1 generate
        constant BASE : natural := (i*L+j)*M;
      begin
        frame(i)(j)(k) <= 'X' when Is_X(pp(BASE to BASE+M-1)) else
                          '1' when to_integer(unsigned(pp(BASE to BASE+M-1))) = k else
                          '0';
      end generate genCells;
    end generate genEdge;
  end generate genFrame;

  -- compute combined blocking
  process(frame)
    variable h, v, u, d : std_logic;
  begin
    -- Horizontal and Vertical
    for i in L to N-L-1 loop
      h := '0';
      v := '0';
      for j in 0 to L-1 loop
        h := h or frame(0)(j)(i) or frame(2)(j)(N-1-i);
        v := v or frame(1)(j)(i) or frame(3)(j)(N-1-i);
      end loop;
      bh(i) <= h;
      bv(i) <= v;
    end loop;

    -- Up and Down: 0 .. N-2L-1
    for i in 0 to N-2*L-1 loop
      u := '0';
      d := '0';
      for j in 0 to L-1 loop
        u := u or frame(2)(j)(N-1-2*L-i+j) or frame(3)(j)(2*L+i-j);
        d := d or frame(0)(j)(2*L+i-j) or frame(3)(j)(N-1-2*L-i+j);
      end loop;
      bu(i) <= u;
      bd(i) <= d;
    end loop;

    -- Up and Down: 0 .. N-2L-1
    for i in N-2*L to 2*N-4*L-2 loop
      u := '0';
      d := '0';
      for j in 0 to L-1 loop
        u := u or frame(0)(j)((i-(N-1-2*L))+j) or frame(1)(j)(2*N-2*L-2-i-j);
        d := d or frame(1)(j)((i-(N-1-2*L))+j) or frame(2)(j)(2*N-2*L-2-i-j);
      end loop;
      bu(i) <= u;
      bd(i) <= d;
    end loop;

  end process;

end rtl;
