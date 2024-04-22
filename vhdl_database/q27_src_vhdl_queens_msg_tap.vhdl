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

entity msg_tap is
  generic (
    D : positive                        -- Message Buffer Depth (Size)
  );
  port (
    -- Global Control
    clk : in  std_logic;
    rst : in  std_logic;

    -- Tap Input
    iful : out std_logic;
    idat : in  byte;
    ieof : in  std_logic;
    iput : in  std_logic;

    -- Tap Forward
    oful : in  std_logic;
    odat : out byte;
    oeof : out std_logic;
    oput : out std_logic;

    -- Tap
    tful : in  std_logic;
    tdat : out std_logic_vector(0 to 8*D-1);
    tput : out std_logic
  );
end msg_tap;


library IEEE;
use IEEE.numeric_std.all;

architecture rtl of msg_tap is

  type tState is (Receive, Hold, Transmit);
  signal State : tState := Receive;

  signal Buf : byte_vector(0 to D-1) := (others => (others => '-'));
  signal Cnt : signed(log2ceil(imax(D-1, 1)) downto 0) := (others => '-');

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        State <= Receive;
        Buf   <= (others => (others => '-'));
        Cnt   <= (others => '-');
      else
        case State is

          when Receive =>
            Cnt <= (others => '-');
            if iput = '1' then
              Buf <= Buf(1 to D-1) & idat;
              if ieof = '1' then
                State <= Hold;
              end if;
            end if;

          when Hold =>
            Cnt <= (others => '-');
            if tful = '0' then
              State <= Receive;
            elsif oful = '0' then
              Cnt   <= to_signed(D-2, Cnt'length);
              State <= Transmit;
            end if;

          when Transmit =>
            if oful = '0' then
              Buf <= Buf(1 to D-1) & byte'(7 downto 0 => '-');
              Cnt <= Cnt - 1;
              if Cnt(Cnt'left) = '1' then
                State <= Receive;
              end if;
            end if;

        end case;
      end if;
    end if;
  end process;
  iful <= '0' when State = Receive else '1';

  genParOut: for i in Buf'range generate
    tdat(8*i to 8*i+7) <= Buf(i);
  end generate genParOut;
  tput <= not tful when State = Hold else '0';

  odat <= Buf(0);
  oeof <= Cnt(Cnt'left);
  oput <= '0' when State /= Transmit else
          '0' when oful = '1' else
          '1';

end rtl;
