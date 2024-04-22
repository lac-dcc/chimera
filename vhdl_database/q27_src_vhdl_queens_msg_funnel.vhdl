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

entity msg_funnel is
  generic (
    N : positive                        -- Number of Funnel Inputs
  );
  port (
    -- Global Control
    clk : in  std_logic;
    rst : in  std_logic;

    -- Funnel Inputs
    ivld : in  std_logic_vector(0 to N-1);
    idat : in  byte_vector(0 to N-1);
    ieof : in  std_logic_vector(0 to N-1);
    igot : out std_logic_vector(0 to N-1);

    -- Funnel Output
    oful : in  std_logic;
    odat : out byte;
    oeof : out std_logic;
    oput : out std_logic
  );
end msg_funnel;


library IEEE;
use IEEE.numeric_std.all;

architecture rtl of msg_funnel is

  component arbit_forward
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
  end component;

  signal Active : std_logic                        := '0';
  signal SelBin : unsigned(log2ceil(N)-1 downto 0) := (others => '-');

  signal grnt : std_logic_vector(0 to N-1);
  signal tout : std_logic;

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        Active <= '0';
        SelBin <= (others => '-');
      else
        if oful = '0' then
          if Active = '0' then
            if tout = '0' then
              for i in 0 to N-1 loop
                if grnt(i) = '1' then
                  SelBin <= to_unsigned(i, SelBin'length);
                end if;
              end loop;
              Active <= '1';
            end if;
          else
            if ivld(to_integer(SelBin)) = '1' and ieof(to_integer(SelBin)) = '1' then
              SelBin <= (others => '-');
              Active <= '0';
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

  odat <= (others => 'X') when Is_X(std_logic_vector(SelBin)) else idat(to_integer(SelBin));
  oeof <= 'X'             when Is_X(std_logic_vector(SelBin)) else ieof(to_integer(SelBin));
  genGots: for i in 0 to N-1 generate
    igot(i) <= '0' when Active  = '0' else
               '0' when oful    = '1' else
               'X' when Is_X(std_logic_vector(SelBin)) else
               '0' when SelBin /= to_unsigned(i, SelBin'length) else
               ivld(i);
  end generate genGots;
  oput <= Active and ivld(to_integer(SelBin)) and not oful;

  -- Arbitration
  blkArbit: block is
    signal pass : std_logic_vector(0 to N-1);
  begin
    pass <= not ivld;
    arbit : arbit_forward
      generic map (
        N => N
      )
      port map (
        tin  => '1',
        have => (others => '0'),
        pass => pass,
        grnt => grnt,
        tout => tout
      );
  end block;

end rtl;
