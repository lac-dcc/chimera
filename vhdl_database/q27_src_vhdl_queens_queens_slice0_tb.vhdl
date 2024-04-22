-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-------------------------------------------------------------------------------
-- This file is part of the Queens@TUD solver suite
-- for enumerating and counting the solutions of an N-Queens Puzzle.
--
-- Copyright (C) 2008-2016
--      Thomas B. Preusser <thomas.preusser@utexas.edu>
-------------------------------------------------------------------------------
-- This testbench is free software: you can redistribute it and/or modify
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

entity queens_slice0_tb is
  generic (
    N : positive := 16                  -- Choose your board size
  );
end queens_slice0_tb;


library IEEE;
use IEEE.std_logic_1164.all;

architecture tb of queens_slice0_tb is

  component queens_slice
    generic (
      N : positive;                     -- size of field
      L : natural                       -- number of preplaced columns
    );
    port (
      clk   : in  std_logic;
      rst   : in  std_logic;
      start : in  std_logic;
      BH_l  : in  std_logic_vector(0 to N-2*L-1);
      BU_l  : in  std_logic_vector(0 to 2*N-4*L-2);
      BD_l  : in  std_logic_vector(0 to 2*N-4*L-2);
      BV_l  : in  std_logic_vector(0 to N-2*L-1);
      sol   : out std_logic;
      done  : out std_logic
    );
  end component;

  --Inputs
  signal clk   : std_logic;
  signal rst   : std_logic;
  signal start : std_logic;

  --Outputs
  signal sol  : std_logic;
  signal done : std_logic;

begin

  dut: queens_slice
    generic map (
      N => N,
      L => 0
    )
    port map (
      clk   => clk,
      rst   => rst,
      start => start,
      BH_l  => (others => '0'),
      BV_l  => (others => '0'),
      BU_l  => (others => '0'),
      BD_l  => (others => '0'),
      sol   => sol,
      done  => done
    );

   -- Driver
   process
     procedure cycle is
     begin
       clk <= '0';
       wait for 5 ns;
       clk <= '1';
       wait for 5 ns;
     end;
   begin
     rst   <= '1';
     cycle;
     rst   <= '0';
     start <= '0';
     cycle;
     start <= '1';
     cycle;
     start <= '0';
     while done = '0' loop
       cycle;
     end loop;
     cycle;
     wait;  -- forever
   end process;

   -- Log and Report
   process
     variable cycs : natural;
     variable sols : natural;
   begin
     cycs := 0;
     sols := 0;
     wait until rising_edge(clk) and start = '1';
     loop
       wait until rising_edge(clk);
       cycs := cycs + 1;
       if sol = '1' then
         sols := sols + 1;
       end if;
       exit when done = '1';
     end loop;
     report
       "Found "&integer'image(sols)&
       " solutions in "&integer'image(cycs)&" clock cycles.";
   end process;

end tb;
