------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
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
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity:      cdcbus
-- File:        cdcbus.vhd
-- Author:      Magnus Hjorth - Cobham Gaisler
-- Description: Register for sampling CDC-crossing signals
------------------------------------------------------------------------------
-- This is functionally just a register with enable, but with extra care
-- taken to avoid metastability when the bus is changing asynchronously.
-- It is assumed that when enable is high the bus is known to be stable, the
-- enable is typically determined using signals that have been re-synchronized
-- properly with sync registers from the other domain.
--
-- Two architectures are implemented:
--  1. Using the grnand2 techmap on all input bits to block any glitches. The
--     nand gates need to be declared as dont_touch in the implementation
--     phase so they are not optimized out.
--  2. Using a clkand on the register so it's not clocked when enable is
--     low.
-- also a technology can implement a different custom strategy if needed.
--

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;

entity cdcbus is
  generic (
    tech   : integer := 0;
    width  : integer := 32
    );
  port (
    busin  : in std_logic_vector(width-1 downto 0);
    clk    : in std_ulogic;
    enable : in std_ulogic;
    busout : out std_logic_vector(width-1 downto 0);
    tsten  : in std_ulogic
    );
end;

architecture a of cdcbus is

  constant cdcbus_arch: tech_ability_type := (
    rhs65 => 2, others => 1);

  signal nbusin,businq: std_logic_vector(width-1 downto 0);
  signal clkg, dlyen: std_ulogic;

begin

  nbusin <= not busin;

  arch1: if cdcbus_arch(tech)=1 generate
    nloop: for i in width-1 downto 0 generate
      n: grnand2
        generic map (tech => tech)
        port map (i0 => nbusin(i), i1 => enable, q => businq(i));
    end generate;
    enreg: process(clk)
    begin
      if rising_edge(clk) then
        if enable='1' then
          busout <= businq;
        end if;
      end if;
    end process;
    clkg <= '0';
  end generate;

  arch2: if cdcbus_arch(tech)=2 generate
    -- Add artificial delay to compensate for clock gate delays
    dlyen <= enable
--pragma translate_off
             after 50 ps
--pragma translate_on
             ;
    businq <= busin
--pragma translate_off
              after 50 ps
--pragma translate_on
              ;
    cg: clkand generic map (tech => tech)
      port map (i => clk, en => dlyen, o => clkg, tsten => tsten);
    busreg: process(clkg)
    begin
      if rising_edge(clkg) then
        busout <= businq;
      end if;
    end process;
  end generate;

end;
