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

entity arbit_forward is
  generic (
    N : positive                            -- Length of Token Chain
  );
  port (
    tin  : in  std_logic;                   -- Fed Token
    have : in  std_logic_vector(0 to N-1);  -- Token Owner
    pass : in  std_logic_vector(0 to N-1);  -- Token Passers
    grnt : out std_logic_vector(0 to N-1);  -- Token Output
    tout : out std_logic                    -- Unused Token
  );
end arbit_forward;


library IEEE;
use IEEE.numeric_std.all;

architecture rtl of arbit_forward is

  -- Pseudo Addends and Sum
  signal a, b : unsigned(N-1 downto 0);
  signal s    : unsigned(N   downto 0);

begin

  genAddends: for i in 0 to N-1 generate
    a(i) <= have(i) xor pass(i);
    b(i) <= have(i);
  end generate genAddends;
  s <= ('0' & a) + b + (0 to 0 => tin);
  genGrant: for i in 0 to N-1 generate
    grnt(i) <= s(i) and not pass(i);
  end generate genGrant;
  tout <= s(N);

end rtl;
